unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,Winapi.ShellAPI;

type
  TForm5 = class(TForm)
    MainMenu_1: TMainMenu;
    Files: TMenuItem;
    Edit: TMenuItem;
    About: TMenuItem;
    procedure AboutClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}



procedure TForm5.AboutClick(Sender: TObject);
begin
  ShellAbout(
    Application.MainForm.Handle,
    'Project',
    'Copyright (c) 2017-2020'#13'http://www.liangz.org',
    Application.Icon.Handle
    ) ;
end;

end.
