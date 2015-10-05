object Form1: TForm1
  Left = 324
  Top = 178
  Width = 662
  Height = 703
  Caption = #1052#1077#1090#1086#1076' '#1044#1072#1085#1080#1083#1077#1074#1089#1082#1086#1075#1086
  Color = clBtnFace
  Constraints.MaxWidth = 662
  Constraints.MinHeight = 703
  Constraints.MinWidth = 662
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    654
    669)
  PixelsPerInch = 96
  TextHeight = 13
  object P1: TPanel
    Left = 8
    Top = 8
    Width = 225
    Height = 657
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    DesignSize = (
      225
      657)
    object L1: TLabel
      Left = 16
      Top = 8
      Width = 73
      Height = 16
      Caption = #1052#1072#1090#1088#1080#1094#1072' '#1040':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object L2: TLabel
      Left = 16
      Top = 176
      Width = 119
      Height = 16
      Caption = #1055#1086#1088#1103#1076#1086#1082' '#1084#1072#1090#1088#1080#1094#1099':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object L3: TLabel
      Left = 16
      Top = 352
      Width = 133
      Height = 16
      Anchors = [akLeft, akBottom]
      Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1099#1077' '#1095#1080#1089#1083#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object SG_A: TStringGrid
      Left = 8
      Top = 32
      Width = 188
      Height = 104
      ColCount = 4
      DefaultColWidth = 45
      FixedCols = 0
      RowCount = 4
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      ScrollBars = ssNone
      TabOrder = 0
    end
    object SE_n: TSpinEdit
      Left = 8
      Top = 200
      Width = 185
      Height = 26
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxValue = 10
      MinValue = 1
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Value = 4
      OnChange = SE_nChange
    end
    object BB_Circuit: TBitBtn
      Left = 8
      Top = 240
      Width = 89
      Height = 25
      Caption = #1057#1093#1077#1084#1072
      TabOrder = 2
      OnClick = BB_CircuitClick
      NumGlyphs = 2
    end
    object B_Fill: TButton
      Left = 8
      Top = 144
      Width = 75
      Height = 25
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100
      TabOrder = 3
      OnClick = B_FillClick
    end
    object SG_L: TStringGrid
      Left = 8
      Top = 376
      Width = 190
      Height = 54
      Anchors = [akLeft, akBottom]
      ColCount = 4
      DefaultColWidth = 45
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      ScrollBars = ssNone
      TabOrder = 4
    end
    object E_InhValue: TEdit
      Left = 8
      Top = 456
      Width = 89
      Height = 32
      Anchors = [akLeft, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object E_Spur: TEdit
      Left = 104
      Top = 456
      Width = 89
      Height = 32
      Anchors = [akLeft, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object SG_Vectors: TStringGrid
      Left = 8
      Top = 496
      Width = 189
      Height = 129
      Anchors = [akLeft, akBottom]
      ColCount = 4
      DefaultColWidth = 45
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 7
    end
  end
  object P2: TPanel
    Left = 240
    Top = 8
    Width = 409
    Height = 657
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 1
    DesignSize = (
      409
      657)
    object Label1: TLabel
      Left = 16
      Top = 512
      Width = 17
      Height = 16
      Anchors = [akLeft, akBottom]
      Caption = 'AX'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 216
      Top = 512
      Width = 15
      Height = 16
      Anchors = [akLeft, akBottom]
      Caption = 'LX'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object SG_CD: TStringGrid
      Left = 8
      Top = 8
      Width = 393
      Height = 497
      Anchors = [akLeft, akTop, akBottom]
      ColCount = 8
      DefaultColWidth = 45
      FixedCols = 0
      RowCount = 2
      TabOrder = 0
    end
    object SG_CheckAX: TStringGrid
      Left = 8
      Top = 536
      Width = 188
      Height = 104
      Anchors = [akLeft, akBottom]
      ColCount = 4
      DefaultColWidth = 45
      FixedCols = 0
      RowCount = 4
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 1
    end
    object SG_CheckLX: TStringGrid
      Left = 208
      Top = 536
      Width = 188
      Height = 104
      Anchors = [akLeft, akBottom]
      ColCount = 4
      DefaultColWidth = 45
      FixedCols = 0
      RowCount = 4
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 2
    end
  end
  object XPManifest1: TXPManifest
    Left = 632
    Top = 656
  end
end
