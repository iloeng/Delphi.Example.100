unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ExtDlgs, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, System.IniFiles, Vcl.Menus;

type
  re=record
    name:string;
    time:integer;
  end;
  TForm1 = class(TForm)
    StringGrid_1: TStringGrid;
    SpeedButton_1: TSpeedButton;
    SpeedButton_2: TSpeedButton;
    SpeedButton_3: TSpeedButton;
    SpeedButton_4: TSpeedButton;
    SpeedButton_5: TSpeedButton;
    Label_1: TLabel;
    Label_2: TLabel;
    Image_1: TImage;
    Timer_1: TTimer;
    ColorDialog_1: TColorDialog;
    OpenPictureDialog_1: TOpenPictureDialog;
    Panel_1: TPanel;
    Image_2: TImage;
    MainMenu_1: TMainMenu;
    N1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    N3: TMenuItem;
    N2: TMenuItem;
    N6: TMenuItem;
    N8: TMenuItem;
    procedure Timer_1Timer(Sender: TObject);
    procedure SpeedButton_4Click(Sender: TObject);
    procedure SpeedButton_1Click(Sender: TObject);
    procedure SpeedButton_2Click(Sender: TObject);
    procedure SpeedButton_3Click(Sender: TObject);
    procedure SpeedButton_5Click(Sender: TObject);
    procedure StringGrid_1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid_1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label_1Click(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
    procedure changit(i, j: integer);
    procedure dl;
    function pd(i, j: integer): boolean;
    procedure readrecord;
    procedure resetit;
    procedure uprecord(name: string; time: integer);
    function winit: boolean;
    procedure writerecord;
  end;

var
  Form1: TForm1;
  count:integer;
  arr:array [1..11] of re;

implementation

uses Unit2, Unit3;

{$R *.dfm}

procedure TForm1.readrecord;
var
  i:integer;
  fi:tinifile;
begin
  fi:=tinifile.Create(extractfilepath(paramstr(0))+'\wzpt.ini');
  for i:=1 to 10 do
  begin
    arr[i].name:=fi.ReadString('record','name'+inttostr(i),'未名');
    arr[i].time:=fi.ReadInteger('record','time'+inttostr(i),1999);
  end;
  fi.Destroy;
end;

procedure TForm1.writerecord;
var
  i:integer;
  fi:tinifile;
begin
  fi:=tinifile.Create(extractfilepath(paramstr(0))+'\wzpt.ini');
  for i:=1 to 10 do
  begin
    fi.writestring('record','name'+inttostr(i),arr[i].name);
    fi.writeInteger('record','time'+inttostr(i),arr[i].time);
  end;
  fi.Destroy;
end;


procedure TForm1.uprecord(name:string;time:integer);
var
  i,temp,j:integer;
  tm:re;
begin
  arr[11].name:=name;
  arr[11].time:=time;

  for i:=1 to 11 do
  begin
    temp:=i;

    for j:=i to 11 do
    begin
      if (arr[j].time<arr[temp].time) then
        temp:=j;
    end;

    tm:=arr[i];
    arr[i]:=arr[temp];
    arr[temp]:=tm;

  end;

end;

procedure TForm1.resetit;
var
  i,j:integer;
begin
  count:=0;
  for j:=1 to 3 do
  for i:=1 to 6 do
  StringGrid_1.cells[i-1,j-1]:=inttostr(i+(j-1)*6);
  StringGrid_1.cells[6,0]:='0';
  StringGrid_1.refresh;
end;

procedure TForm1.dl;
var
  i,a,b:integer;
begin
  for i:=1 to 1000 do
  begin
    a:=random(6);
    b:=random(3);
    changit(a,b);
  end;
end;

function TForm1.winit:boolean;
var
  i,j:integer;
  go:boolean;
begin
  go:=true;
  for i:=0 to 2 do
  for j:=0 to 5 do
  if strtoint(StringGrid_1.Cells[j,i])<>i*6+j+1 then
    go:=false;
  result:=go;
end;

procedure TForm1.changit(i,j:integer);
var temp:string;
begin
if ((i>=0) and (i<6) and (j>=0) and (j<3)) or ((i=6)and(j=0)) then
begin

if pd(i+1,j) then
begin
temp:=StringGrid_1.cells[i,j];
StringGrid_1.cells[i,j]:=StringGrid_1.cells[i+1,j];
StringGrid_1.cells[i+1,j]:=temp;
end;
if pd(i-1,j) then
begin
temp:=StringGrid_1.cells[i,j];
StringGrid_1.cells[i,j]:=StringGrid_1.cells[i-1,j];
StringGrid_1.cells[i-1,j]:=temp;
end;
if pd(i,j-1) then
begin
temp:=StringGrid_1.cells[i,j];
StringGrid_1.cells[i,j]:=StringGrid_1.cells[i,j-1];
StringGrid_1.cells[i,j-1]:=temp;
end;
if pd(i,j+1) then
begin
temp:=StringGrid_1.cells[i,j];
StringGrid_1.cells[i,j]:=StringGrid_1.cells[i,j+1];
StringGrid_1.cells[i,j+1]:=temp;
end;
end;
end;

function TForm1.pd(i,j:integer):boolean;
begin

if ((i>=0) and (i<6) and (j>=0) and (j<3)) or ((i=6)and(j=0)) then begin
if StringGrid_1.Cells[i,j]='0' then result:=true else result:=false;
end
else result:=false;
end;

procedure TForm1.SpeedButton_2Click(Sender: TObject);
begin
close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  StringGrid_1.Canvas.Font.color:=clFuchsia;
  resetit;
  image_2.picture:=image_1.picture;
end;

procedure TForm1.StringGrid_1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin

  if (acol<6) or (arow<1) then
  begin
    StringGrid_1.Canvas.Brush.Style:=bsDiagCross;
    StringGrid_1.canvas.brush.Color:=clblue;

    StringGrid_1.Canvas.fillrect(rect);
    if StringGrid_1.Cells[acol,arow]<>'0' then
      StringGrid_1.Canvas.CopyRect(rect,image_1.canvas,bounds(((strtoint(stringgrid_1.cells[acol,arow])-1) mod 6)*60,((strtoint(stringgrid_1.cells[acol,arow])-1) div 6)*60,60,60));
    if speedbutton_5.down then
      stringgrid_1.Canvas.TextOut(rect.left+2,rect.top+2,StringGrid_1.cells[acol,arow]);
  end
  else
  begin
  StringGrid_1.Canvas.Brush.Style:=bsDiagCross;
  StringGrid_1.canvas.brush.Color:=clblue;
  StringGrid_1.Canvas.fillrect(rect);
  end;

end;

procedure TForm1.StringGrid_1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var st:string;
begin
  if speedbutton_3.Down then
  begin
  changit(acol,arow);
  if winit then
    begin
      speedbutton_3.Down:=false;
      n4.checked:=false;
      timer_1.Enabled:=false;
      messagebox(handle,pchar('您真是太棒了！'+#13+'共用了'+inttostr(count div 60)+'分'+inttostr(count mod 60)+'秒'),'智力拼图1.0',0);

      if InputQuery('请输入您的大名:','您的姓名:',st) then
      begin
        readrecord;
        if st='' then st:='未名';
        uprecord(st,count);
        writerecord;
      end;
      count:=0;
      label_2.caption:='时间:0分0秒';
    end;

  end;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
  speedbutton_3.down:=not speedbutton_3.down;
  speedbutton_3.click;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
  form2.showmodal;
end;

procedure TForm1.SpeedButton_5Click(Sender: TObject);
begin
  StringGrid_1.Refresh;
end;

procedure TForm1.SpeedButton_3Click(Sender: TObject);
begin
if speedbutton_3.down then dl else resetit;
    n4.Checked:=not n4.checked;
    timer_1.Enabled:=not timer_1.enabled;
end;

procedure TForm1.SpeedButton_1Click(Sender: TObject);
begin
if OpenPictureDialog_1.execute then
  begin
     image_1.Picture.LoadFromFile(OpenPictureDialog_1.filename);
     image_2.picture.loadfromfile(OpenPictureDialog_1.filename);
     StringGrid_1.Refresh;
  end;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
  speedbutton_1.click;
end;

procedure TForm1.Label_1Click(Sender: TObject);
begin
  if colordialog_1.execute then
  begin
    stringgrid_1.canvas.font.Color:=colordialog_1.Color;
    label_1.font.color:=colordialog_1.color;
    stringgrid_1.refresh;
  end;
end;

procedure TForm1.Timer_1Timer(Sender: TObject);
begin
   count:=count+1;
   label_2.caption:='时间:'+inttostr(count div 60)+'分'+inttostr(count mod 60)+'秒';
end;

procedure TForm1.SpeedButton_4Click(Sender: TObject);
begin
  form3.showmodal;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
  form3.showmodal;
end;
end.
