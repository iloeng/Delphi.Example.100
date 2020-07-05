unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.Math;

type
  TForm1 = class(TForm)
    Image_1: TImage;
    Image_2: TImage;
    Image_3: TImage;
    Image_4: TImage;
    Button_1: TButton;
    Button_2: TButton;
    Button_3: TButton;
    Button_4: TButton;
    procedure bmp_rotate(src, dst: tbitmap; angle: extended);
    procedure Button_2Click(Sender: TObject);
    procedure Button_3Click(Sender: TObject);
    procedure Button_4Click(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button_2Click(Sender: TObject);
var
i, j: integer;
begin
//确定旋转后位图的大小
image_2.Picture.Bitmap.Height := image_1.picture.width;
image_2.Picture.Bitmap.Width := image_1.picture.height;
for i := 0 to image_1.Height do
for j := 0 to image_1.Width do
image_2.canvas.Pixels[(-i + image_2.Height),
j] := image_1.canvas.Pixels[j, i];
end;

procedure TForm1.Button_3Click(Sender: TObject);
var
i, j: integer;
begin
//确定旋转后位图的大小
  image_3.Picture.Bitmap.Height := image_1.picture.Height;
  image_3.Picture.Bitmap.Width := image_1.picture.Width;
  for i := 0 to image_1.Height do
  for j := 0 to image_1.Width do
  image_3.canvas.Pixels[(image_1.Width
  - j), (image_1.Height - i)] := image_1.canvas.Pixels[j, i];
end;

procedure TForm1.Button_4Click(Sender: TObject);
var
  i, j: integer;
begin
//确定旋转后位图的大小
  Image_4.Picture.Bitmap.Height := image_1.picture.Height;
  Image_4.Picture.Bitmap.Width := image_1.picture.Width;
  for i := 0 to image_1.Height do
  for j := 0 to image_1.Width do
    image_4.canvas.Pixels[i, (image_1.Width-j)] := image_1.canvas.Pixels[j, i];
end;

procedure TForm1.bmp_rotate(src, dst: tbitmap; angle: extended);
var
  c1x, c1y, c2x, c2y: integer;
  p1x, p1y, p2x, p2y: integer;
  radius, n: integer;
  alpha: extended;
  c0, c1, c2, c3: tcolor;
begin
  //将角度转换为PI值
  angle := (angle / 180) * pi;
  // 计算中心点，你可以修改它
  c1x := src.width div 2;
  c1y := src.height div 2;
  c2x := dst.width div 2;
  c2y := dst.height div 2;

  // 步骤数值number
  if c2x < c2y then
    n := c2y
  else
    n := c2x;
  dec(n, 1);

  // 开始旋转
  for p2x := 0 to n do begin
      for p2y := 0 to n do begin
          if p2x = 0 then
            alpha := pi / 2
          else
            alpha := arctan2(p2y, p2x);
          radius := round(sqrt((p2x * p2x) + (p2y * p2y)));
          p1x := round(radius * cos(angle + alpha));
          p1y := round(radius * sin(angle + alpha));

          c0 := src.canvas.pixels[c1x + p1x, c1y + p1y];
          c1 := src.canvas.pixels[c1x - p1x, c1y - p1y];
          c2 := src.canvas.pixels[c1x + p1y, c1y - p1x];
          c3 := src.canvas.pixels[c1x - p1y, c1y + p1x];

          dst.canvas.pixels[c2x + p2x, c2y + p2y] := c0;
          dst.canvas.pixels[c2x - p2x, c2y - p2y] := c1;
          dst.canvas.pixels[c2x + p2y, c2y - p2x] := c2;
          dst.canvas.pixels[c2x - p2y, c2y + p2x] := c3;
        end;
      application.processmessages
    end;
end;

end.
