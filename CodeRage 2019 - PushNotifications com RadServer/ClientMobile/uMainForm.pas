unit uMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, IPPeerClient, REST.Backend.PushTypes, System.JSON,
  REST.Backend.EMSPushDevice, System.PushNotification, Data.Bind.Components,
  Data.Bind.ObjectScope, REST.Backend.BindSource, REST.Backend.PushDevice,
  REST.Backend.EMSProvider, FMX.ScrollBox, FMX.Memo, REST.Backend.EMSServices,
  REST.Backend.ServiceTypes, REST.Backend.MetaTypes, REST.Backend.ServiceComponents,

  {$IFDEF ANDROID}
    Androidapi.JNI.GraphicsContentViewText, AndroidApi.Helpers,
    Androidapi.JNI.Provider, Androidapi.JNIBridge,
    Androidapi.JNI.JavaTypes, Androidapi.JNI.Os, Androidapi.jni.App,
  {$ENDIF}

  {$IFDEF IOS}
    iOSApi.UIKit,
    iOSapi.Foundation,
    Macapi.Helpers,
  {$ENDIF}

  Androidapi.JNI.Telephony, System.Permissions;


type
  TMainForm = class(TForm)
    ToolBar1: TToolBar;
    Label1: TLabel;
    emsCodeRage: TEMSProvider;
    pushEvents1: TPushEvents;
    Memo1: TMemo;
    procedure pushEvents1DeviceRegistered(Sender: TObject);
    procedure pushEvents1DeviceTokenReceived(Sender: TObject);
    procedure pushEvents1DeviceTokenRequestFailed(Sender: TObject;
      const AErrorMessage: string);
    procedure pushEvents1PushReceived(Sender: TObject; const AData: TPushData);
    procedure FormCreate(Sender: TObject);
  private
    procedure AtivaPush;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses System.Threading;

{$R *.fmx}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  AtivaPush;
end;

procedure TMainForm.pushEvents1DeviceRegistered(Sender: TObject);
begin
  Memo1.Lines.Add('Device Registrado');
  Memo1.Lines.Add('');
end;

procedure TMainForm.pushEvents1DeviceTokenReceived(Sender: TObject);
begin
  Memo1.Lines.Add('Token Recebido');
  Memo1.Lines.Add('ID: ' + PushEvents1.DeviceID);
  Memo1.Lines.Add('Token: ' + PushEvents1.DeviceToken);

  Memo1.Lines.Add('');
end;

procedure TMainForm.pushEvents1DeviceTokenRequestFailed(Sender: TObject;
  const AErrorMessage: string);
begin
  Memo1.Lines.Add('Falha RequestFailed');
  Memo1.Lines.Add(AErrorMessage);
  Memo1.Lines.Add('');
end;

procedure TMainForm.pushEvents1PushReceived(Sender: TObject; const AData: TPushData);

begin
  Memo1.Lines.Add('Mensagem ' + AData.GCM.Title + ' recebida');
  Memo1.Lines.Add(AData.GCM.Message);
  Memo1.Lines.Add('------------------');
end;

procedure TMainForm.AtivaPush;
begin
  TTask.Run(
    procedure
    begin
      PushEvents1.Active := True;
    end);
end;

end.
