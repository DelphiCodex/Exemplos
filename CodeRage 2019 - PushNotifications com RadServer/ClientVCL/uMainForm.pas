unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IPPeerClient, REST.Backend.ServiceTypes,
  System.JSON, REST.Backend.EMSProvider, Data.Bind.Components,
  Data.Bind.ObjectScope, REST.Client, REST.Backend.EndPoint,
  REST.Backend.EMSServices, Data.DB, REST.Backend.MetaTypes,
  REST.Backend.BindSource, REST.Backend.ServiceComponents, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, REST.Response.Adapter,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Vcl.DBCtrls,

  REST.Backend.PushTypes, EMSHosting.ExtensionsServices, REST.Backend.Providers, EMSHosting.EdgeService;

type
  TMainForm = class(TForm)
    memDados: TMemo;
    edtTokenUser: TEdit;
    EMSEdgeService1: TEMSEdgeService;
    btnSendPush: TButton;
    Label1: TLabel;
    btnUsers: TButton;
    edtMensagem: TEdit;
    Label2: TLabel;
    procedure btnUsersClick(Sender: TObject);
    procedure btnSendPushClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses UDM;

procedure TMainForm.btnSendPushClick(Sender: TObject);
var
  Data: TPushData;
  LTarget : TJSONValue;
  LTargetText : String;

  LTargetWhere, LTargetDevice, LTargetIn : TJSONObject;
  LTargetInItems : TJSONArray;
begin
  Data := TPushData.Create;

  try
    Data.GCM.Title   := 'Título';
    Data.GCM.Message := edtMensagem.Text; // 'Usuário: ' + '1 ' + ' - id: ' + '2';

    (*

      {
          "where": {
              "deviceToken": {
                  "$in": ["123"]
              }
          }
      }

    *)

    {Criando JSON conforme string acima}
    LTargetWhere    := TJSONObject.Create; // ('where');
    LTargetDevice   := TJSONObject.Create; // ('deviceToken'
    LTargetIn       := TJSONObject.Create; // ('$in')
    LTargetInItems  := TJSONArray.Create;  // Items

    {Items do array}
    LTargetInItems.Add(Trim(edtTokenUser.Text));

    LTargetIn.AddPair('$in', LTargetInItems);
    LTargetDevice.AddPair('deviceToken', LTargetIn);
    LTargetwhere.AddPair('where', LTargetDevice);

    LTarget := TJSONObject.ParseJSONValue(LTargetwhere.ToString);

    if (Trim(edtTokenUser.Text) <> '') then
    begin
      dm.pushMessages.PushAPI.PushToTarget(Data, TJSONObject(LTarget));
    end
      else
      begin
        dm.pushMessages.PushAPI.PushBroadcast(Data);
      end;
  finally
    Data.Free;
  end;
end;

procedure TMainForm.btnUsersClick(Sender: TObject);
var
  LInstalacoes : TJSONArray;
  LMeta, LChannels : TJSONValue;

  Lid, LdeviceToken, LdeviceType, LMetaString,
  Lcreated, Lupdated : string;

begin
  LInstalacoes := TJSONArray.Create;
  LMeta        := TJSONValue.Create;
  LChannels    := TJSONValue.Create;

//  dm.usrUsers.Users.QueryUsers(LListaUsuarios, LUsuarios);

  if dm.emsCodeRage.BaseURL <> '' then
    (dm.pushMessages.ProviderService as IGetEMSApi).EMSAPI.QueryInstallations([], LInstalacoes)
  else
    raise Exception.Create('Erro ...');

  memDados.Lines.Clear;

  for var i : Integer := 0 to LInstalacoes.Count-1 do
  begin
    LInstalacoes.Items[i].TryGetValue('_id', Lid);
    LInstalacoes.Items[i].TryGetValue('deviceToken', LdeviceToken);
    LInstalacoes.Items[i].TryGetValue('deviceType', LdeviceType);

    {_meta}
    LMeta := (LInstalacoes.Items[i] as TJSONObject).Get('_meta').JsonValue;

    LMeta.TryGetValue('created', Lcreated);
    LMeta.TryGetValue('updated', Lupdated);

    {_channels}
{
    LMeta := (LInstalacoes.Items[i] as TJSONObject).Get('channels').JsonValue;

    LMeta.TryGetValue('created', Lcreated);
    LMeta.TryGetValue('updated', Lupdated);
}

    memDados.Lines.Add('_id: '          + Lid);
    memDados.Lines.Add('deviceToken: '  + LdeviceToken);
    memDados.Lines.Add('deviceType: '   + LdeviceType);
    memDados.Lines.Add('---------- _meta: ');
    memDados.Lines.Add('created: '      + Lcreated);
    memDados.Lines.Add('updated: '      + Lupdated);
    memDados.Lines.Add('---------- channels: ');
    memDados.Lines.Add(' ');
    memDados.Lines.Add('-----------------------------');
  end;
end;

end.
