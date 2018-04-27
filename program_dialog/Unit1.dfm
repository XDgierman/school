object Form1: TForm1
  Left = 192
  Top = 124
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Form1'
  ClientHeight = 617
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RichEdit1: TRichEdit
    Left = 0
    Top = 0
    Width = 537
    Height = 617
    Lines.Strings = (
      'RichEdit1')
    TabOrder = 0
  end
  object MainMenu1: TMainMenu
    Left = 480
    object File1: TMenuItem
      Caption = 'File'
      object New1: TMenuItem
        Caption = 'New'
        OnClick = New1Click
      end
      object Open1: TMenuItem
        Caption = 'Open'
        OnClick = Open1Click
      end
      object Save1: TMenuItem
        Caption = 'Save'
        OnClick = Save1Click
      end
      object Print1: TMenuItem
        Caption = 'Print'
        OnClick = Print1Click
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Edit1: TMenuItem
      Caption = 'Edit'
      object Paste1: TMenuItem
        Caption = 'Paste'
        OnClick = Paste1Click
      end
      object Copy1: TMenuItem
        Caption = 'Copy'
        OnClick = Copy1Click
      end
      object Cut1: TMenuItem
        Caption = 'Cut'
        OnClick = Cut1Click
      end
      object SelectAll1: TMenuItem
        Caption = 'Select All'
        OnClick = SelectAll1Click
      end
    end
    object Options1: TMenuItem
      Caption = 'Options'
      object Font1: TMenuItem
        Caption = 'Font'
        OnClick = Font1Click
      end
      object Colour1: TMenuItem
        Caption = 'Color'
        OnClick = Colour1Click
      end
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Text file (.txt)|*.txt|Other|*.*'
    Left = 504
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Text files (.txt)|*.txt|Other|*.*'
    Left = 456
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MinFontSize = 0
    MaxFontSize = 0
    Left = 432
  end
  object ColorDialog1: TColorDialog
    Ctl3D = True
    Left = 408
  end
  object PrintDialog1: TPrintDialog
    Left = 384
  end
end
