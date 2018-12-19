unit UDM;

interface

uses
  System.SysUtils, System.Classes, IPPeerClient, FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, REST.Backend.ServiceTypes,
  REST.Backend.MetaTypes, System.JSON, REST.Backend.EMSServices, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter, REST.Client, REST.Backend.EndPoint, Data.Bind.Components, Data.Bind.ObjectScope, REST.Backend.BindSource,
  REST.Backend.ServiceComponents, FireDAC.Comp.UI, REST.Backend.EMSProvider, REST.Backend.Providers, REST.Backend.PushTypes;

type
  Tdm = class(TDataModule)
    emsProvider: TEMSProvider;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    autAcademy: TBackendAuth;
    endpCountryGET: TBackendEndpoint;
    endpCountryACT: TBackendEndpoint;
    respCountry: TRESTResponse;
    rdsaCountry: TRESTResponseDataSetAdapter;
    mtbCountry: TFDMemTable;
    dtsCountry: TDataSource;
    endpCountry2GET: TBackendEndpoint;
    endpCountry2CT: TBackendEndpoint;
    respCountry2: TRESTResponse;
    rdsaCountry2: TRESTResponseDataSetAdapter;
    mtbCountry2: TFDMemTable;
    dtsCountry2: TDataSource;
    mtbCountry2PAI_ID: TIntegerField;
    mtbCountry2PAI_DESCRICAO: TStringField;
    mtbCountryPAI_ID: TIntegerField;
    mtbCountryPAI_COD_IBGE: TWideStringField;
    mtbCountryPAI_DESCRICAO: TWideStringField;
    mtbCountryPAI_SIGLA: TWideStringField;
    mtbCountryPAI_CODIGO: TWideStringField;
    usrUsers: TBackendUsers;
    pushMessages: TBackendPush;
    procedure mtbCountryAfterPost(DataSet: TDataSet);
    procedure mtbCountryAfterDelete(DataSet: TDataSet);
    procedure mtbCountryBeforePost(DataSet: TDataSet);
    procedure autAcademyLoggingIn(Sender: TObject);
  private
    { Private declarations }
    bInsert: boolean;
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  REST.Types, uJSONHelper;


procedure Tdm.autAcademyLoggingIn(Sender: TObject);
var
  LLogin : Boolean;
begin
  LLogin := True;
end;

procedure Tdm.mtbCountryAfterDelete(DataSet: TDataSet);
var
  LMemTable: TFDCustomMemTable;
begin
  LMemTable := MemTableCreateDelta(mtbCountry);
  try
    try
      LMemTable.FilterChanges := [rtDeleted];

      endpCountryACT.ClearBody;
      endpCountryACT.Method := rmDELETE;
      endpCountryACT.ResourceSuffix := LMemTable.FieldByName('COUNTRY').AsString;
      endpCountryACT.Execute;

      mtbCountry.CommitUpdates;
    except
      on E: Exception do
        raise Exception.Create('Error Message: ' + E.Message);
    end;
  finally
    LMemTable.Free;
  end;
end;

procedure Tdm.mtbCountryAfterPost(DataSet: TDataSet);
var
  LMemTable: TFDCustomMemTable;
begin
  LMemTable := MemTableCreateDelta(mtbCountry);
  try
    try
      if bInsert then
      begin
        LMemTable.FilterChanges       := [rtInserted];
        endpCountryACT.Method         := rmPOST;
        endpCountryACT.ResourceSuffix := '';
      end
      else
      begin
        LMemTable.FilterChanges := [rtModified];
        endpCountryACT.Method := rmPUT;
        endpCountryACT.ResourceSuffix := LMemTable.FieldByName('COUNTRY').AsString;
      end;

      endpCountryACT.ClearBody;
      endpCountryACT.AddBody(LMemTable.AsJSONObject);
      endpCountryACT.Execute;

      mtbCountry.CommitUpdates;
    except
      on E: Exception do
        raise Exception.Create('Error Message: ' + E.Message);
    end;
  finally
    LMemTable.Free;
  end;
end;

procedure Tdm.mtbCountryBeforePost(DataSet: TDataSet);
begin
  bInsert := DataSet.State = dsInsert;
end;

end.
