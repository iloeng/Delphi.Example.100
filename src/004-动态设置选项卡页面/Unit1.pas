unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    PageControl_1: TPageControl;
    Button_1: TButton;
    procedure Button_1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button_1Click(Sender: TObject);
var
  tmpTabSheet: TTabSheet;
begin
  if PageControl_1.PageCount > 6 then
    Exit;
  tmpTabSheet := TTabSheet.Create(PageControl_1);
  tmpTabSheet.Caption := '页面' + IntToStr(PageControl_1.PageCount + 1);
  tmpTabSheet.PageControl := PageControl_1;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  with PageControl_1 do
  begin
    HotTrack := True;
    TabPosition := tpBottom;
  end;
end;

end.
