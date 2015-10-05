object Form1: TForm1
  Left = 172
  Top = 147
  BorderStyle = bsSingle
  Caption = #1056#1077#1096#1077#1085#1080#1077' '#1089#1080#1089#1090#1077#1084#1099' '#1085#1077#1083#1080#1085#1077#1081#1085#1099#1093' '#1091#1088#1072#1074#1085#1077#1085#1080#1081
  ClientHeight = 344
  ClientWidth = 783
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 769
    Height = 161
    Caption = #1052#1077#1090#1086#1076#1086#1084' '#1053#1100#1102#1090#1086#1085#1072
    TabOrder = 0
    object Label1: TLabel
      Left = 14
      Top = 80
      Width = 18
      Height = 16
      Caption = 'X0:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 14
      Top = 16
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
    object Label5: TLabel
      Left = 110
      Top = 80
      Width = 19
      Height = 16
      Caption = 'Y0:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 14
      Top = 56
      Width = 169
      Height = 16
      Caption = #1055#1088#1080#1073#1083#1080#1078#1077#1085#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object E_e: TEdit
      Left = 10
      Top = 32
      Width = 79
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '0,001'
    end
    object E_Y0: TEdit
      Left = 105
      Top = 96
      Width = 81
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '-0,75'
    end
    object E_X0: TEdit
      Left = 10
      Top = 96
      Width = 81
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = '0,4'
    end
    object Solve: TButton
      Left = 10
      Top = 128
      Width = 177
      Height = 25
      Caption = #1056#1077#1096#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = SolveClick
    end
    object SG_I: TStringGrid
      Left = 198
      Top = 16
      Width = 561
      Height = 137
      Color = clMenu
      ColCount = 2
      DefaultRowHeight = 35
      RowCount = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object B_chng: TButton
      Left = 104
      Top = 32
      Width = 81
      Height = 25
      Caption = #1042#1099#1073#1088#1072#1090#1100
      TabOrder = 5
      OnClick = B_chngClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 176
    Width = 769
    Height = 161
    Caption = #1052#1077#1090#1086#1076#1086#1084' '#1089#1077#1082#1091#1097#1080#1093
    TabOrder = 1
    object Label3: TLabel
      Left = 14
      Top = 80
      Width = 18
      Height = 16
      Caption = 'X0:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 14
      Top = 16
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
    object Label7: TLabel
      Left = 110
      Top = 80
      Width = 19
      Height = 16
      Caption = 'Y0:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 14
      Top = 56
      Width = 169
      Height = 16
      Caption = #1055#1088#1080#1073#1083#1080#1078#1077#1085#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object E_e2: TEdit
      Left = 10
      Top = 32
      Width = 79
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '0,001'
    end
    object E_Y02: TEdit
      Left = 105
      Top = 96
      Width = 81
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '-0,75'
    end
    object E_X02: TEdit
      Left = 10
      Top = 96
      Width = 81
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = '0,4'
    end
    object B_Solve2: TButton
      Left = 10
      Top = 128
      Width = 177
      Height = 25
      Caption = #1056#1077#1096#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = B_Solve2Click
    end
    object SG_I2: TStringGrid
      Left = 198
      Top = 16
      Width = 561
      Height = 137
      Color = clMenu
      ColCount = 2
      DefaultRowHeight = 35
      RowCount = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object B_chng2: TButton
      Left = 104
      Top = 32
      Width = 81
      Height = 25
      Caption = #1042#1099#1073#1088#1072#1090#1100
      TabOrder = 5
      OnClick = B_chng2Click
    end
  end
  object XPManifest1: TXPManifest
    Left = 776
    Top = 328
  end
end
