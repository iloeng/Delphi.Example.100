object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 157
  ClientWidth = 396
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu_1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu_1: TMainMenu
    Left = 152
    Top = 32
    object MDIChildForm1: TMenuItem
      Caption = 'MDIChildForm1'
      OnClick = MDIChildForm1Click
    end
  end
end
