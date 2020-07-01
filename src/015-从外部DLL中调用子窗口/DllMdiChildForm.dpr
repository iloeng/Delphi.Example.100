library DllMdiChildForm;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  System.SysUtils,
  System.Classes,
  Winapi.Windows,
  Winapi.Messages,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  UnitDll in 'UnitDll.pas' {Form1};

{$R *.res}

Procedure ProvaChild(ParentApplication: TApplication; ParentForm: TForm); export; stdcall;
var
  Form1: TForm1;
  DllProc: Pointer; //只要当入口指针被调用时就被调用
Begin
  Application := ParentApplication;
  Form1:=TForm1.Create(ParentForm);
  Form1.MyParentForm:=ParentForm;//指定父窗体属性
  Form1.MyParentApplication:=ParentApplication;
  //Winapi.Windows.SetParent(Form1.Handle,ParentForm.Handle);
  //Form1.FormStyle:=fsMDIChild;//设置子窗体风格
  Form1.Show;//显示 Form1 窗体
End;

Procedure DLLUnloadProc(Reason: Integer); register;
Begin
  if Reason = DLL_PROCESS_DETACH then
    Application:=DllApplication;
End;

exports
  ProvaChild;

Begin
  DllApplication:=Application;
  DLLProc := @DLLUnloadProc;
end.
