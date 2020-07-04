unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    Label_1: TLabel;
    Label_2: TLabel;
    Panel_1: TPanel;
    Button_1: TButton;
    Button_2: TButton;
    Timer_1: TTimer;
    TrackBar_1: TTrackBar;
    Edit_1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Timer_1Timer(Sender: TObject);
    procedure Button_1Click(Sender: TObject);
    procedure Button_2Click(Sender: TObject);
    procedure TrackBar_1Change(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure zShowText;
    Procedure zBmpCreate;
    procedure zSetBmp;
    procedure zSetLineHeight;
    procedure zShowLine(sender :TObject);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;


implementation

{$R *.dfm}

var
  currline, LineHeight:integer;
  sItem:TStringList;
  bmp:TBitMap;
  bRect,R1:TRect;
  iDc:HDC;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Timer_1.Enabled:=False;
  iDC:=GetDc(Panel_1.handle);
  Currline:=0;
end;

procedure TForm1.zShowLine(sender :TObject);
begin
  zShowText;
end;

procedure TForm1.Timer_1Timer(Sender: TObject);
begin
  zShowLine(self);//显示字符串
  //bitblt 转移矩形图 (目标句柄，LS x,y,宽，高，源句柄，LS x,y,光栅运算符）
  BitBlt(iDc,0,0,Panel_1.Width,Panel_1.Height,
  Bmp.Canvas.Handle,0,Currline,srcCopy);        //改变currline可实现左移右移
  Inc(Currline,1);
  if Currline>=bRect.Bottom-panel_1.Height+100 then
  begin
    Timer_1.Enabled:=False;
    Currline:=0;
  end;
end;


procedure TForm1.zShowText;
var
  ss:string;
  ReadFile:TextFile;
begin
  AssignFile(ReadFile,Edit_1.Text);
  Reset(ReadFile);
  sItem:=TStringList.Create;
  with sItem do
    while not eof(ReadFile) do
    begin
      Readln(ReadFile,ss);
      add(ss);
    end;
  CloseFile(ReadFile);
  zBmpCreate;
  sItem.Free;//释放串
end;

procedure TForm1.zBmpCreate;   //创建图片
var
  i,y:integer; //y
begin
  if bmp<>nil then bmp.free;
  bmp:=TBitMap.Create;
  zSetBmp;
  R1.Right:=bRect.Right;
  R1.Bottom:=bRect.Bottom;
  y:=Panel_1.Height-100;
  for i:=0 to sItem.Count-1 do // 从0到行数  循环显示图片
  begin
    R1.Top:=y;
    R1.Bottom:=R1.Top+LineHeight;
    //中对齐
    DrawText(Bmp.Canvas.Handle,pChar(sItem[i]),-1,R1,Dt_Center or Dt_Top);
    //左对齐
    //DrawText(Bmp.Canvas.Handle,pChar(sItem[i]),-1,R1,Dt_Left or Dt_Top);
    //右对齐
    //DrawText(Bmp.Canvas.Handle,pChar(sItem[i]),-1,R1,Dt_Right or Dt_Top);

    Inc(y,LineHeight);
  end;
end;

procedure TForm1.zSetBmp;
begin
  zSetLineHeight;
  with bRect do //Rect 矩形坐标(左上x,左下y,右上x,右下y)
  begin
    Top:=0;
    Left:=0;
    Right:=Panel_1.Width;
    Bottom:=LineHeight*sItem.Count+Height;//行高*行数+form高度
  end;
  with Bmp do
  begin
    Height:=bRect.Bottom+100;//图片高度
    Width:=bRect.Right;
    with Canvas do  //canvas 画布
    begin

      FillRect(bRect);
      Brush.Style:=bsClear;
    end;
  end;
end;

procedure TForm1.zSetLineHeight;
{设置行间隔}
var
  Metrics:TTextMetric;  //设置字体 API
begin
  GetTextMetrics(iDc,Metrics);
  LineHeight:=Metrics.tmHeight+Metrics.tmInternalLeading-Bmp.Canvas.Font.Height;
end;

procedure TForm1.Button_1Click(Sender: TObject);
begin
if Edit_1.Text='' then
  ShowMessage('请输入文件地址')
  else
    Timer_1.Enabled:=not Timer_1.Enabled;
end;

procedure TForm1.Button_2Click(Sender: TObject);
begin
  timer_1.Enabled :=false;
  Currline:=0;
  Button_1.Click;
end;

procedure TForm1.TrackBar_1Change(Sender: TObject);
begin
  Timer_1.Interval:=TrackBar_1.Position*5;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  if Bmp<>nil then Bmp.Free;
end;

end.
