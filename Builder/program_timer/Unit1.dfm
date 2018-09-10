object Form1: TForm1
  Left = 770
  Top = 256
  Width = 242
  Height = 131
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
  object Label1: TLabel
    Left = 96
    Top = 0
    Width = 94
    Height = 37
    Alignment = taCenter
    Caption = 'Label1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 73
    Height = 73
    Caption = 'GroupBox1'
    TabOrder = 0
    object Button1: TButton
      Left = 8
      Top = 16
      Width = 57
      Height = 17
      Caption = 'Hour +'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 8
      Top = 32
      Width = 57
      Height = 17
      Caption = 'Minute +'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 8
      Top = 48
      Width = 57
      Height = 17
      Caption = 'Sec RES'
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 88
    Top = 48
  end
end
