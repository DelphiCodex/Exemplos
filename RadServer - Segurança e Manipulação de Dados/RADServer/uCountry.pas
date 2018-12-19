unit uCountry;

// EMS Resource Module

interface

uses
  System.SysUtils, System.Classes, System.JSON,
  EMS.Services, EMS.ResourceAPI, EMS.ResourceTypes, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.IB, FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, uJSONHelper, FireDAC.ConsoleUI.Wait, FireDAC.Comp.UI,
  FireDAC.Phys.IBBase, UDM;

type

  [ResourceName('country')]
  TCountryResource1 = class(TDataModule)
  private
    function MakeJSON(pChave, pValor : String): TJSONObject; //It takes an integer as a parameter and returns a JSON Object.
  published
    procedure Get(const AContext: TEndpointContext;
      const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
    [ResourceSuffix('{item}')]
    procedure GetItem(const AContext: TEndpointContext;
      const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
    procedure Post(const AContext: TEndpointContext;
      const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
    [ResourceSuffix('{item}')]
    procedure PutItem(const AContext: TEndpointContext;
      const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
    [ResourceSuffix('{item}')]
    procedure DeleteItem(const AContext: TEndpointContext;
      const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
  end;

var
  dm : Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TCountryResource1.Get(const AContext: TEndpointContext;
  const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
begin
  dm.CountryTable.SQL.Text := 'SELECT * FROM PAISES ORDER BY PAI_DESCRICAO';
  AResponse.Body.SetStream(dm.CountryTable.AsJSONStream, 'application/json', True);
end;

procedure TCountryResource1.GetItem(const AContext: TEndpointContext;
  const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  LItem : string;
begin
  LItem := ARequest.Params.Values['item'];
  if LItem.IsEmpty then
    AResponse.RaiseBadRequest('faltando parâmetro');

  dm.CountryTable.SQL.Text := 'SELECT * FROM PAISES WHERE PAI_ID = :ID';
  dm.CountryTable.Params[0].AsString := LItem;

  AResponse.Body.SetStream(dm.CountryTable.AsJSONStream, 'application/json', True);
end;

procedure TCountryResource1.Post(const AContext: TEndpointContext;
  const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  LJSON: TJSONObject;
begin
  if not SameText(ARequest.Body.ContentType, 'application/json') then
    AResponse.RaiseBadRequest('erro de tipo de conteúdo');

  if not ARequest.Body.TryGetObject(LJSON) then
    AResponse.RaiseBadRequest('erro de stream');

  dm.CountryTable.Open('SELECT * FROM PAISES WHERE (1=2)');
  dm.CountryTable.InsertFromJSON(LJSON);
  dm.CountryTable.ApplyUpdates(-1);
end;

procedure TCountryResource1.PutItem(const AContext: TEndpointContext;
  const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  LJSON: TJSONObject;
  LItem: string;
begin
  if not SameText(ARequest.Body.ContentType, 'application/json') then
    AResponse.RaiseBadRequest('erro de tipo de conteúdo');

  if not ARequest.Body.TryGetObject(LJSON) then
    AResponse.RaiseBadRequest('erro de stream');

  LItem := ARequest.Params.Values['item'];
  if LItem.IsEmpty then
    AResponse.RaiseBadRequest('faltando parâmetro');

  dm.CountryTable.SQL.Text := 'SELECT * FROM PAISES WHERE PAI_ID = :ID';
  dm.CountryTable.Params[0].AsString := LItem;
  dm.CountryTable.Open;

  dm.CountryTable.UpdateFromJSON(LJSON);
  dm.CountryTable.ApplyUpdates(-1);
end;

procedure TCountryResource1.DeleteItem(const AContext: TEndpointContext;
  const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  LItem: string;
begin
  if AContext.User = nil then
    EEMSHTTPError.RaiseUnauthorized('', 'Informe Usuário');
  if not AContext.User.Groups.Contains('Admin') then
    EEMSHTTPError.RaiseForbidden('', 'Informe Administrador');

  LItem := ARequest.Params.Values['item'];
  if LItem.IsEmpty then
    AResponse.RaiseBadRequest('faltando parâmetro');

  dm.connInteli.StartTransaction;

  try
    dm.CountryTable.SQL.Text := dm.FDUpdateSQLCountry.DeleteSQL.Text;
    dm.CountryTable.Params[0].AsString := LItem;
    dm.CountryTable.ExecSQL;
    dm.connInteli.Commit;
  except
    on E: Exception do
    begin
      dm.connInteli.Rollback;
      AResponse.RaiseBadRequest(E.Message);
    end;
  end;
end;

function TCountryResource1.MakeJSON(pChave, pValor : String): TJSONObject;
begin
  Result := TJSONObject.Create;
  Result.AddPair(pChave, TJSONNumber.Create(pValor));
end;

procedure Register;
begin
  RegisterResource(TypeInfo(TCountryResource1));
end;

initialization
  dm := TDM.Create(nil);
  Register;

finalization
  FreeAndNil(dm);

end.
