object Form1: TForm1
  Left = 685
  Top = 246
  Width = 650
  Height = 517
  Caption = #1043#1054#1057#1058' 28147-89'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 384
    Top = 8
    Width = 32
    Height = 13
    Caption = #1050#1083#1102#1095':'
  end
  object E_C: TEdit
    Left = 424
    Top = 8
    Width = 201
    Height = 21
    TabOrder = 0
    Text = '12345678901234567890123456789012'
  end
  object B_Code: TButton
    Left = 424
    Top = 264
    Width = 137
    Height = 97
    Caption = #1050#1086#1076#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 1
    OnClick = B_CodeClick
  end
  object B_Decode: TButton
    Left = 424
    Top = 376
    Width = 137
    Height = 97
    Caption = #1044#1077#1082#1086#1076#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 2
    OnClick = B_DecodeClick
  end
  object SG: TStringGrid
    Left = 8
    Top = 264
    Width = 409
    Height = 209
    ColCount = 16
    DefaultColWidth = 24
    FixedCols = 0
    RowCount = 8
    FixedRows = 0
    TabOrder = 3
  end
  object StringGrid1: TStringGrid
    Left = 568
    Top = 264
    Width = 57
    Height = 209
    ColCount = 2
    DefaultColWidth = 24
    FixedCols = 0
    RowCount = 8
    FixedRows = 0
    TabOrder = 4
  end
  object M_Text: TMemo
    Left = 8
    Top = 32
    Width = 201
    Height = 225
    Lines.Strings = (
      'Yami ni madoishi aware na kage,'
      'Hito o kizutsuke otoshime te,'
      'Sumini oboreshi g no tama...'
      'Ippen, shinde miru?'
      ''
      #1058#1099' '#1090#1077#1085#1100', '#1095#1100#1080#1084' '#1076#1086#1084#1086#1084' '#1089#1090#1072#1083#1072' '#1090#1100#1084#1072
      #1063#1091#1078#1072#1103' '#1073#1086#1083#1100' '#1085#1086' '#1090#1088#1086#1075#1072#1083#1072' '#1090#1077#1073#1103
      #1058#1074#1086#1103' '#1076#1091#1096#1072' '#1074#1086' '#1084#1088#1072#1082' '#1089#1090#1088#1077#1084#1080#1090#1089#1103'...'
      #1046#1077#1083#1072#1077#1096#1100' '#1091#1073#1077#1076#1080#1090#1100#1089#1103'?   ')
    TabOrder = 5
  end
  object M_Code: TMemo
    Left = 216
    Top = 32
    Width = 201
    Height = 225
    TabOrder = 6
  end
  object M_Decode: TMemo
    Left = 424
    Top = 32
    Width = 201
    Height = 225
    TabOrder = 7
  end
  object PB: TProgressBar
    Left = 8
    Top = 8
    Width = 369
    Height = 17
    TabOrder = 8
  end
end
