unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Panel_1: TPanel;
    Button_1: TButton;
    Button_2: TButton;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button_1Click(Sender: TObject);
    procedure Button_2Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    procedure DoInvisible;
    procedure DoVisible;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  FullRgn, ClientRgn, CtlRgn : THandle;

implementation

{$R *.dfm}

procedure TForm1.Button_1Click(Sender: TObject);
begin
  if Button_1.Caption = 'Show' then
  Begin
    DoVisible;
    Button_1.Caption := 'Hide';
  End
  else
  Begin
    DoInvisible;
    Button_1.Caption := 'Show';
  End;
end;

procedure TForm1.Button_2Click(Sender: TObject);
begin
  Application.Terminate;//终止本程序,如果是仅关闭窗体可以使用 Close 过程。
end;

procedure TForm1.DoInvisible;
var
  AControl: TControl;
  A, Margin, X, Y, CtlX, CtlY : Integer;
begin
  Margin := ( Width - ClientWidth ) div 2;
  FullRgn := CreateRectRgn(0, 0, Width, Height);// 创建矩形区域 FullRgn
  X := Margin;
  Y := Height - ClientHeight - Margin;
  ClientRgn := CreateRectRgn( X, Y, X + ClientWidth, Y + ClientHeight );
  // 创建矩形区域 ClientRgn
  CombineRgn( FullRgn, FullRgn, ClientRgn, RGN_DIFF );
  for A := 0 to ControlCount - 1 do
  Begin
    AControl := Controls[A];
    if ( AControl is TWinControl ) or ( AControl is TGraphicControl )
    then with AControl do Begin
      if Visible then Begin
        CtlX := X + Left;
        CtlY := Y + Top;
        CtlRgn := CreateRectRgn( CtlX, CtlY, CtlX + Width, CtlY + Height );
        CombineRgn( FullRgn, FullRgn, CtlRgn, RGN_OR );
      End;
    End;
  End;
  //画好矩形区域后，使之生效
  SetWindowRgn(Handle, FullRgn, TRUE);
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  DoInvisible;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  DeleteObject(ClientRgn);
  DeleteObject(FullRgn);
  DeleteObject(CtlRgn);
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  if Button_1.Caption = 'Show' then//判断当前状态
    DoInvisible
  else
    DoVisible;
end;

Procedure TForm1.DoVisible;
{恢复窗体可视过程,自定义}
Begin
  FullRgn := CreateRectRgn(0, 0, Width, Height);
  CombineRgn(FullRgn, FullRgn, FullRgn, RGN_COPY);
  SetWindowRgn(Handle, FullRgn, TRUE);
End;

end.
