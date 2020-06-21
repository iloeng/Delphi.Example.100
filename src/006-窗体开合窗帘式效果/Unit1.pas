unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button_1: TButton;
    Button_2: TButton;
    Timer_1: TTimer;
    Timer_2: TTimer;
    procedure Timer_1Timer(Sender: TObject);
    procedure Timer_2Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button_1Click(Sender: TObject);
    procedure Button_2Click(Sender: TObject);
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
begin
  Timer_2.Enabled := True;
  Button_2.Visible := True;
end;

procedure TForm1.Button_2Click(Sender: TObject);
begin
  Timer_1.Enabled := True;
  Button_2.Visible := False;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Form1.ClientWidth := 400;
  Form1.ClientHeight := 10;
  Timer_1.Enabled := True;
  Button_2.Visible := False;
end;

procedure TForm1.Timer_1Timer(Sender: TObject);
begin
  if not (Form1.ClientHeight = 350) then
  begin
    Form1.ClientHeight := Form1.ClientHeight + 10;
  end
  else
    Timer_1.Enabled := False;
end;

procedure TForm1.Timer_2Timer(Sender: TObject);
begin
  if not (Form1.ClientHeight = 50) then
  begin
    Form1.ClientHeight := Form1.ClientHeight -10;
  end
  else
    Timer_2.Enabled := False;
end;

end.
