object Form1: TForm1
  Left = 370
  Top = 155
  Width = 832
  Height = 687
  Caption = '9'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    816
    649)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 10
    Height = 13
    Caption = 'a:'
  end
  object Label2: TLabel
    Left = 16
    Top = 64
    Width = 10
    Height = 13
    Caption = 'b:'
  end
  object Label3: TLabel
    Left = 144
    Top = 8
    Width = 10
    Height = 13
    Caption = 'e:'
  end
  object Label4: TLabel
    Left = 144
    Top = 64
    Width = 8
    Height = 13
    Caption = 'f:'
  end
  object Label5: TLabel
    Left = 144
    Top = 120
    Width = 46
    Height = 13
    Caption = 'Optimum:'
  end
  object E_a: TEdit
    Left = 8
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '-2,5'
  end
  object E_b: TEdit
    Left = 8
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '10'
  end
  object E_R: TEdit
    Left = 136
    Top = 136
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object B_MB: TButton
    Left = 8
    Top = 107
    Width = 121
    Height = 25
    Caption = 'Start MB'
    TabOrder = 3
    OnClick = B_MBClick
  end
  object SG_S: TStringGrid
    Left = 264
    Top = 8
    Width = 545
    Height = 634
    Anchors = [akLeft, akTop, akBottom]
    ColCount = 8
    FixedCols = 0
    RowCount = 2
    ScrollBars = ssVertical
    TabOrder = 4
  end
  object E_e: TEdit
    Left = 136
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 5
    Text = '0,00001'
  end
  object CB_f: TComboBox
    Left = 136
    Top = 80
    Width = 121
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 6
    Text = '(x^2-4)/(2*x+5)'
    OnChange = CB_fChange
    Items.Strings = (
      '(x^2-4)/(2*x+5)'
      'x^2'
      '10*sin(x)+x^2')
  end
  object B_GSM: TButton
    Left = 8
    Top = 136
    Width = 121
    Height = 25
    Caption = 'Start GSM'
    TabOrder = 7
    OnClick = B_GSMClick
  end
end
