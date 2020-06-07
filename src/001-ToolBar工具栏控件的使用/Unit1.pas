unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ToolWin;

type
  TForm1 = class(TForm)
    ToolBar_1: TToolBar;
    ToolButton_1: TToolButton;
    ToolButton_2: TToolButton;
    ToolButton_3: TToolButton;
    ToolButton_4: TToolButton;
    ImageList_Normal: TImageList;
    ImageList_Disa: TImageList;
    ImageList_Hot: TImageList;
    PopupMenu_1: TPopupMenu;
    CheckBox_1: TCheckBox;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure CheckBox_1Click(Sender: TObject);
    procedure ToolButton_3Click(Sender: TObject);
    procedure ToolButton_1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.CheckBox_1Click(Sender: TObject);
begin
  ToolBar_1.Flat := CheckBox_1.Checked;
end;

procedure TForm1.ToolButton_1Click(Sender: TObject);
begin
  CheckBox_1.Checked := True;
  ToolBar_1.Flat := CheckBox_1.Checked;
end;

procedure TForm1.ToolButton_3Click(Sender: TObject);
begin
  if ToolButton_1.Enabled then
    ShowMessage('本按钮处在选中状态，按钮一不可使用');
  ToolButton_1.Enabled := not ToolButton_3.Down;
end;

end.
