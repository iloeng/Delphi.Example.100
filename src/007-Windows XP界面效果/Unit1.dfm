object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 257
  ClientWidth = 510
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
  object Bevel_1: TBevel
    Left = 152
    Top = 104
    Width = 50
    Height = 50
  end
  object CoolBar_1: TCoolBar
    Left = 0
    Top = 0
    Width = 510
    Height = 57
    Bands = <
      item
        Control = ToolBar_1
        ImageIndex = -1
        Width = 504
      end
      item
        Control = ToolBar_2
        ImageIndex = -1
        Width = 504
      end>
    object ToolBar_1: TToolBar
      Left = 11
      Top = 0
      Width = 495
      Height = 25
      Caption = 'ToolBar_1'
      DragKind = dkDock
      DragMode = dmAutomatic
      Images = ImageList_1
      TabOrder = 0
    end
    object ToolBar_2: TToolBar
      Left = 11
      Top = 27
      Width = 495
      Height = 25
      Caption = 'ToolBar_2'
      DragKind = dkDock
      DragMode = dmAutomatic
      Images = ImageList_1
      TabOrder = 1
    end
  end
  object Panel_1: TPanel
    Left = 0
    Top = 56
    Width = 508
    Height = 41
    Caption = 'Panel_1'
    TabOrder = 1
  end
  object RichEdit_1: TRichEdit
    Left = 0
    Top = 92
    Width = 558
    Height = 185
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'RichEdit_1')
    ParentFont = False
    TabOrder = 2
    Zoom = 100
  end
  object StatusBar_1: TStatusBar
    Left = 0
    Top = 238
    Width = 510
    Height = 19
    Panels = <>
    ExplicitLeft = 48
    ExplicitTop = 240
    ExplicitWidth = 0
  end
  object MainMenu_1: TMainMenu
    Images = ImageList_1
    Left = 184
    Top = 168
    object File1: TMenuItem
      Caption = 'File'
    end
    object Edit: TMenuItem
      Caption = 'Edit'
    end
    object Language: TMenuItem
      Caption = 'Language'
    end
    object Help1: TMenuItem
      Caption = 'Help'
    end
  end
  object PopupMenu_1: TPopupMenu
    Images = ImageList_1
    Left = 24
    Top = 136
  end
  object ImageList_1: TImageList
    Left = 96
    Top = 144
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 40
    Top = 160
  end
  object OpenDialog_1: TOpenDialog
    Left = 280
    Top = 184
  end
  object SaveDialog_1: TSaveDialog
    Left = 232
    Top = 184
  end
  object PrintDialog_1: TPrintDialog
    Left = 144
    Top = 168
  end
end
