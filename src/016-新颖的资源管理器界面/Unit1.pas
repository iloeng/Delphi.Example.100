unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Menus, Vcl.Grids,
  Vcl.Outline, Vcl.Samples.DirOutln, Vcl.StdCtrls, Vcl.FileCtrl, Vcl.Tabs,
  Vcl.ExtCtrls;

type
  TFMForm = class(TForm)
    DriveTabSet: TTabSet;
    FileList: TFileListBox;
    DirectoryOutline: TDirectoryOutline;
    MainMenu_1: TMainMenu;
    MenuItem_1: TMenuItem;
    StatusBar: TStatusBar;
    Panel_1: TPanel;
    Panel_2: TPanel;
  private
    { Private declarations }
    procedure ConfirmChange(const ACaption, FromFile, ToFile: string);
  public
    { Public declarations }
  end;

var
  FMForm: TFMForm;

implementation

{$R *.dfm}

end.
