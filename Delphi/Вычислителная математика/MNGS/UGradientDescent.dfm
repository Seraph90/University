object Form1: TForm1
  Left = 321
  Top = 409
  BorderStyle = bsSingle
  Caption = #1052#1077#1090#1086#1076' '#1085#1072#1080#1089#1082#1086#1088#1077#1081#1096#1077#1075#1086' '#1075#1088#1072#1076#1080#1077#1085#1090#1085#1086#1075#1086' '#1089#1087#1091#1089#1082#1072
  ClientHeight = 240
  ClientWidth = 568
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
  object L_X0: TLabel
    Left = 16
    Top = 8
    Width = 15
    Height = 16
    Caption = 'X0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object L_Y0: TLabel
    Left = 88
    Top = 8
    Width = 16
    Height = 16
    Caption = 'Y0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object L_Epsilon: TLabel
    Left = 16
    Top = 56
    Width = 65
    Height = 16
    Caption = #1058#1086#1095#1085#1086#1089#1090#1100':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object L_YMin: TLabel
    Left = 88
    Top = 136
    Width = 17
    Height = 16
    Caption = 'Y*:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object L_FMin: TLabel
    Left = 16
    Top = 184
    Width = 45
    Height = 16
    Caption = 'F(x*,y*):'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object L_XMin: TLabel
    Left = 16
    Top = 136
    Width = 16
    Height = 16
    Caption = 'X*:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object E_X0: TEdit
    Left = 8
    Top = 24
    Width = 65
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = '1'
  end
  object E_Y0: TEdit
    Left = 80
    Top = 24
    Width = 65
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = '1'
  end
  object E_e: TEdit
    Left = 8
    Top = 72
    Width = 137
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = '0,001'
  end
  object SG: TStringGrid
    Left = 152
    Top = 8
    Width = 409
    Height = 225
    DefaultColWidth = 75
    RowCount = 2
    TabOrder = 3
  end
  object E_FMin: TEdit
    Left = 8
    Top = 208
    Width = 137
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object E_YMin: TEdit
    Left = 80
    Top = 152
    Width = 65
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object E_XMin: TEdit
    Left = 8
    Top = 152
    Width = 65
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object B_Solve: TButton
    Left = 8
    Top = 104
    Width = 137
    Height = 25
    Caption = #1048#1089#1082#1072#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = B_SolveClick
  end
  object XPManifest1: TXPManifest
    Left = 552
    Top = 256
  end
end
