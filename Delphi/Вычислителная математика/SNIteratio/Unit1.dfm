object Form1: TForm1
  Left = 226
  Top = 374
  Width = 585
  Height = 330
  Caption = #1056#1077#1096#1077#1085#1080#1077' '#1089#1080#1089#1090#1077#1084#1099' '#1085#1077#1083#1080#1085#1077#1081#1085#1099#1093' '#1091#1088#1072#1074#1085#1077#1085#1080#1081
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
  object L_q4: TLabel
    Left = 6
    Top = 126
    Width = 3
    Height = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object L_q3: TLabel
    Left = 6
    Top = 102
    Width = 3
    Height = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object L_q2: TLabel
    Left = 6
    Top = 30
    Width = 15
    Height = 16
    Caption = 'q2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object L_q1: TLabel
    Left = 6
    Top = 6
    Width = 15
    Height = 16
    Caption = 'q1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 496
    Top = 72
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
  object Label4: TLabel
    Left = 400
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
  object Label2: TLabel
    Left = 400
    Top = 8
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
  object Label1: TLabel
    Left = 400
    Top = 72
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
  object E_e: TEdit
    Left = 392
    Top = 24
    Width = 121
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = '0,001'
    OnChange = E_eChange
  end
  object E_Y0: TEdit
    Left = 488
    Top = 88
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
    OnChange = E_Y0Change
  end
  object E_X0: TEdit
    Left = 392
    Top = 88
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
    OnChange = E_X0Change
  end
  object Solve: TButton
    Left = 392
    Top = 120
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
    Left = 8
    Top = 152
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
  object CheckBox1: TCheckBox
    Left = 536
    Top = 32
    Width = 17
    Height = 17
    TabOrder = 5
  end
end
