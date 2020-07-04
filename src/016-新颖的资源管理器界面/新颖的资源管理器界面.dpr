program 新颖的资源管理器界面;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {FMForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMForm, FMForm);
  Application.Run;
end.
