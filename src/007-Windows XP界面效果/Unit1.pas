unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ImgList, Vcl.ToolWin, Vcl.Menus;

type
  TForm1 = class(TForm)
    MainMenu_1: TMainMenu;
    PopupMenu_1: TPopupMenu;
    File1: TMenuItem;
    Edit: TMenuItem;
    Language: TMenuItem;
    Help1: TMenuItem;
    CoolBar_1: TCoolBar;
    ToolBar_1: TToolBar;
    ToolBar_2: TToolBar;
    ImageList_1: TImageList;
    FontDialog1: TFontDialog;
    OpenDialog_1: TOpenDialog;
    SaveDialog_1: TSaveDialog;
    PrintDialog_1: TPrintDialog;
    Panel_1: TPanel;
    Bevel_1: TBevel;
    RichEdit_1: TRichEdit;
    StatusBar_1: TStatusBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
