unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ImgList;

type
  TForm2 = class(TForm)
    MainMenu_1: TMainMenu;
    mmiFile: TMenuItem;
    mmiNew: TMenuItem;
    mmiOpen: TMenuItem;
    mmiEdit: TMenuItem;
    mmiCut: TMenuItem;
    mmiCopy: TMenuItem;
    N8: TMenuItem;
    mmiXs: TMenuItem;
    mmiAbout: TMenuItem;
    ImageList_1: TImageList;
    mmiLast: TMenuItem;
    mmiMy: TMenuItem;
    mmiAuthor: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure OnClickDeleteEvent(Sender: TObject);
    procedure mmiCutClick(Sender: TObject);
    procedure mmiXsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

//在设计期设置菜单项的 Click 事件中的动作
procedure TForm2.mmiCutClick(Sender: TObject);
begin
  ShowMessage('this is a sample');
end;

procedure TForm2.mmiXsClick(Sender: TObject);
begin
  mmiXs.Checked := not mmiXs.Checked;
  if not mmiXs.Checked then
    MainMenu_1.Images := nil
  else
    MainMenu_1.Images := ImageList_1;
end;

procedure TForm2.FormCreate(Sender: TObject);
var
  mmiTemp : TMenuItem;
begin
  {动态加入菜单}
  mmiTemp := TMenuItem.Create(MainMenu_1);
  mmiTemp.Name := 'mmiAdd';
  mmiTemp.Caption := '动态加入的菜单项';
  mmiTemp.OnClick := OnClickDeleteEvent;
  mmiFile.Add(mmiTemp);
  {使关于菜单在窗体的右上方显示}
  ModifyMenu(MainMenu_1.Handle, 2, mf_ByPosition or mf_Popup or mf_Help, mmiAbout.Handle, '关于');
end;

procedure TForm2.OnClickDeleteEvent(Sender: TObject);
var
  mmiTemp: TMenuItem;
begin
  if Sender is TMenuItem then
  begin
    mmiTemp := Sender as TMenuItem;
    (mmiTemp).Parent.Delete(mmiTemp.Parent.IndexOf(mmiTemp));
  end;
end;




end.
