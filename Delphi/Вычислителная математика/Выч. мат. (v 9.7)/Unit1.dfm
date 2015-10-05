object Form1: TForm1
  Left = 214
  Top = 97
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  AlphaBlend = True
  BorderStyle = bsSingle
  Caption = #1054#1073#1088#1072#1097#1077#1085#1080#1077' '#1084#1072#1090#1088#1080#1094#1099
  ClientHeight = 649
  ClientWidth = 847
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SB_Rim: TSpeedButton
    Left = 224
    Top = 8
    Width = 201
    Height = 25
    GroupIndex = 1
    Caption = #1052#1077#1090#1086#1076' '#1086#1082#1072#1081#1084#1083#1077#1085#1080#1103
    OnClick = SBClick
  end
  object SB_Tri: TSpeedButton
    Left = 8
    Top = 8
    Width = 201
    Height = 25
    GroupIndex = 1
    Down = True
    Caption = #1052#1077#1090#1086#1076' '#1088#1072#1079#1073#1080#1077#1085#1080#1103' '#1085#1072' '#1090#1088#1077#1091#1075#1086#1083#1100#1085#1099#1077
    OnClick = SBClick
  end
  object SB_Kram: TSpeedButton
    Left = 224
    Top = 40
    Width = 201
    Height = 25
    GroupIndex = 1
    Caption = #1056#1077#1096#1077#1085#1080#1077' '#1089#1080#1089#1090#1077#1084#1099' '#1084#1077#1090#1086#1076#1086#1084' '#1050#1088#1072#1084#1077#1088#1072
    OnClick = SBClick
  end
  object Label1: TLabel
    Left = 8
    Top = 112
    Width = 119
    Height = 13
    Caption = #1056#1072#1079#1084#1077#1088#1085#1086#1089#1090#1100' '#1084#1072#1090#1088#1080#1094#1099':'
  end
  object SB_MatInv: TSpeedButton
    Left = 8
    Top = 40
    Width = 201
    Height = 25
    GroupIndex = 1
    Caption = #1052#1077#1090#1086#1076' '#1086#1073#1088#1072#1090#1085#1086#1081' '#1084#1072#1090#1088#1080#1094#1099
    OnClick = SBClick
  end
  object SB_M: TSpeedButton
    Left = 440
    Top = 72
    Width = 193
    Height = 25
    GroupIndex = 1
    Caption = #1044#1077#1081#1089#1090#1074#1080#1103' '#1085#1072#1076' '#1084#1072#1090#1088#1080#1094#1072#1084#1080
    OnClick = SBClick
  end
  object SB_MU: TSpeedButton
    Left = 440
    Top = 40
    Width = 193
    Height = 25
    GroupIndex = 1
    Caption = #1056#1077#1096#1077#1085#1080#1077' '#1091#1088#1072#1074#1085#1077#1085#1080#1103
    OnClick = SBClick
  end
  object SB_Gauss: TSpeedButton
    Left = 8
    Top = 72
    Width = 201
    Height = 25
    GroupIndex = 1
    Caption = #1052#1077#1090#1086#1076' '#1043#1072#1091#1089#1089#1072
    OnClick = SBClick
  end
  object SB_I: TSpeedButton
    Left = 224
    Top = 72
    Width = 201
    Height = 25
    GroupIndex = 1
    Caption = #1052#1077#1090#1086#1076' '#1048#1090#1077#1088#1072#1094#1080#1081
    OnClick = SBClick
  end
  object SB_Z: TSpeedButton
    Left = 224
    Top = 104
    Width = 201
    Height = 25
    GroupIndex = 1
    Caption = #1052#1077#1090#1086#1076' '#1047#1077#1081#1076#1077#1083#1103
    OnClick = SBClick
  end
  object P_Rim: TPanel
    Left = 8
    Top = 137
    Width = 641
    Height = 230
    ParentBackground = False
    TabOrder = 2
    Visible = False
    object Label2: TLabel
      Left = 16
      Top = 8
      Width = 88
      Height = 13
      Caption = #1044#1072#1085#1085#1072#1103' '#1084#1072#1090#1088#1080#1094#1072':'
    end
    object Label12: TLabel
      Left = 232
      Top = 8
      Width = 103
      Height = 13
      Caption = #1054#1073#1088#1072#1090#1085#1072#1103' '#1082' '#1044#1072#1085#1085#1086#1081':'
    end
    object Label13: TLabel
      Left = 200
      Top = 72
      Width = 16
      Height = 32
      Caption = #1061
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 416
      Top = 64
      Width = 14
      Height = 32
      Caption = '='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object B_DetA2: TButton
      Left = 8
      Top = 192
      Width = 185
      Height = 25
      Caption = #1056#1072#1089#1095#1105#1090' '#1086#1087#1088#1080#1076#1077#1083#1080#1090#1077#1083#1103
      TabOrder = 0
      OnClick = B_DetA2Click
    end
    object B_FM2: TButton
      Left = 8
      Top = 160
      Width = 185
      Height = 25
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1084#1072#1090#1088#1080#1094#1091
      TabOrder = 1
      OnClick = B_FMClick
    end
    object B_C2: TButton
      Left = 440
      Top = 160
      Width = 185
      Height = 25
      Caption = #1054#1095#1080#1089#1090#1082#1072
      TabOrder = 2
      OnClick = E_nChange
    end
    object SG_A2: TStringGrid
      Left = 8
      Top = 24
      Width = 185
      Height = 129
      ColCount = 4
      DefaultColWidth = 35
      FixedCols = 0
      RowCount = 4
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 3
    end
    object SG_Ai2: TStringGrid
      Left = 224
      Top = 24
      Width = 185
      Height = 129
      ColCount = 4
      DefaultColWidth = 35
      FixedCols = 0
      RowCount = 4
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 4
    end
    object SG_E2: TStringGrid
      Left = 440
      Top = 24
      Width = 185
      Height = 129
      ColCount = 4
      DefaultColWidth = 35
      FixedCols = 0
      RowCount = 4
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 5
    end
    object B_Inv2: TButton
      Left = 224
      Top = 160
      Width = 185
      Height = 25
      Caption = #1054#1073#1088#1072#1097#1077#1085#1080#1077
      TabOrder = 6
      OnClick = B_Inv2Click
    end
    object B_P2: TButton
      Left = 224
      Top = 192
      Width = 185
      Height = 25
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072
      TabOrder = 7
      OnClick = B_P2Click
    end
  end
  object P_MatInv: TPanel
    Left = 8
    Top = 137
    Width = 433
    Height = 416
    ParentBackground = False
    TabOrder = 6
    Visible = False
    object Label22: TLabel
      Left = 24
      Top = 8
      Width = 88
      Height = 13
      Caption = #1044#1072#1085#1085#1072#1103' '#1084#1072#1090#1088#1080#1094#1072':'
    end
    object Label23: TLabel
      Left = 240
      Top = 8
      Width = 10
      Height = 13
      Caption = 'B:'
    end
    object Label24: TLabel
      Left = 304
      Top = 8
      Width = 33
      Height = 13
      Caption = #1054#1090#1074#1077#1090':'
    end
    object Label25: TLabel
      Left = 376
      Top = 8
      Width = 50
      Height = 13
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072
    end
    object Label26: TLabel
      Left = 24
      Top = 160
      Width = 100
      Height = 13
      Caption = #1054#1073#1088#1072#1090#1085#1072#1103' '#1082' '#1076#1072#1085#1085#1086#1081':'
    end
    object Label27: TLabel
      Left = 240
      Top = 160
      Width = 103
      Height = 13
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1086#1073#1088#1072#1090#1085#1086#1081':'
    end
    object SG_A4: TStringGrid
      Left = 16
      Top = 24
      Width = 185
      Height = 129
      ColCount = 3
      DefaultColWidth = 35
      FixedCols = 0
      RowCount = 3
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 0
    end
    object SG_B4: TStringGrid
      Left = 232
      Top = 24
      Width = 41
      Height = 129
      ColCount = 1
      DefaultColWidth = 35
      FixedCols = 0
      RowCount = 3
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      ScrollBars = ssNone
      TabOrder = 1
    end
    object SG_R4: TStringGrid
      Left = 304
      Top = 24
      Width = 41
      Height = 129
      ColCount = 1
      DefaultColWidth = 35
      FixedCols = 0
      RowCount = 3
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      ScrollBars = ssNone
      TabOrder = 2
    end
    object B_DetA4: TButton
      Left = 16
      Top = 344
      Width = 185
      Height = 25
      Caption = #1056#1072#1089#1095#1105#1090' '#1086#1087#1088#1080#1076#1077#1083#1080#1090#1077#1083#1103
      TabOrder = 3
      OnClick = B_DetA4Click
    end
    object B_FM4: TButton
      Left = 16
      Top = 312
      Width = 185
      Height = 25
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1084#1072#1090#1088#1080#1094#1091
      TabOrder = 4
      OnClick = B_FMClick
    end
    object B_Solve4: TButton
      Left = 232
      Top = 312
      Width = 185
      Height = 25
      Caption = #1056#1077#1096#1080#1090#1100' '#1089#1080#1089#1090#1077#1084#1091
      TabOrder = 5
      OnClick = B_Solve4Click
    end
    object B_C4: TButton
      Left = 232
      Top = 376
      Width = 185
      Height = 25
      Caption = #1054#1095#1080#1089#1090#1082#1072
      TabOrder = 6
      OnClick = E_nChange
    end
    object SG_P4: TStringGrid
      Left = 376
      Top = 24
      Width = 41
      Height = 129
      ColCount = 1
      DefaultColWidth = 35
      FixedCols = 0
      RowCount = 3
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      ScrollBars = ssNone
      TabOrder = 7
    end
    object B_P4: TButton
      Left = 232
      Top = 344
      Width = 185
      Height = 25
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072
      TabOrder = 8
      OnClick = B_P4Click
    end
    object SG_Ai4: TStringGrid
      Left = 16
      Top = 176
      Width = 185
      Height = 129
      ColCount = 3
      DefaultColWidth = 35
      FixedCols = 0
      RowCount = 3
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 9
    end
    object SG_E4: TStringGrid
      Left = 232
      Top = 176
      Width = 185
      Height = 129
      ColCount = 3
      DefaultColWidth = 35
      FixedCols = 0
      RowCount = 3
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 10
    end
    object B_Inv4: TButton
      Left = 16
      Top = 376
      Width = 185
      Height = 25
      Caption = #1054#1073#1088#1072#1097#1077#1085#1080#1077
      TabOrder = 11
      OnClick = B_Inv4Click
    end
  end
  object P_Gauss: TPanel
    Left = 8
    Top = 137
    Width = 849
    Height = 512
    ParentBackground = False
    TabOrder = 9
    Visible = False
    object Label39: TLabel
      Left = 24
      Top = 8
      Width = 88
      Height = 13
      Caption = #1044#1072#1085#1085#1072#1103' '#1084#1072#1090#1088#1080#1094#1072':'
    end
    object Label40: TLabel
      Left = 224
      Top = 8
      Width = 10
      Height = 13
      Caption = 'B:'
    end
    object Label41: TLabel
      Left = 216
      Top = 360
      Width = 65
      Height = 13
      Caption = #1059#1090#1086#1095#1085#1105#1085#1085#1099#1077':'
    end
    object Label42: TLabel
      Left = 120
      Top = 176
      Width = 50
      Height = 13
      Caption = #1055#1086#1087#1088#1072#1074#1082#1080
    end
    object Label43: TLabel
      Left = 24
      Top = 176
      Width = 44
      Height = 13
      Caption = #1053#1077#1074#1103#1079#1082#1080
    end
    object Label44: TLabel
      Left = 216
      Top = 176
      Width = 66
      Height = 13
      Caption = #1059#1090#1095'. '#1085#1077#1074#1103#1079#1082#1080
    end
    object SG_A7: TStringGrid
      Left = 16
      Top = 24
      Width = 185
      Height = 129
      ColCount = 4
      DefaultColWidth = 35
      FixedCols = 0
      RowCount = 4
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 0
    end
    object SG_B7: TStringGrid
      Left = 216
      Top = 24
      Width = 73
      Height = 129
      ColCount = 1
      DefaultColWidth = 65
      FixedCols = 0
      RowCount = 4
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      ScrollBars = ssNone
      TabOrder = 1
    end
    object SG_R7: TStringGrid
      Left = 216
      Top = 376
      Width = 73
      Height = 129
      ColCount = 1
      DefaultColWidth = 65
      FixedCols = 0
      RowCount = 4
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      ScrollBars = ssNone
      TabOrder = 2
    end
    object Button2: TButton
      Left = 16
      Top = 360
      Width = 185
      Height = 25
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1084#1072#1090#1088#1080#1094#1091
      TabOrder = 3
      OnClick = B_FMClick
    end
    object B_R7: TButton
      Left = 16
      Top = 400
      Width = 185
      Height = 25
      Caption = #1056#1077#1096#1080#1090#1100' '#1089#1080#1089#1090#1077#1084#1091
      TabOrder = 4
      OnClick = B_R7Click
    end
    object B_: TButton
      Left = 16
      Top = 480
      Width = 185
      Height = 25
      Caption = #1054#1095#1080#1089#1090#1082#1072
      TabOrder = 5
      OnClick = E_nChange
    end
    object SG_P7: TStringGrid
      Left = 112
      Top = 192
      Width = 73
      Height = 129
      ColCount = 1
      DefaultColWidth = 65
      FixedCols = 0
      RowCount = 4
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      ScrollBars = ssNone
      TabOrder = 6
    end
    object SG_T7: TStringGrid
      Left = 304
      Top = 24
      Width = 537
      Height = 481
      ColCount = 8
      DefaultColWidth = 65
      RowCount = 19
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 7
    end
    object SG_N7: TStringGrid
      Left = 16
      Top = 192
      Width = 73
      Height = 129
      ColCount = 1
      DefaultColWidth = 65
      FixedCols = 0
      RowCount = 4
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      ScrollBars = ssVertical
      TabOrder = 8
    end
    object SG_FN: TStringGrid
      Left = 216
      Top = 192
      Width = 73
      Height = 129
      ColCount = 1
      DefaultColWidth = 65
      FixedCols = 0
      RowCount = 4
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      ScrollBars = ssNone
      TabOrder = 9
    end
  end
  object P_MU: TPanel
    Left = 8
    Top = 137
    Width = 641
    Height = 376
    ParentBackground = False
    TabOrder = 8
    Visible = False
    object Label31: TLabel
      Left = 16
      Top = 8
      Width = 10
      Height = 13
      Caption = 'A:'
    end
    object Label32: TLabel
      Left = 456
      Top = 8
      Width = 21
      Height = 13
      Caption = 'A*X:'
    end
    object Label35: TLabel
      Left = 232
      Top = 8
      Width = 10
      Height = 13
      Caption = 'X:'
    end
    object Label36: TLabel
      Left = 448
      Top = 160
      Width = 74
      Height = 13
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072' A*X:'
    end
    object Label33: TLabel
      Left = 200
      Top = 64
      Width = 16
      Height = 32
      Caption = #1061
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label34: TLabel
      Left = 416
      Top = 56
      Width = 14
      Height = 32
      Caption = '='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label37: TLabel
      Left = 16
      Top = 160
      Width = 71
      Height = 13
      Caption = #1054#1073#1088#1072#1090#1085#1072#1103' '#1082' A:'
    end
    object Label38: TLabel
      Left = 232
      Top = 160
      Width = 103
      Height = 13
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1086#1073#1088#1072#1090#1085#1086#1081':'
    end
    object SG_A6: TStringGrid
      Left = 8
      Top = 24
      Width = 185
      Height = 129
      ColCount = 3
      DefaultColWidth = 35
      FixedCols = 0
      RowCount = 3
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 0
    end
    object SG_B6: TStringGrid
      Left = 440
      Top = 24
      Width = 185
      Height = 129
      ColCount = 3
      DefaultColWidth = 35
      FixedCols = 0
      RowCount = 3
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      ScrollBars = ssNone
      TabOrder = 1
    end
    object B_DetA6: TButton
      Left = 8
      Top = 344
      Width = 185
      Height = 25
      Caption = #1056#1072#1089#1095#1105#1090' '#1086#1087#1088#1080#1076#1077#1083#1080#1090#1077#1083#1103
      TabOrder = 2
      OnClick = B_DetA6Click
    end
    object B_FM6: TButton
      Left = 8
      Top = 312
      Width = 185
      Height = 25
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1084#1072#1090#1088#1080#1094#1091
      TabOrder = 3
      OnClick = B_FMClick
    end
    object B_Solve6: TButton
      Left = 224
      Top = 344
      Width = 185
      Height = 25
      Caption = #1056#1077#1096#1080#1090#1100' '#1089#1080#1089#1090#1077#1084#1091
      TabOrder = 4
      OnClick = B_Solve6Click
    end
    object B_C6: TButton
      Left = 440
      Top = 344
      Width = 185
      Height = 25
      Caption = #1054#1095#1080#1089#1090#1082#1072
      TabOrder = 5
      OnClick = E_nChange
    end
    object B_P6: TButton
      Left = 440
      Top = 312
      Width = 185
      Height = 25
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072
      TabOrder = 6
      OnClick = B_P6Click
    end
    object SG_P6: TStringGrid
      Left = 440
      Top = 176
      Width = 185
      Height = 129
      ColCount = 3
      DefaultColWidth = 35
      FixedCols = 0
      RowCount = 3
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 7
    end
    object SG_X6: TStringGrid
      Left = 224
      Top = 24
      Width = 185
      Height = 129
      ColCount = 3
      DefaultColWidth = 35
      FixedCols = 0
      RowCount = 3
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 8
    end
    object B_Inv6: TButton
      Left = 224
      Top = 312
      Width = 185
      Height = 25
      Caption = #1054#1073#1088#1072#1097#1077#1085#1080#1077
      TabOrder = 9
      OnClick = B_Inv6Click
    end
    object SG_Ai6: TStringGrid
      Left = 8
      Top = 176
      Width = 185
      Height = 129
      ColCount = 3
      DefaultColWidth = 35
      FixedCols = 0
      RowCount = 3
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 10
    end
    object SG_E6: TStringGrid
      Left = 224
      Top = 176
      Width = 185
      Height = 129
      ColCount = 3
      DefaultColWidth = 35
      FixedCols = 0
      RowCount = 3
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 11
    end
  end
  object P_Tri: TPanel
    Left = 8
    Top = 137
    Width = 849
    Height = 470
    ParentBackground = False
    TabOrder = 0
    object Label9: TLabel
      Left = 632
      Top = 64
      Width = 14
      Height = 32
      Caption = '='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 416
      Top = 72
      Width = 16
      Height = 32
      Caption = #1061
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 232
      Top = 8
      Width = 88
      Height = 13
      Caption = #1044#1072#1085#1085#1072#1103' '#1084#1072#1090#1088#1080#1094#1072':'
    end
    object Label4: TLabel
      Left = 232
      Top = 312
      Width = 109
      Height = 13
      Caption = #1053#1080#1078#1085#1103#1103' '#1090#1088#1077#1091#1075#1086#1083#1100#1085#1072#1103':'
    end
    object Label5: TLabel
      Left = 232
      Top = 160
      Width = 111
      Height = 13
      Caption = #1042#1077#1088#1093#1085#1103#1103' '#1090#1088#1077#1091#1075#1086#1083#1100#1085#1072#1103':'
    end
    object Label6: TLabel
      Left = 448
      Top = 312
      Width = 102
      Height = 13
      Caption = #1054#1073#1088#1072#1090#1085#1072#1103' '#1082' '#1085#1080#1078#1085#1077#1081':'
    end
    object Label7: TLabel
      Left = 448
      Top = 160
      Width = 105
      Height = 13
      Caption = #1054#1073#1088#1072#1090#1085#1072#1103' '#1082' '#1074#1077#1088#1093#1085#1077#1081':'
    end
    object Label8: TLabel
      Left = 448
      Top = 8
      Width = 103
      Height = 13
      Caption = #1054#1073#1088#1072#1090#1085#1072#1103' '#1082' '#1044#1072#1085#1085#1086#1081':'
    end
    object Label15: TLabel
      Left = 632
      Top = 360
      Width = 14
      Height = 32
      Caption = '='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 416
      Top = 368
      Width = 16
      Height = 32
      Caption = #1061
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label17: TLabel
      Left = 632
      Top = 224
      Width = 14
      Height = 32
      Caption = '='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label18: TLabel
      Left = 416
      Top = 224
      Width = 16
      Height = 32
      Caption = #1061
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object SG_A: TStringGrid
      Left = 224
      Top = 24
      Width = 185
      Height = 129
      ColCount = 4
      DefaultColWidth = 35
      FixedCols = 0
      RowCount = 4
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 0
    end
    object SG_Ai: TStringGrid
      Left = 440
      Top = 24
      Width = 185
      Height = 129
      ColCount = 4
      DefaultColWidth = 35
      FixedCols = 0
      RowCount = 4
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 1
    end
    object SG_Ui: TStringGrid
      Left = 440
      Top = 176
      Width = 185
      Height = 129
      ColCount = 4
      DefaultColWidth = 35
      FixedCols = 0
      RowCount = 4
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 2
    end
    object SG_U: TStringGrid
      Left = 224
      Top = 176
      Width = 185
      Height = 129
      ColCount = 4
      DefaultColWidth = 35
      FixedCols = 0
      RowCount = 4
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 3
    end
    object SG_E: TStringGrid
      Left = 656
      Top = 24
      Width = 185
      Height = 129
      ColCount = 4
      DefaultColWidth = 35
      FixedCols = 0
      RowCount = 4
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 4
    end
    object SG_Di: TStringGrid
      Left = 440
      Top = 328
      Width = 185
      Height = 129
      ColCount = 4
      DefaultColWidth = 35
      FixedCols = 0
      RowCount = 4
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 5
    end
    object SG_D: TStringGrid
      Left = 224
      Top = 328
      Width = 185
      Height = 129
      ColCount = 4
      DefaultColWidth = 35
      FixedCols = 0
      RowCount = 4
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 6
    end
    object B_DetA: TButton
      Left = 8
      Top = 72
      Width = 201
      Height = 25
      Caption = #1056#1072#1089#1095#1105#1090' '#1086#1087#1088#1080#1076#1077#1083#1080#1090#1077#1083#1103
      TabOrder = 7
      OnClick = B_DetAClick
    end
    object B_FM: TButton
      Left = 8
      Top = 24
      Width = 201
      Height = 25
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1084#1072#1090#1088#1080#1094#1091
      TabOrder = 8
      OnClick = B_FMClick
    end
    object B_R: TButton
      Left = 8
      Top = 120
      Width = 201
      Height = 25
      Caption = #1056#1072#1079#1073#1080#1090#1100' '#1084#1072#1090#1088#1080#1094#1091
      TabOrder = 9
      OnClick = B_RClick
    end
    object B_Inv: TButton
      Left = 8
      Top = 216
      Width = 201
      Height = 25
      Caption = #1054#1073#1088#1072#1090#1085#1072#1103' '#1082' '#1076#1072#1085#1085#1086#1081
      TabOrder = 10
      OnClick = B_InvClick
    end
    object B_InvTri: TButton
      Left = 8
      Top = 168
      Width = 201
      Height = 25
      Caption = #1054#1073#1088#1072#1090#1085#1099#1077' '#1090#1088#1077#1091#1075#1086#1083#1100#1085#1099#1077
      TabOrder = 11
      OnClick = B_InvTriClick
    end
    object B_E: TButton
      Left = 8
      Top = 264
      Width = 201
      Height = 25
      Caption = #1055#1088#1086#1089#1090#1099#1077' '#1093' '#1054#1073#1088#1072#1090#1085#1099#1077
      TabOrder = 12
      OnClick = B_EClick
    end
    object B_C: TButton
      Left = 8
      Top = 432
      Width = 201
      Height = 25
      Caption = #1054#1095#1080#1089#1090#1082#1072
      TabOrder = 13
      OnClick = E_nChange
    end
    object SG_UE: TStringGrid
      Left = 656
      Top = 176
      Width = 185
      Height = 129
      ColCount = 4
      DefaultColWidth = 35
      FixedCols = 0
      RowCount = 4
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 14
    end
    object SG_DE: TStringGrid
      Left = 656
      Top = 328
      Width = 185
      Height = 129
      ColCount = 4
      DefaultColWidth = 35
      FixedCols = 0
      RowCount = 4
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 15
    end
  end
  object P_M: TPanel
    Left = 8
    Top = 137
    Width = 641
    Height = 200
    ParentBackground = False
    TabOrder = 7
    Visible = False
    object Label28: TLabel
      Left = 16
      Top = 8
      Width = 10
      Height = 13
      Caption = 'A:'
    end
    object Label29: TLabel
      Left = 232
      Top = 8
      Width = 10
      Height = 13
      Caption = 'B:'
    end
    object Label30: TLabel
      Left = 448
      Top = 8
      Width = 67
      Height = 13
      Caption = '2(A-0.5B)+AB:'
    end
    object B_FM5: TButton
      Left = 8
      Top = 160
      Width = 185
      Height = 25
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1084#1072#1090#1088#1080#1094#1091
      TabOrder = 0
      OnClick = B_FMClick
    end
    object B_C5: TButton
      Left = 440
      Top = 160
      Width = 185
      Height = 25
      Caption = #1054#1095#1080#1089#1090#1082#1072
      TabOrder = 1
      OnClick = E_nChange
    end
    object SG_A5: TStringGrid
      Left = 8
      Top = 24
      Width = 185
      Height = 129
      ColCount = 3
      DefaultColWidth = 35
      FixedCols = 0
      RowCount = 3
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 2
    end
    object SG_B5: TStringGrid
      Left = 224
      Top = 24
      Width = 185
      Height = 129
      ColCount = 3
      DefaultColWidth = 35
      FixedCols = 0
      RowCount = 3
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 3
    end
    object SG_R5: TStringGrid
      Left = 440
      Top = 24
      Width = 185
      Height = 129
      ColCount = 3
      DefaultColWidth = 35
      FixedCols = 0
      RowCount = 3
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 4
    end
    object B_M: TButton
      Left = 224
      Top = 160
      Width = 185
      Height = 25
      Caption = '2(A-0.5B)+AB'
      TabOrder = 5
      OnClick = B_MClick
    end
  end
  object P_Kram: TPanel
    Left = 8
    Top = 137
    Width = 537
    Height = 230
    ParentBackground = False
    TabOrder = 3
    Visible = False
    object Label11: TLabel
      Left = 24
      Top = 8
      Width = 88
      Height = 13
      Caption = #1044#1072#1085#1085#1072#1103' '#1084#1072#1090#1088#1080#1094#1072':'
    end
    object Label19: TLabel
      Left = 240
      Top = 8
      Width = 10
      Height = 13
      Caption = 'B:'
    end
    object Label20: TLabel
      Left = 352
      Top = 8
      Width = 33
      Height = 13
      Caption = #1054#1090#1074#1077#1090':'
    end
    object Label21: TLabel
      Left = 456
      Top = 8
      Width = 50
      Height = 13
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072
    end
    object SG_A3: TStringGrid
      Left = 16
      Top = 24
      Width = 185
      Height = 129
      ColCount = 4
      DefaultColWidth = 35
      FixedCols = 0
      RowCount = 4
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 0
    end
    object SG_B3: TStringGrid
      Left = 232
      Top = 24
      Width = 73
      Height = 129
      ColCount = 1
      DefaultColWidth = 35
      FixedCols = 0
      RowCount = 4
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 1
    end
    object SG_R3: TStringGrid
      Left = 344
      Top = 24
      Width = 73
      Height = 129
      ColCount = 1
      DefaultColWidth = 35
      FixedCols = 0
      RowCount = 4
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 2
    end
    object B_DetA3: TButton
      Left = 16
      Top = 192
      Width = 185
      Height = 25
      Caption = #1056#1072#1089#1095#1105#1090' '#1086#1087#1088#1080#1076#1077#1083#1080#1090#1077#1083#1103
      TabOrder = 3
      OnClick = B_DetA8Click
    end
    object B_FM3: TButton
      Left = 16
      Top = 160
      Width = 185
      Height = 25
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1084#1072#1090#1088#1080#1094#1091
      TabOrder = 4
      OnClick = B_FMClick
    end
    object B_Solve3: TButton
      Left = 232
      Top = 160
      Width = 185
      Height = 25
      Caption = #1056#1077#1096#1080#1090#1100' '#1089#1080#1089#1090#1077#1084#1091
      TabOrder = 5
      OnClick = B_Solve3Click
    end
    object B_C3: TButton
      Left = 448
      Top = 160
      Width = 73
      Height = 25
      Caption = #1054#1095#1080#1089#1090#1082#1072
      TabOrder = 6
      OnClick = E_nChange
    end
    object SG_P3: TStringGrid
      Left = 448
      Top = 24
      Width = 73
      Height = 129
      ColCount = 1
      DefaultColWidth = 35
      FixedCols = 0
      RowCount = 4
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 7
    end
    object B_P3: TButton
      Left = 232
      Top = 192
      Width = 185
      Height = 25
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072
      TabOrder = 8
      OnClick = B_P3Click
    end
  end
  object E_n: TEdit
    Left = 136
    Top = 108
    Width = 57
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -7
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ImeName = 'Russian'
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
    Text = '3'
    OnChange = E_nChange
  end
  object UpDown1: TUpDown
    Left = 192
    Top = 108
    Width = 17
    Height = 21
    Min = 1
    Max = 10
    Position = 5
    TabOrder = 5
    OnClick = UpDown1Click
  end
  object B_Exit: TButton
    Left = 440
    Top = 8
    Width = 193
    Height = 25
    Caption = 'Exit'
    TabOrder = 1
    OnClick = B_ExitClick
  end
  object P_I: TPanel
    Left = 8
    Top = 137
    Width = 537
    Height = 384
    ParentBackground = False
    TabOrder = 10
    Visible = False
    object Label45: TLabel
      Left = 24
      Top = 8
      Width = 88
      Height = 13
      Caption = #1044#1072#1085#1085#1072#1103' '#1084#1072#1090#1088#1080#1094#1072':'
    end
    object Label46: TLabel
      Left = 216
      Top = 8
      Width = 10
      Height = 13
      Caption = 'B:'
    end
    object Label47: TLabel
      Left = 296
      Top = 8
      Width = 34
      Height = 13
      Caption = #1050#1086#1088#1085#1080':'
    end
    object Label48: TLabel
      Left = 376
      Top = 8
      Width = 47
      Height = 13
      Caption = #1053#1077#1074#1103#1079#1082#1080':'
    end
    object Label49: TLabel
      Left = 216
      Top = 168
      Width = 50
      Height = 13
      Caption = #1058#1086#1095#1085#1086#1089#1090#1100':'
    end
    object Label50: TLabel
      Left = 456
      Top = 8
      Width = 53
      Height = 13
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072':'
    end
    object SG_A8: TStringGrid
      Left = 16
      Top = 24
      Width = 185
      Height = 129
      ColCount = 3
      DefaultColWidth = 35
      FixedCols = 0
      RowCount = 3
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 0
    end
    object SG_B8: TStringGrid
      Left = 208
      Top = 24
      Width = 73
      Height = 129
      ColCount = 1
      FixedCols = 0
      RowCount = 3
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 1
    end
    object SG_X8: TStringGrid
      Left = 288
      Top = 24
      Width = 73
      Height = 129
      ColCount = 1
      FixedCols = 0
      RowCount = 3
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 2
    end
    object B_FM8: TButton
      Left = 16
      Top = 160
      Width = 185
      Height = 25
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1084#1072#1090#1088#1080#1094#1091
      TabOrder = 3
      OnClick = B_FMClick
    end
    object B_Solve8: TButton
      Left = 336
      Top = 160
      Width = 185
      Height = 25
      Caption = #1056#1077#1096#1080#1090#1100' '#1089#1080#1089#1090#1077#1084#1091
      TabOrder = 4
      OnClick = B_Solve8Click
    end
    object B_C8: TButton
      Left = 336
      Top = 192
      Width = 185
      Height = 25
      Caption = #1054#1095#1080#1089#1090#1082#1072
      TabOrder = 5
      OnClick = E_nChange
    end
    object SG_N8: TStringGrid
      Left = 368
      Top = 24
      Width = 65
      Height = 129
      ColCount = 1
      DefaultColWidth = 128
      FixedCols = 0
      RowCount = 3
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 6
    end
    object B_P8: TButton
      Left = 16
      Top = 192
      Width = 185
      Height = 25
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072
      TabOrder = 7
      OnClick = B_P8Click
    end
    object SG_I8: TStringGrid
      Left = 16
      Top = 224
      Width = 505
      Height = 153
      ColCount = 2
      RowCount = 4
      TabOrder = 8
    end
    object E_e8: TEdit
      Left = 208
      Top = 184
      Width = 121
      Height = 21
      ImeName = 'Russian'
      TabOrder = 9
      Text = '0,000001'
    end
    object SG_P8: TStringGrid
      Left = 440
      Top = 24
      Width = 73
      Height = 129
      ColCount = 1
      FixedCols = 0
      RowCount = 4
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 10
    end
  end
  object P_Z: TPanel
    Left = 8
    Top = 137
    Width = 537
    Height = 384
    ParentBackground = False
    TabOrder = 11
    Visible = False
    object Label51: TLabel
      Left = 24
      Top = 8
      Width = 88
      Height = 13
      Caption = #1044#1072#1085#1085#1072#1103' '#1084#1072#1090#1088#1080#1094#1072':'
    end
    object Label52: TLabel
      Left = 216
      Top = 8
      Width = 10
      Height = 13
      Caption = 'B:'
    end
    object Label53: TLabel
      Left = 296
      Top = 8
      Width = 34
      Height = 13
      Caption = #1050#1086#1088#1085#1080':'
    end
    object Label54: TLabel
      Left = 376
      Top = 8
      Width = 47
      Height = 13
      Caption = #1053#1077#1074#1103#1079#1082#1080':'
    end
    object Label55: TLabel
      Left = 216
      Top = 168
      Width = 50
      Height = 13
      Caption = #1058#1086#1095#1085#1086#1089#1090#1100':'
    end
    object Label56: TLabel
      Left = 456
      Top = 8
      Width = 53
      Height = 13
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072':'
    end
    object SG_A9: TStringGrid
      Left = 16
      Top = 24
      Width = 185
      Height = 129
      ColCount = 3
      DefaultColWidth = 35
      FixedCols = 0
      RowCount = 3
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 0
    end
    object SG_B9: TStringGrid
      Left = 208
      Top = 24
      Width = 73
      Height = 129
      ColCount = 1
      FixedCols = 0
      RowCount = 3
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 1
    end
    object SG_X9: TStringGrid
      Left = 288
      Top = 24
      Width = 73
      Height = 129
      ColCount = 1
      FixedCols = 0
      RowCount = 3
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 2
    end
    object B_FM9: TButton
      Left = 16
      Top = 160
      Width = 185
      Height = 25
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1084#1072#1090#1088#1080#1094#1091
      TabOrder = 3
      OnClick = B_FMClick
    end
    object B_Solve9: TButton
      Left = 336
      Top = 160
      Width = 185
      Height = 25
      Caption = #1056#1077#1096#1080#1090#1100' '#1089#1080#1089#1090#1077#1084#1091
      TabOrder = 4
      OnClick = B_Solve9Click
    end
    object B_C9: TButton
      Left = 336
      Top = 192
      Width = 185
      Height = 25
      Caption = #1054#1095#1080#1089#1090#1082#1072
      TabOrder = 5
      OnClick = E_nChange
    end
    object SG_N9: TStringGrid
      Left = 368
      Top = 24
      Width = 73
      Height = 129
      ColCount = 1
      DefaultColWidth = 128
      FixedCols = 0
      RowCount = 3
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 6
    end
    object B_P9: TButton
      Left = 16
      Top = 192
      Width = 185
      Height = 25
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072
      TabOrder = 7
      OnClick = B_P9Click
    end
    object SG_Z9: TStringGrid
      Left = 16
      Top = 224
      Width = 505
      Height = 153
      ColCount = 2
      RowCount = 4
      TabOrder = 8
    end
    object E_e9: TEdit
      Left = 208
      Top = 184
      Width = 121
      Height = 21
      ImeName = 'Russian'
      TabOrder = 9
      Text = '0,000001'
    end
    object SG_P9: TStringGrid
      Left = 448
      Top = 24
      Width = 73
      Height = 129
      ColCount = 1
      DefaultColWidth = 128
      FixedCols = 0
      RowCount = 3
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 10
    end
  end
  object XPManifest1: TXPManifest
    Left = 664
    Top = 8
  end
end
