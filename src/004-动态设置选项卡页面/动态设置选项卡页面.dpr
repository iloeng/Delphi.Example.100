program 动态设置选项卡页面;

uses
  Vcl.Forms,
  Unit4 in 'Unit4.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
