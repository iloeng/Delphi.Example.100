program 从外部DLL中调用子窗口;

uses
  Vcl.Forms,
  MainFormUnit in 'MainFormUnit.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
