unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TMainForm = class(TForm)
    Button_1: TButton;
    Button_2: TButton;
    procedure Button_1Click(SEnder: TObject);
    procedure Button_2Click(SEnder: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation
uses Child1Unit, Child2Unit;
{$R *.dfm}

Procedure OpenChildForm(FormClass: TFormClass; var Fm; AOwner:TComponent);
{自定义打开子窗体主函数}
var
  i: integer;
  Child:TForm;
Begin
  for i := 0 to Screen.FormCount -1 do
  //找到和 FormClass 参数相同的窗体,即子窗体已经存在
    if Screen.Forms[i].ClassType=FormClass then
    Begin
      Child:=Screen.Forms[i];
      if Child.WindowState=wsMinimized then//子窗体最小化状态处理
        ShowWindow(Child.handle,SW_SHOWNORMAL)
      else
        ShowWindow(Child.handle,SW_SHOWNA);
      //子窗体不可视状态处理
      if (not Child.Visible) then Child.Visible:=True;
        Child.BringToFront;//子窗体到顶层窗体
        Child.Setfocus; //子窗体给焦点
        TForm(Fm):=Child;
        exit;
    End;
  //子窗体为未打开状态则新建子窗体
    Child:=TForm(FormClass.NewInstance);
    TForm(Fm):=Child;
    Child.Create(AOwner);
End;

Procedure TMainForm.Button_1Click(SEnder: TObject);
{调用函数打开子窗体一}
Begin
  OpenChildForm(TChildForm1,ChildForm1, Self);
End;

Procedure TMainForm.Button_2Click(SEnder: TObject);
{调用函数打开子窗体二}
Begin
  OpenChildForm(TChildForm2,ChildForm2, Self);
End;

end.
