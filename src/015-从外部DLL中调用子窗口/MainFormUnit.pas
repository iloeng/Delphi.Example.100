unit MainFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TForm1 = class(TForm)
    MainMenu_1: TMainMenu;
    MDIChildForm1: TMenuItem;
    procedure MDIChildForm1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

T_ProvaChild = procedure (ParentApplication: TApplication; ParentForm: TForm); stdcall;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.MDIChildForm1Click(Sender: TObject);
var
  DllHandle: THandle;
  ProcAddr: FarProc;
  ProvaChild: T_ProvaChild;
begin
  DllHandle := LoadLibrary('DllMdiChildForm');
  ProcAddr := GetProcAddress(DllHandle, 'ProvaChild');
  if ProcAddr <> nil then
  begin
    ProvaChild := ProcAddr;
    ProvaChild(Application,Self);
  end;
end;

end.
