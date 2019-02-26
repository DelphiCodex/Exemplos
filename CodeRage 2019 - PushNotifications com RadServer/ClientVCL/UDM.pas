unit UDM;

interface

uses
  System.SysUtils, System.Classes, IPPeerClient, FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, REST.Backend.ServiceTypes,
  REST.Backend.MetaTypes, System.JSON, REST.Backend.EMSServices, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter, REST.Client, REST.Backend.EndPoint, Data.Bind.Components, Data.Bind.ObjectScope, REST.Backend.BindSource,
  REST.Backend.ServiceComponents, FireDAC.Comp.UI, REST.Backend.EMSProvider, REST.Backend.Providers, REST.Backend.PushTypes;

type
  Tdm = class(TDataModule)
    emsCodeRage: TEMSProvider;
    pushMessages: TBackendPush;
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


end.
