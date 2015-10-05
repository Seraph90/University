object Form2: TForm2
  Left = 293
  Top = 300
  Width = 625
  Height = 424
  Caption = #1047#1072#1083#1080#1074#1082#1072' '#1087#1086#1083#1080#1075#1086#1085#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object SG_R: TStringGrid
    Left = 8
    Top = 8
    Width = 481
    Height = 185
    ColCount = 7
    FixedCols = 0
    RowCount = 2
    TabOrder = 0
  end
  object SG_AR: TStringGrid
    Left = 8
    Top = 200
    Width = 481
    Height = 185
    ColCount = 7
    FixedCols = 0
    RowCount = 2
    TabOrder = 1
  end
  object SG_P: TStringGrid
    Left = 496
    Top = 8
    Width = 113
    Height = 185
    ColCount = 3
    DefaultColWidth = 32
    FixedCols = 0
    RowCount = 6
    TabOrder = 2
  end
  object Button1: TButton
    Left = 496
    Top = 200
    Width = 75
    Height = 25
    Caption = 'B_FTR'
    TabOrder = 3
    OnClick = B_FTRClick
  end
  object XPManifest1: TXPManifest
    Left = 736
    Top = 544
  end
end
