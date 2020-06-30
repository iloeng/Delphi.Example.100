program 只允许建立一次子窗体的MDI程序;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  Child1Unit in 'Child1Unit.pas' {ChildForm1},
  Child2Unit in 'Child2Unit.pas' {ChildForm2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TChildForm1, ChildForm1);
  Application.CreateForm(TChildForm2, ChildForm2);
  Application.Run;
end.
