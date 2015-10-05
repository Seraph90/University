object Form1: TForm1
  Left = 379
  Top = 272
  Width = 516
  Height = 538
  Caption = 'Form1'
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Timer1: TTimer
    Interval = 500
    OnTimer = Timer1Timer
    Left = 32
    Top = 8
  end
  object Timer2: TTimer
    Enabled = False
    OnTimer = Timer2Timer
    Left = 296
    Top = 8
  end
  object Timer3: TTimer
    Interval = 50
    OnTimer = Timer3Timer
    Left = 8
    Top = 472
  end
end
