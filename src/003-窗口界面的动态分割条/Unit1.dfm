object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter_1: TSplitter
    Left = 225
    Top = 0
    Width = 17
    Height = 299
    MinSize = 40
    ResizeStyle = rsUpdate
    OnCanResize = Splitter_1CanResize
  end
  object Panel_1: TPanel
    Left = 0
    Top = 0
    Width = 225
    Height = 299
    Align = alLeft
    Caption = 'Panel_1'
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitHeight = 283
  end
  object Panel_2: TPanel
    Left = 242
    Top = 0
    Width = 393
    Height = 299
    Align = alClient
    Caption = 'Panel_1'
    TabOrder = 1
    ExplicitLeft = 240
    ExplicitWidth = 395
  end
end
