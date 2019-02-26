program ClientVCL;

uses
  Vcl.Forms,
  uMainForm in 'uMainForm.pas' {MainForm},
  UDM in 'UDM.pas' {dm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
