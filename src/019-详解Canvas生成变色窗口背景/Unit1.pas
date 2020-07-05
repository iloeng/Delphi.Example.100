unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TForm1 = class(TForm)
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormPaint(Sender: TObject);
var
  i:Word;
  Dy,y:Real;
begin
  Dy:=ClientHeight/256;
  y:=0;
  for i:=255 Downto 0 do
  begin
    Canvas.brush.color:=$00000000+i*$10000;
    Canvas.fillrect(rect(0,round(y),clientwidth,round(y+Dy)));
    y:=y+Dy;
  end;
end;

end.
