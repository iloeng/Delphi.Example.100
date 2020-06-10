program 在标题栏中自定义按钮;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
