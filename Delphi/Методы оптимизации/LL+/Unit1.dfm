object Form1: TForm1
  Left = 270
  Top = 18
  Width = 1000
  Height = 853
  Caption = 'Level lines'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object I_LL: TImage
    Left = 8
    Top = 8
    Width = 777
    Height = 777
    OnMouseMove = I_LLMouseMove
  end
  object L_x: TLabel
    Left = 864
    Top = 16
    Width = 3
    Height = 13
  end
  object L_y: TLabel
    Left = 864
    Top = 32
    Width = 3
    Height = 13
  end
  object L_z: TLabel
    Left = 864
    Top = 48
    Width = 3
    Height = 13
  end
  object I_Grad: TImage
    Left = 792
    Top = 8
    Width = 57
    Height = 777
  end
  object SE_c: TSpinEdit
    Left = 856
    Top = 80
    Width = 121
    Height = 22
    MaxValue = 200
    MinValue = 1
    TabOrder = 0
    Value = 80
    OnChange = SE_cChange
  end
  object B_Redraw: TButton
    Left = 856
    Top = 104
    Width = 121
    Height = 25
    Caption = 'Redraw'
    TabOrder = 1
    OnClick = B_RedrawClick
  end
end
