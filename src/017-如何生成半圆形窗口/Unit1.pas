unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  hRegion: THandle;
begin
  hRegion := CreateEllipticRgn(0, -Height, Width, Height);
  SetWindowRgn(Handle, hRegion, True);
end;

procedure TForm1.FormResize(Sender: TObject);
var
  hRegion: THandle;
begin
  hRegion := CreateEllipticRgn(0, -Height, Width, Height);
  SetWindowRgn(Handle, hRegion, True);
end;

end.
