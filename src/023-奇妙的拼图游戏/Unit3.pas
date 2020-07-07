unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls;

type
  TForm3 = class(TForm)
    Label_1: TLabel;
    StringGrid_1: TStringGrid;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation
uses Unit1;
{$R *.dfm}

procedure TForm3.FormShow(Sender: TObject);
var i:integer;
begin
Form1.readrecord;
for i:=1 to 10 do
begin
  stringgrid_1.cells[0,i-1]:='µÚ'+inttostr(i)+'Ãû'+'   '+arr[i].name+'------'+inttostr(arr[i].time div 60)+'·Ö'+inttostr(arr[i].time mod 60)+'Ãë';
end;

end;

end.
