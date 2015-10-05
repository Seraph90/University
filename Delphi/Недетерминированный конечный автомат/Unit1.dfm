object Form1: TForm1
  Left = 184
  Top = 232
  BorderStyle = bsDialog
  Caption = 'NKA'
  ClientHeight = 451
  ClientWidth = 958
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
    Left = 10
    Top = 12
    Width = 14
    Height = 13
    Caption = 'Q='
  end
  object Label2: TLabel
    Left = 10
    Top = 44
    Width = 13
    Height = 13
    Caption = 'E='
  end
  object Label3: TLabel
    Left = 138
    Top = 12
    Width = 18
    Height = 13
    Caption = 'q0='
  end
  object Label4: TLabel
    Left = 143
    Top = 44
    Width = 12
    Height = 13
    Caption = 'F='
  end
  object Label5: TLabel
    Left = 16
    Top = 104
    Width = 49
    Height = 13
    Caption = #1060#1091#1085#1082#1094#1080#1103':'
  end
  object Label6: TLabel
    Left = 8
    Top = 76
    Width = 39
    Height = 13
    Caption = #1057#1090#1088#1086#1082#1072':'
  end
  object E_Q: TEdit
    Left = 24
    Top = 8
    Width = 105
    Height = 21
    TabOrder = 0
    Text = 'qwert'
  end
  object E_E: TEdit
    Left = 24
    Top = 40
    Width = 105
    Height = 21
    TabOrder = 1
    Text = '123'
  end
  object E_q0: TEdit
    Left = 160
    Top = 8
    Width = 105
    Height = 21
    TabOrder = 2
    Text = 'q'
  end
  object E_F: TEdit
    Left = 160
    Top = 40
    Width = 105
    Height = 21
    TabOrder = 3
    Text = 't'
  end
  object SG_d: TStringGrid
    Left = 8
    Top = 128
    Width = 257
    Height = 281
    ColCount = 7
    DefaultColWidth = 35
    RowCount = 11
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 4
  end
  object B_Accept: TButton
    Left = 160
    Top = 96
    Width = 107
    Height = 25
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    TabOrder = 5
    OnClick = B_AcceptClick
  end
  object E_S: TEdit
    Left = 56
    Top = 72
    Width = 209
    Height = 21
    TabOrder = 6
    Text = '1323'
  end
  object Button1: TButton
    Left = 8
    Top = 416
    Width = 257
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    TabOrder = 7
    OnClick = Button1Click
  end
  object TV_Res: TTreeView
    Left = 272
    Top = 8
    Width = 681
    Height = 433
    Indent = 19
    TabOrder = 8
  end
  object XPManifest1: TXPManifest
    Left = 728
    Top = 512
  end
end
