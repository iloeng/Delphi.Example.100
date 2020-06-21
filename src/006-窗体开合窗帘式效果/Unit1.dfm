object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 299
  ClientWidth = 360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button_1: TButton
    Left = 24
    Top = 16
    Width = 75
    Height = 25
    Caption = #21512
    TabOrder = 0
    OnClick = Button_1Click
  end
  object Button_2: TButton
    Left = 256
    Top = 16
    Width = 75
    Height = 25
    Caption = #24320
    TabOrder = 1
    OnClick = Button_2Click
  end
  object Timer_1: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer_1Timer
    Left = 112
    Top = 24
  end
  object Timer_2: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer_2Timer
    Left = 184
    Top = 24
  end
end
