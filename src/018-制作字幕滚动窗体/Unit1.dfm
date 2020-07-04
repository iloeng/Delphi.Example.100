object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 316
  ClientWidth = 395
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label_1: TLabel
    Left = 16
    Top = 16
    Width = 48
    Height = 13
    Caption = #25991#26412#20301#32622
  end
  object Label_2: TLabel
    Left = 16
    Top = 48
    Width = 48
    Height = 13
    Caption = #25511#21046#36895#24230
  end
  object Panel_1: TPanel
    Left = 8
    Top = 80
    Width = 379
    Height = 228
    Caption = #23631#24149
    TabOrder = 0
  end
  object Button_1: TButton
    Left = 296
    Top = 8
    Width = 75
    Height = 25
    Caption = #24320#22987'/'#26242#20572
    TabOrder = 1
    OnClick = Button_1Click
  end
  object Button_2: TButton
    Left = 296
    Top = 39
    Width = 75
    Height = 25
    Caption = #37325#26032#24320#22987
    TabOrder = 2
    OnClick = Button_2Click
  end
  object TrackBar_1: TTrackBar
    Left = 70
    Top = 39
    Width = 150
    Height = 45
    TabOrder = 3
    OnChange = TrackBar_1Change
  end
  object Edit_1: TEdit
    Left = 80
    Top = 12
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'TextFile.txt'
  end
  object Timer_1: TTimer
    Interval = 50
    OnTimer = Timer_1Timer
    Left = 216
    Top = 48
  end
end
