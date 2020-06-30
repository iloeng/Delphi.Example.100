unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Winapi.MMSystem, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label_1: TLabel;
    procedure Label1MouseMove(SEnder: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  PtsType = array [0..15, 0..1] of Integer;

var
  Form1: TForm1;
const
  Pts: PtsType = (
    (0, 0), (800, 0), (800, 600),
    (200, 600), (200, 220), (300, 280),
    (265, 205), (350, 117), (205, 170),
    (120, 90), (130, 200), (60, 350), (200, 220),
    (200, 600), (0, 600), (0, 0)
  );

implementation

{$R *.dfm}

Procedure TForm1.Label1MouseMove(SEnder: TObject; Shift: TShiftState; X, Y: Integer);
var
  HRegion1: THandle;
Begin
  HRegion1 := CreatePolygonRgn (Pts, sizeof (Pts) div 8, alternate);
  PlaySound('boom.wav', 0, snd_async);
  SetWindowRgn (Handle, HRegion1, True);
End;

end.
