object Form1: TForm1
  Left = 488
  Top = 211
  Width = 132
  Height = 95
  Caption = '9'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object TDo: TTimer
    Enabled = False
    Interval = 50
    OnTimer = TDoTimer
    Left = 8
    Top = 8
  end
end
