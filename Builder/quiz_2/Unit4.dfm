object Form4: TForm4
  Left = 1464
  Top = 500
  Width = 360
  Height = 135
  Caption = 'Form4'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 16
    Width = 337
    Height = 24
    Caption = 'Czy prze'#380'yjemy bez pszcz'#243#322' miodnych?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 48
    Top = 56
    Width = 75
    Height = 25
    Caption = 'TAK'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 176
    Top = 56
    Width = 73
    Height = 25
    Caption = 'NIE'
    TabOrder = 1
    OnClick = Button2Click
  end
end
