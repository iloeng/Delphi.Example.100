unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TSplashForm = class(TForm)
    Image_1: TImage;
    Timer_1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure Timer_1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SplashForm: TSplashForm;

implementation

{$R *.dfm}

procedure TSplashForm.FormShow(Sender: TObject);
begin
  SetWindowPos(Handle,HWND_TOPMOST,0,0,0,0,SWP_NOMOVE or SWP_NOSIZE);
end;

procedure TSplashForm.Timer_1Timer(Sender: TObject);
begin
  Timer_1.Enabled:=false;//πÿ±’œ‘ æ
  Close;
end;

end.
