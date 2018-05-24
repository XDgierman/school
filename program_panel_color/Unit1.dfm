object Form1: TForm1
  Left = 415
  Top = 197
  Width = 258
  Height = 228
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 113
    Height = 105
    TabOrder = 0
  end
  object RadioGroup1: TRadioGroup
    Left = 128
    Top = 8
    Width = 105
    Height = 81
    TabOrder = 1
  end
  object RadioButton1: TRadioButton
    Left = 136
    Top = 24
    Width = 89
    Height = 17
    Caption = 'Red'
    TabOrder = 2
    OnClick = RadioButton1Click
  end
  object RadioButton2: TRadioButton
    Left = 136
    Top = 40
    Width = 89
    Height = 17
    Caption = 'Green'
    TabOrder = 3
    OnClick = RadioButton2Click
  end
  object RadioButton3: TRadioButton
    Left = 136
    Top = 56
    Width = 89
    Height = 17
    Caption = 'Blue'
    TabOrder = 4
    OnClick = RadioButton3Click
  end
  object ScrollBar1: TScrollBar
    Left = 8
    Top = 120
    Width = 225
    Height = 17
    Max = 255
    PageSize = 0
    TabOrder = 5
    OnChange = ScrollBar1Change
  end
  object ScrollBar2: TScrollBar
    Left = 8
    Top = 144
    Width = 225
    Height = 17
    Max = 255
    PageSize = 0
    TabOrder = 6
    OnChange = ScrollBar2Change
  end
  object ScrollBar3: TScrollBar
    Left = 8
    Top = 168
    Width = 225
    Height = 17
    Max = 255
    PageSize = 0
    TabOrder = 7
    OnChange = ScrollBar3Change
  end
  object CheckBox1: TCheckBox
    Left = 128
    Top = 96
    Width = 105
    Height = 17
    Caption = 'Show values'
    TabOrder = 8
  end
end
