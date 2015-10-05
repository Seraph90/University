object Form1: TForm1
  Left = 347
  Top = 249
  BorderStyle = bsToolWindow
  Caption = '   Lab '#8470'1'
  ClientHeight = 615
  ClientWidth = 671
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
  object Image1: TImage
    Left = 240
    Top = 16
    Width = 425
    Height = 425
    OnMouseDown = Image1MouseDown
    OnMouseMove = Image1MouseMove
    OnMouseUp = Image1MouseUp
  end
  object PC: TPageControl
    Left = 8
    Top = 8
    Width = 217
    Height = 473
    ActivePage = TS_P
    TabOrder = 0
    object TS_P: TTabSheet
      Caption = 'P'
      object SG_AP: TStringGrid
        Left = 8
        Top = 8
        Width = 193
        Height = 193
        ColCount = 2
        DefaultColWidth = 20
        DefaultRowHeight = 20
        RowCount = 2
        TabOrder = 0
      end
      object SG_XYP: TStringGrid
        Left = 8
        Top = 208
        Width = 193
        Height = 233
        ColCount = 3
        DefaultColWidth = 45
        DefaultRowHeight = 20
        RowCount = 2
        TabOrder = 1
      end
    end
    object TS_Q: TTabSheet
      Caption = 'Q'
      ImageIndex = 1
      object SG_AQ: TStringGrid
        Left = 8
        Top = 8
        Width = 193
        Height = 193
        ColCount = 2
        DefaultColWidth = 20
        DefaultRowHeight = 20
        RowCount = 2
        TabOrder = 0
      end
      object SG_XYQ: TStringGrid
        Left = 8
        Top = 208
        Width = 193
        Height = 233
        ColCount = 3
        DefaultColWidth = 45
        DefaultRowHeight = 20
        RowCount = 2
        TabOrder = 1
      end
    end
    object TS_R: TTabSheet
      Caption = 'R'
      ImageIndex = 2
      object SG_AR: TStringGrid
        Left = 8
        Top = 8
        Width = 193
        Height = 193
        ColCount = 2
        DefaultColWidth = 20
        DefaultRowHeight = 20
        RowCount = 2
        TabOrder = 0
      end
      object SG_XYR: TStringGrid
        Left = 8
        Top = 208
        Width = 193
        Height = 233
        ColCount = 3
        DefaultColWidth = 45
        DefaultRowHeight = 20
        RowCount = 2
        TabOrder = 1
      end
    end
  end
  object M_Ds: TMemo
    Left = 240
    Top = 480
    Width = 209
    Height = 129
    ImeName = #1056#1091#1089#1089#1082#1072#1103
    ReadOnly = True
    TabOrder = 1
  end
  object B_Ds: TButton
    Left = 248
    Top = 448
    Width = 81
    Height = 25
    Caption = #1053#1080#1078#1085#1080#1081' '#1089#1088#1077#1079
    TabOrder = 2
    OnClick = B_DsClick
  end
  object B_Us: TButton
    Left = 464
    Top = 448
    Width = 83
    Height = 25
    Caption = #1042#1077#1088#1093#1085#1080#1081' '#1089#1088#1077#1079
    TabOrder = 3
    OnClick = B_UsClick
  end
  object M_Us: TMemo
    Left = 456
    Top = 480
    Width = 209
    Height = 129
    ImeName = #1056#1091#1089#1089#1082#1072#1103
    ReadOnly = True
    TabOrder = 4
    OnClick = M_UsClick
  end
  object B_Ac: TButton
    Left = 128
    Top = 552
    Width = 105
    Height = 25
    Caption = #1040#1094#1080#1082#1083#1080#1095#1085#1086#1089#1090#1100
    TabOrder = 5
    OnClick = B_AcClick
  end
  object B_Sppl: TButton
    Left = 16
    Top = 488
    Width = 105
    Height = 25
    Caption = #1044#1086#1087#1086#1083#1085#1077#1085#1080#1077
    TabOrder = 6
    OnClick = B_SpplClick
  end
  object B_Inv: TButton
    Left = 16
    Top = 520
    Width = 105
    Height = 25
    Caption = #1054#1073#1088#1072#1097#1077#1085#1080#1077
    TabOrder = 7
    OnClick = B_InvClick
  end
  object B_Is: TButton
    Left = 128
    Top = 520
    Width = 105
    Height = 25
    Caption = #1055#1077#1088#1077#1089#1077#1095#1077#1085#1080#1077
    TabOrder = 8
    OnClick = B_IsClick
  end
  object B_Un: TButton
    Left = 128
    Top = 488
    Width = 105
    Height = 25
    Caption = #1054#1073#1098#1077#1076#1080#1085#1077#1085#1080#1077
    TabOrder = 9
    OnClick = B_UnClick
  end
  object B_Dgr: TButton
    Left = 16
    Top = 584
    Width = 73
    Height = 25
    Caption = #1057#1090#1077#1087#1077#1085#1100
    TabOrder = 10
    OnClick = B_DgrClick
  end
  object E_Dgr: TEdit
    Left = 96
    Top = 584
    Width = 25
    Height = 21
    ImeName = #1056#1091#1089#1089#1082#1072#1103
    TabOrder = 11
    Text = '2'
  end
  object B_Dual: TButton
    Left = 16
    Top = 552
    Width = 105
    Height = 25
    Caption = #1044#1074#1086#1081#1089#1090#1074#1077#1085#1085#1086#1089#1090#1100
    TabOrder = 12
    OnClick = B_DualClick
  end
  object B_GmLn: TButton
    Left = 128
    Top = 584
    Width = 105
    Height = 25
    Caption = #1043#1086#1084#1086#1084#1086#1088#1092#1080#1079#1084' '
    TabOrder = 13
    OnClick = B_GmLnClick
  end
  object XPManifest1: TXPManifest
    Left = 792
    Top = 704
  end
end
