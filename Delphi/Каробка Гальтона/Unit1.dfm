object Form1: TForm1
  Left = 699
  Top = 11
  Width = 519
  Height = 831
  Caption = 'Galtons Box'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object I_G: TImage
    Left = 8
    Top = 8
    Width = 425
    Height = 753
    OnClick = I_GClick
  end
  object SG: TStringGrid
    Left = 440
    Top = 8
    Width = 41
    Height = 753
    ColCount = 1
    DefaultColWidth = 32
    DefaultRowHeight = 13
    FixedCols = 0
    RowCount = 53
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 0
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 768
    Width = 273
    Height = 17
    TabOrder = 1
  end
  object RB1: TRadioButton
    Left = 360
    Top = 768
    Width = 41
    Height = 17
    Caption = 'Min'
    Checked = True
    TabOrder = 4
    TabStop = True
  end
  object RB2: TRadioButton
    Left = 400
    Top = 768
    Width = 41
    Height = 17
    Caption = 'Mid'
    TabOrder = 3
  end
  object RB3: TRadioButton
    Left = 440
    Top = 768
    Width = 41
    Height = 17
    Caption = 'Max'
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 288
    Top = 768
    Width = 65
    Height = 21
    TabOrder = 5
    Text = '50000'
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 488
    Top = 8
  end
end
