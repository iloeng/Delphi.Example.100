unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Procedure SysCommand(var Msg: TMessage); message wm_SysCommand;

  public
    { Public declarations }
    procedure About;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  SysMenu: HMENU;
begin
  SysMenu := GetSystemMenu(Handle, False);
  ModifyMenu(SysMenu, SC_CLOSE, MF_BYCOMMAND, SC_CLOSE, '模拟关闭窗口的功能(&C)'#9'Alt+F4');
  DeleteMenu(SysMenu, 0, MF_BYPOSITION);
  AppendMenu(SysMenu, MF_SEPARATOR, 0, #0);
  AppendMenu(SysMenu, MF_BYCOMMAND, 666, '关于(&A)...');

end;

Procedure TForm1.SysCommand(var Msg: TMessage);
Begin
inherited;
  if Msg.wParam = 666 then About;
End;

procedure TForm1.About;
begin
  MessageDlg('您点击了About菜单！', mtInformation, [mbOK], 0);
end;

end.
