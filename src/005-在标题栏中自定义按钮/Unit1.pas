unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons;

type
  TForm4 = class(TForm)
    procedure FormResize(SEnder: TObject);
  private
    { Private declarations }
    CaptionBtn:TRect; //按钮 Rect 所用
    procedure WMNCPaint(var Msg: TWMNCPaint); message WM_NCPaint;
    procedure WMNCActivate(var Msg: TWMNCActivate); message WM_NCACTIVATE;
    procedure WMSetText(var Msg:TWMSetText); message WM_SETTEXT;
    procedure WMNCHitTest(var Msg: TWMNCHitTest); message WM_NCHITTEST;
    procedure WMNCLButtonDown(var Msg : TWMNCLButtonDown); message WM_NCLBUTTONDOWN;
    procedure DrawCaptButton;
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

const
  htCaptionBtn=htSizeLast+1;

{$R *.dfm}

{ TForm4 }

procedure TForm4.FormResize(SEnder: TObject);
begin
  Perform(WM_NCACTIVATE,Word(Active),0);
end;

procedure TForm4.WMNCActivate(var Msg: TWMNCActivate);
begin
inherited;
DrawCaptButton;
end;

procedure TForm4.WMNCHitTest(var Msg: TWMNCHitTest);
begin
inherited;
  with Msg do
    if PtInRect(CaptionBtn,Point(xPos-Left,yPos-Top)) then
      Result:=htCaptionBtn;
end;

procedure TForm4.WMNCLButtonDown(var Msg: TWMNCLButtonDown);
begin
inherited;
  if(Msg.HitTest=htCaptionBtn)then
    Showmessage('添加您想执行的代码');
end;

procedure TForm4.WMNCPaint(var Msg: TWMNCPaint);
begin
Inherited;
  DrawCaptButton;
end;

procedure TForm4.WMSetText(var Msg: TWMSetText);
begin
Inherited;
  DrawCaptButton;
end;

Procedure TForm4.DrawCaptButton;
var
  xFrame,yFrame,xSize,ySize:Integer;
  R:TRect;
Begin
  xFrame:=GetSystemMetrics(SM_CXFRAME);
  yFrame:=GetSystemMetrics(SM_CYFRAME);
  xSize:=GetSystemMetrics(SM_CXSIZE);
  ySize:=GetSystemMetrics(SM_CYSIZE);
  //按钮属性调整->>
  CaptionBtn:=Bounds(Width-xFrame-5*xSize+2,yFrame+2,xSize+13,ySize-4);
  Canvas.Handle:=GetWindowDC(Self.Handle);
  Canvas.Font.Name:='宋体';
  Canvas.Font.Color:=clBlack;
  Canvas.Pen.Color:=clYellow;
  Canvas.Brush.Color:=clBtnFace;
  try
    DrawButtonFace(Canvas,CaptionBtn,1,bsAutoDetect,False,False,False);
    R:=Bounds(Width-xFrame-5*xSize+3,yFrame+3,xSize+10,ySize-7);
    with CaptionBtn do
      Canvas.TextRect(R,R.Left+5,R.Top,'New');
  finally
    ReleaseDC(Self.Handle,Canvas.Handle);
    Canvas.Handle:=0;
  End;

end;

end.
