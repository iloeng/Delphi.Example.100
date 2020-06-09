unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TForm3 = class(TForm)
    Panel_1: TPanel;
    Panel_2: TPanel;
    Splitter_1: TSplitter;
    procedure Splitter_1CanResize(Sender: TObject; var NewSize: Integer;
      var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Splitter_1CanResize(Sender: TObject; var NewSize: Integer;
  var Accept: Boolean);
begin
  //当要改变的尺寸大小在[150,300]范围内时允许改变
  if (NewSize<150) or (NewSize>300) then
    Accept:=false;
end;

end.
