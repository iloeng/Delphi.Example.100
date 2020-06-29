object Form5: TForm5
  Left = 0
  Top = 0
  Caption = 'Form5'
  ClientHeight = 238
  ClientWidth = 420
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
    Left = 112
    Top = 64
    object Files: TMenuItem
      Caption = #25991#20214'(&F)'
    end
    object Edit: TMenuItem
      Caption = #32534#36753'(&D)'
    end
    object About: TMenuItem
      Caption = #20851#20110'(&A)'
      OnClick = AboutClick
    end
  end
end
