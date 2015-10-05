object Main: TMain
  Left = 338
  Top = 238
  Width = 257
  Height = 363
  Caption = #1052#1080#1085#1080#1084#1080#1079#1072#1094#1080#1103
  Color = clBtnFace
  Constraints.MinHeight = 363
  Constraints.MinWidth = 257
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  DesignSize = (
    249
    331)
  PixelsPerInch = 96
  TextHeight = 13
  object L_F: TLabel
    Left = 8
    Top = 48
    Width = 106
    Height = 13
    Caption = #1042#1093#1086#1076#1085#1086#1077' '#1074#1099#1088#1072#1078#1077#1085#1080#1077':'
  end
  object L_n: TLabel
    Left = 8
    Top = 8
    Width = 101
    Height = 13
    Caption = #1063#1080#1089#1083#1086' '#1087#1077#1088#1077#1084#1077#1085#1085#1099#1093':'
  end
  object L_Karno: TLabel
    Left = 136
    Top = 8
    Width = 64
    Height = 13
    Caption = #1050#1072#1088#1090#1072' '#1050#1072#1088#1085#1086
  end
  object Label1: TLabel
    Left = 8
    Top = 88
    Width = 114
    Height = 13
    Caption = #1042#1099#1093#1086#1076#1085#1086#1077' '#1074#1099#1088#1072#1078#1077#1085#1080#1077':'
  end
  object E_F: TEdit
    Left = 8
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object SG_K: TStringGrid
    Left = 136
    Top = 24
    Width = 105
    Height = 105
    Hint = 'Click - '#1087#1077#1088#1077#1073#1086#1088' '#1084#1077#1078#1076#1091' 0 '#1080' 1 '
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColCount = 4
    DefaultColWidth = 24
    FixedCols = 0
    RowCount = 4
    FixedRows = 0
    TabOrder = 1
    OnMouseDown = SG_KMouseDown
    OnMouseMove = SG_KMouseMove
    OnMouseUp = SG_KMouseUp
  end
  object SE_n: TSpinEdit
    Left = 8
    Top = 24
    Width = 57
    Height = 22
    MaxValue = 8
    MinValue = 1
    TabOrder = 2
    Value = 4
    OnChange = SE_nChange
  end
  object B_Acc: TButton
    Left = 72
    Top = 24
    Width = 57
    Height = 25
    Caption = #1056#1072#1095#1077#1090
    TabOrder = 3
    OnClick = B_AccClick
  end
  object Memo: TMemo
    Left = 8
    Top = 136
    Width = 233
    Height = 185
    Hint = #1058#1088#1072#1089#1089#1080#1088#1086#1074#1082#1072
    Anchors = [akLeft, akRight, akBottom]
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 4
  end
  object E_R: TEdit
    Left = 8
    Top = 104
    Width = 121
    Height = 21
    TabOrder = 5
  end
end
