unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Winapi.ShellAPI;

type
  TForm2 = class(TForm)
    Image_1: TImage;
    BitBtn_1: TBitBtn;
    Label_1: TLabel;
    Label_2: TLabel;
    Label_3: TLabel;
    procedure BitBtn_1Click(Sender: TObject);
    procedure Label_5Click(Sender: TObject);
    procedure Label_3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.BitBtn_1Click(Sender: TObject);
begin
form2.close;
end;

procedure TForm2.Label_5Click(Sender: TObject);
begin
  ShellExecute(0, nil, 'http://www.liangz.org', nil, nil, SW_NORMAL);
end;

procedure TForm2.Label_3Click(Sender: TObject);
begin
  shellexecute(0,nil,'Darker@liangz.org',nil,nil, SW_SHOWNORMAL);
end;


end.
