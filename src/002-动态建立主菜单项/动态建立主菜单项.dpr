program 动态建立主菜单项;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
