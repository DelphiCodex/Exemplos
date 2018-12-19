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

  REST.Backend.PushTypes;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    btnGetCountry: TButton;
    DBNavigator1: TDBNavigator;
    DBGrid2: TDBGrid;
    btnGetCountry2: TButton;
    Label1: TLabel;
    edtUser: TEdit;
    Label2: TLabel;
    edtPass: TEdit;
    btnLogin: TButton;
    procedure btnGetCountry2Click(Sender: TObject);
    procedure btnGetCountryClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
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

procedure TMainForm.btnGetCountryClick(Sender: TObject);
begin
  try
    dm.mtbCountry.AfterPost   := nil;
    dm.mtbCountry.AfterDelete := nil;

    dm.endpCountryGET.Execute;
    dm.mtbCountry.CommitUpdates;
  finally
    dm.mtbCountry.AfterPost   := dm.mtbCountryAfterPost;
    dm.mtbCountry.AfterDelete := dm.mtbCountryAfterDelete;
  end;
end;

procedure TMainForm.btnLoginClick(Sender: TObject);
begin
  dm.autAcademy.UserName := edtUser.Text;
  dm.autAcademy.Password := edtPass.Text;

  if not dm.autAcademy.LoggedIn then
  begin
    dm.autAcademy.Login;
    btnLogin.Caption := 'Logout';
  end
    else
    begin
      dm.autAcademy.Logout;
      btnLogin.Caption := 'Login';
    end;
end;

procedure TMainForm.btnGetCountry2Click(Sender: TObject);
begin
  try
    dm.endpCountry2GET.Execute;
    dm.mtbCountry2.CommitUpdates;
  finally
  end;
end;

end.
