object Form1: TForm1
  Left = 571
  Top = 239
  Width = 353
  Height = 213
  Caption = 'Playfair cipher'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object SG_C: TStringGrid
    Left = 8
    Top = 8
    Width = 129
    Height = 129
    DefaultColWidth = 24
    FixedCols = 0
    FixedRows = 0
    TabOrder = 0
  end
  object E_PC: TEdit
    Left = 144
    Top = 8
    Width = 185
    Height = 21
    TabOrder = 1
    Text = 'playfair example'
  end
  object B_FT: TButton
    Left = 8
    Top = 144
    Width = 129
    Height = 25
    Caption = 'Fill table'
    TabOrder = 2
    OnClick = B_FTClick
  end
  object B_C: TButton
    Left = 144
    Top = 144
    Width = 89
    Height = 25
    Caption = 'Code'
    TabOrder = 3
    OnClick = B_CClick
  end
  object B_DC: TButton
    Left = 240
    Top = 144
    Width = 91
    Height = 25
    Caption = 'Decode'
    TabOrder = 4
    OnClick = B_DCClick
  end
  object E_T: TEdit
    Left = 144
    Top = 64
    Width = 185
    Height = 21
    TabOrder = 5
    Text = 'Hide the gold in the tree stump'
  end
  object E_C: TEdit
    Left = 144
    Top = 88
    Width = 185
    Height = 21
    TabOrder = 6
  end
  object E_DC: TEdit
    Left = 144
    Top = 112
    Width = 185
    Height = 21
    TabOrder = 7
  end
end
