program 使用PaintBox控件制作画图程序;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form7};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm7, Form7);
  Application.Run;
end.
