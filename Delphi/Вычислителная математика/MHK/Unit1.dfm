object Form1: TForm1
  Left = 403
  Top = 369
  Width = 469
  Height = 466
  Caption = #1084#1077#1090#1086#1076' '#1093#1086#1088#1076' '#1080' '#1082#1072#1089#1072#1090#1077#1083#1100#1085#1099#1093
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 449
    Height = 417
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 229
      Height = 24
      Caption = #1059#1088#1072#1074#1085#1077#1085#1080#1077' x^2*cos(2x)=-1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 272
      Top = 48
      Width = 86
      Height = 24
      Caption = #1058#1086#1095#1085#1086#1089#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 56
      Top = 184
      Width = 102
      Height = 40
      Caption = #1056#1077#1096#1077#1085#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -33
      Font.Name = 'Monotype Corsiva'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 272
      Top = 128
      Width = 87
      Height = 24
      Caption = #1048#1085#1090#1077#1088#1074#1072#1083
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 16
      Top = 56
      Width = 105
      Height = 24
      Caption = #1048#1085#1090#1077#1088#1074#1072#1083#1099':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object E1: TEdit
      Left = 272
      Top = 80
      Width = 121
      Height = 32
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '0,001'
      OnChange = E1Change
    end
    object SG: TStringGrid
      Left = 8
      Top = 264
      Width = 433
      Height = 145
      Color = clMenu
      ColCount = 2
      DefaultColWidth = 100
      DefaultRowHeight = 35
      RowCount = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object Solve: TButton
      Left = 272
      Top = 208
      Width = 137
      Height = 41
      Caption = #1053#1072#1081#1090#1080' '#1082#1086#1088#1085#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = SolveClick
    end
    object I1: TEdit
      Left = 272
      Top = 160
      Width = 81
      Height = 32
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = '-10'
      OnChange = I1Change
    end
    object I2: TEdit
      Left = 360
      Top = 160
      Width = 81
      Height = 32
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Text = '10'
      OnChange = I2Change
    end
    object SGI: TStringGrid
      Left = 8
      Top = 88
      Width = 257
      Height = 161
      ColCount = 2
      DefaultColWidth = 100
      DefaultRowHeight = 35
      FixedCols = 0
      RowCount = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
  end
end
