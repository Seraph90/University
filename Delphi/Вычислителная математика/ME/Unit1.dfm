object Form1: TForm1
  Left = 400
  Top = 340
  Width = 291
  Height = 310
  Caption = #1057#1093#1077#1084#1072' '#1069#1081#1090#1082#1080#1085#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  DesignSize = (
    283
    278)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 144
    Top = 8
    Width = 11
    Height = 13
    Caption = 'x='
  end
  object Label2: TLabel
    Left = 16
    Top = 8
    Width = 50
    Height = 13
    Caption = #1058#1086#1095#1085#1086#1089#1090#1100':'
  end
  object Label3: TLabel
    Left = 32
    Top = 56
    Width = 94
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1080#1089#1090#1074#1086' '#1091#1079#1083#1086#1074':'
  end
  object Label4: TLabel
    Left = 96
    Top = 88
    Width = 3
    Height = 13
  end
  object Button1: TButton
    Left = 8
    Top = 80
    Width = 75
    Height = 25
    Caption = #1053#1072#1081#1090#1080
    TabOrder = 0
    OnClick = Button1Click
  end
  object E_x: TEdit
    Left = 136
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '6'
  end
  object E_e: TEdit
    Left = 8
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '0,001'
  end
  object SG_E: TStringGrid
    Left = 8
    Top = 112
    Width = 267
    Height = 156
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColCount = 4
    RowCount = 6
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 3
  end
  object SE_n: TSpinEdit
    Left = 136
    Top = 56
    Width = 121
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 4
    Value = 5
    OnChange = SE_nChange
  end
  object XPManifest1: TXPManifest
    Left = 280
    Top = 8
  end
end
