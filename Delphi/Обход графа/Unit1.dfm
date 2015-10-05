object Form1: TForm1
  Left = 239
  Top = 153
  Width = 862
  Height = 481
  Caption = 'AOD '#8470'5'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 408
    Top = 8
    Width = 425
    Height = 425
    OnMouseDown = Image1MouseDown
    OnMouseMove = Image1MouseMove
    OnMouseUp = Image1MouseUp
  end
  object SG_A: TStringGrid
    Left = 8
    Top = 32
    Width = 193
    Height = 193
    DefaultColWidth = 20
    DefaultRowHeight = 20
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 0
  end
  object BB_Ok: TBitBtn
    Left = 152
    Top = 8
    Width = 49
    Height = 21
    TabOrder = 1
    OnClick = BB_OkClick
    Kind = bkOK
  end
  object SG_XY: TStringGrid
    Left = 8
    Top = 240
    Width = 193
    Height = 193
    ColCount = 3
    DefaultColWidth = 45
    DefaultRowHeight = 20
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 2
  end
  object SG_L: TStringGrid
    Left = 208
    Top = 8
    Width = 193
    Height = 281
    ColCount = 3
    DefaultColWidth = 45
    DefaultRowHeight = 20
    RowCount = 13
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 3
  end
  object BB_Redraw: TBitBtn
    Left = 208
    Top = 296
    Width = 193
    Height = 25
    Caption = '&Redraw'
    TabOrder = 4
    OnClick = BB_RedrawClick
    Kind = bkRetry
  end
  object E_n: TSpinEdit
    Left = 8
    Top = 8
    Width = 137
    Height = 22
    Increment = 2
    MaxValue = 12
    MinValue = 4
    TabOrder = 5
    Value = 4
    OnChange = E_nChange
  end
  object BB_Solve: TBitBtn
    Left = 208
    Top = 376
    Width = 193
    Height = 25
    Caption = '&GoWay'
    TabOrder = 6
    OnClick = BB_SolveClick
    Kind = bkHelp
  end
  object Edit1: TEdit
    Left = 208
    Top = 328
    Width = 25
    Height = 21
    TabOrder = 7
    Text = '1'
  end
  object Edit2: TEdit
    Left = 240
    Top = 328
    Width = 25
    Height = 21
    TabOrder = 8
    Text = '2'
  end
  object Edit3: TEdit
    Left = 272
    Top = 328
    Width = 129
    Height = 21
    TabOrder = 9
    Text = 'LLRLRR'
  end
  object Edit4: TEdit
    Left = 208
    Top = 352
    Width = 193
    Height = 21
    TabOrder = 10
  end
  object BB_PF: TBitBtn
    Left = 208
    Top = 408
    Width = 193
    Height = 25
    Caption = '&PathFinder'
    TabOrder = 11
    OnClick = BB_PFClick
    Kind = bkHelp
  end
  object XPManifest1: TXPManifest
    Left = 848
    Top = 520
  end
end
