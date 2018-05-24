object Form2: TForm2
  Left = 1082
  Top = 375
  Width = 730
  Height = 447
  Caption = 'Form2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 227
    Height = 13
    Caption = 'Kt'#243'ra marka nie nale'#380'y do Coca-Cola Company?'
  end
  object ComboBox1: TComboBox
    Left = 32
    Top = 40
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    Text = 'ComboBox1'
    Items.Strings = (
      'a. Mercedes'
      'b. Toyota'
      'c. Volvo')
  end
  object Button1: TButton
    Left = 80
    Top = 88
    Width = 75
    Height = 25
    Caption = 'NEXT'
    TabOrder = 1
    OnClick = Button1Click
  end
end
