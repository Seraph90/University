object Form1: TForm1
  Left = 288
  Top = 99
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderStyle = bsSingle
  Caption = 'Graph v10.2.2.3-.2.1.1.1.1.1.1'
  ClientHeight = 440
  ClientWidth = 735
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
    Left = 304
    Top = 8
    Width = 425
    Height = 425
    OnMouseDown = Image1MouseDown
    OnMouseMove = Image1MouseMove
    OnMouseUp = Image1MouseUp
  end
  object Image2: TImage
    Left = 736
    Top = 8
    Width = 425
    Height = 425
    OnMouseDown = Image2MouseDown
    OnMouseMove = Image2MouseMove
    OnMouseUp = Image2MouseUp
  end
  object I_R: TImage
    Left = 736
    Top = 8
    Width = 257
    Height = 105
    Visible = False
  end
  object I_G: TImage
    Left = 736
    Top = 160
    Width = 257
    Height = 105
    Visible = False
  end
  object I_B: TImage
    Left = 736
    Top = 328
    Width = 257
    Height = 105
    Visible = False
  end
  object PC_Labs: TPageControl
    Left = 8
    Top = 8
    Width = 289
    Height = 297
    ActivePage = TabSheet4
    MultiLine = True
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    OnChange = PC_LabsChange
    object TabSheet1: TTabSheet
      Caption = '1. Line'
      object RadioGroup1: TRadioGroup
        Left = 8
        Top = 16
        Width = 265
        Height = 137
        Caption = 'Algorithm'
        ItemIndex = 0
        Items.Strings = (
          'Bresenham'
          'DDA')
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = '2. Ellipse'
      ImageIndex = 1
      object RadioGroup2: TRadioGroup
        Left = 8
        Top = 16
        Width = 265
        Height = 137
        Caption = 'Form'
        ItemIndex = 0
        Items.Strings = (
          'Circle'
          'Ellipse')
        TabOrder = 0
      end
    end
    object TabSheet3: TTabSheet
      Caption = '3. Fill'
      ImageIndex = 2
      object RadioGroup3: TRadioGroup
        Left = 8
        Top = 16
        Width = 265
        Height = 137
        Caption = 'Algorithm'
        ItemIndex = 0
        Items.Strings = (
          'Priming'
          'By line'
          'Filling triangle')
        TabOrder = 0
        OnClick = RadioGroup3Click
      end
    end
    object TabSheet4: TTabSheet
      Caption = '4. Affine T'
      ImageIndex = 3
      object RadioGroup5: TRadioGroup
        Left = 8
        Top = 16
        Width = 265
        Height = 137
        Caption = 'Dimensions'
        ItemIndex = 1
        Items.Strings = (
          '2D'
          '3D')
        TabOrder = 0
      end
      object B_Start: TButton
        Left = 8
        Top = 168
        Width = 75
        Height = 25
        Caption = 'Start'
        TabOrder = 1
        OnClick = B_StartClick
      end
      object B_Stop: TButton
        Left = 8
        Top = 200
        Width = 75
        Height = 25
        Caption = 'Stop'
        TabOrder = 2
        OnClick = B_StopClick
      end
      object B_IncFi: TButton
        Left = 88
        Top = 168
        Width = 33
        Height = 25
        Caption = 'Fi+'
        TabOrder = 3
        OnClick = B_IncFiClick
      end
      object B_DecFi: TButton
        Left = 88
        Top = 200
        Width = 33
        Height = 25
        Caption = 'Fi-'
        TabOrder = 4
        OnClick = B_DecFiClick
      end
      object B_IncPsi: TButton
        Left = 128
        Top = 168
        Width = 33
        Height = 25
        Caption = 'Psi+'
        TabOrder = 5
        OnClick = B_IncPsiClick
      end
      object B_DecPsi: TButton
        Left = 128
        Top = 200
        Width = 33
        Height = 25
        Caption = 'Psi-'
        TabOrder = 6
        OnClick = B_DecPsiClick
      end
      object B_IncKsi: TButton
        Left = 168
        Top = 168
        Width = 33
        Height = 25
        Caption = 'Ksi+'
        TabOrder = 7
        OnClick = B_IncKsiClick
      end
      object B_DecKsi: TButton
        Left = 168
        Top = 200
        Width = 33
        Height = 25
        Caption = 'Ksi-'
        TabOrder = 8
        OnClick = B_DecKsiClick
      end
    end
    object TabSheet5: TTabSheet
      Caption = '5. Cut CS'
      ImageIndex = 4
      object SB_Win: TSpeedButton
        Left = 8
        Top = 8
        Width = 73
        Height = 25
        GroupIndex = 1
        Caption = 'Window'
      end
      object SB_Lin: TSpeedButton
        Left = 96
        Top = 8
        Width = 73
        Height = 25
        GroupIndex = 1
        Caption = 'Lines'
      end
      object SG_Win: TStringGrid
        Left = 10
        Top = 40
        Width = 68
        Height = 53
        ColCount = 2
        DefaultColWidth = 32
        FixedCols = 0
        RowCount = 2
        FixedRows = 0
        ScrollBars = ssNone
        TabOrder = 0
      end
      object SG_UDRL: TStringGrid
        Left = 90
        Top = 40
        Width = 167
        Height = 52
        ColCount = 4
        DefaultColWidth = 40
        FixedCols = 0
        RowCount = 2
        FixedRows = 0
        ScrollBars = ssNone
        TabOrder = 1
      end
    end
    object TabSheet6: TTabSheet
      Caption = '6. Image filter'
      ImageIndex = 5
      object Label1: TLabel
        Left = 16
        Top = 24
        Width = 47
        Height = 13
        Caption = 'Core filter:'
      end
      object SG_f: TStringGrid
        Left = 8
        Top = 40
        Width = 103
        Height = 79
        ColCount = 3
        DefaultColWidth = 32
        FixedCols = 0
        RowCount = 3
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
        ScrollBars = ssNone
        TabOrder = 0
      end
      object B_F: TButton
        Left = 120
        Top = 128
        Width = 153
        Height = 25
        Caption = 'Filter'
        TabOrder = 1
        OnClick = B_FClick
      end
      object RadioGroup4: TRadioGroup
        Left = 120
        Top = 24
        Width = 153
        Height = 89
        Caption = 'Filters'
        Items.Strings = (
          'High frequency'
          'Low frequency')
        TabOrder = 2
        OnClick = RadioGroup4Click
      end
      object E_Fctr: TEdit
        Left = 7
        Top = 130
        Width = 105
        Height = 21
        TabOrder = 3
        Text = '1'
      end
    end
    object TabSheet7: TTabSheet
      Caption = '7. Median'
      ImageIndex = 6
      object Button3: TButton
        Left = 8
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Filter'
        TabOrder = 0
        OnClick = Button3Click
      end
      object PB_M: TProgressBar
        Left = 8
        Top = 128
        Width = 265
        Height = 17
        Max = 425
        TabOrder = 1
      end
    end
    object TabSheet8: TTabSheet
      Caption = '8. Histogram'
      ImageIndex = 7
      object TB_W: TTrackBar
        Left = 8
        Top = 56
        Width = 265
        Height = 45
        Max = 255
        TabOrder = 0
        OnChange = TBChange
      end
      object B_HCalc: TButton
        Left = 8
        Top = 16
        Width = 97
        Height = 25
        Caption = 'Show histogram'
        TabOrder = 1
        OnClick = B_HCalcClick
      end
      object TB_B: TTrackBar
        Left = 8
        Top = 96
        Width = 265
        Height = 45
        Max = 256
        Min = 1
        Position = 256
        TabOrder = 2
        OnChange = TBChange
      end
      object B_Exp: TButton
        Left = 112
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Expansion'
        TabOrder = 3
        OnClick = B_ExpComClick
      end
      object B_Com: TButton
        Left = 192
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Compression'
        TabOrder = 4
        OnClick = B_ExpComClick
      end
      object ProgressBar1: TProgressBar
        Left = 8
        Top = 136
        Width = 257
        Height = 17
        Max = 425
        TabOrder = 5
      end
    end
    object TabSheet9: TTabSheet
      Caption = '9. Imposition '
      ImageIndex = 8
      object Label2: TLabel
        Left = 16
        Top = 16
        Width = 53
        Height = 13
        Caption = 'Coefficient:'
      end
      object E_c: TEdit
        Left = 8
        Top = 32
        Width = 121
        Height = 21
        TabOrder = 0
        Text = '0,5'
      end
      object Button1: TButton
        Left = 8
        Top = 64
        Width = 121
        Height = 25
        Caption = 'Open'
        TabOrder = 1
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 8
        Top = 96
        Width = 121
        Height = 25
        Caption = 'Imposition'
        TabOrder = 2
        OnClick = Button2Click
      end
    end
    object TabSheet10: TTabSheet
      Caption = '10. Animation'
      ImageIndex = 9
      object SE_mz: TSpinEdit
        Left = 8
        Top = 8
        Width = 121
        Height = 22
        MaxValue = 10
        MinValue = 1
        TabOrder = 0
        Value = 5
        OnChange = SE_mzChange
      end
      object SE_Fs: TSpinEdit
        Left = 152
        Top = 8
        Width = 121
        Height = 22
        MaxValue = 1000
        MinValue = 1
        TabOrder = 1
        Value = 500
      end
      object SG_mz: TStringGrid
        Left = 0
        Top = 48
        Width = 153
        Height = 153
        ColCount = 6
        DefaultColWidth = 24
        RowCount = 6
        TabOrder = 2
        OnMouseDown = SG_mzMouseDown
      end
      object SG_XY2: TStringGrid
        Left = 160
        Top = 48
        Width = 129
        Height = 153
        ColCount = 3
        DefaultColWidth = 40
        RowCount = 6
        TabOrder = 3
        Visible = False
        ColWidths = (
          40
          41
          40)
        RowHeights = (
          24
          24
          24
          24
          24
          24)
      end
      object SG_XY: TStringGrid
        Left = 160
        Top = 48
        Width = 129
        Height = 153
        ColCount = 3
        DefaultColWidth = 40
        RowCount = 6
        TabOrder = 4
        RowHeights = (
          24
          24
          24
          24
          24
          24)
      end
      object B_Dup: TButton
        Left = 0
        Top = 208
        Width = 75
        Height = 25
        Caption = 'Duplicate'
        TabOrder = 5
        OnClick = B_DupClick
      end
      object B_Anime: TButton
        Left = 88
        Top = 208
        Width = 75
        Height = 25
        Caption = 'Animation'
        TabOrder = 6
        OnClick = B_AnimeClick
      end
    end
  end
  object B_Clr: TButton
    Left = 88
    Top = 376
    Width = 75
    Height = 25
    Caption = 'Clear'
    TabOrder = 1
    OnClick = B_ClrClick
  end
  object Panel1: TPanel
    Left = 168
    Top = 408
    Width = 129
    Height = 25
    ParentBackground = False
    TabOrder = 2
    OnClick = Panel1Click
  end
  object B_Opn: TButton
    Left = 8
    Top = 376
    Width = 75
    Height = 25
    Caption = 'Open'
    TabOrder = 3
    OnClick = B_OpnClick
  end
  object B_Rdrw: TButton
    Left = 88
    Top = 408
    Width = 75
    Height = 25
    Caption = 'Redraw'
    TabOrder = 4
    OnClick = B_RdrwClick
  end
  object B_BW: TButton
    Left = 168
    Top = 376
    Width = 129
    Height = 25
    Caption = 'Black and White'
    TabOrder = 5
    OnClick = B_BWClick
  end
  object B_Sav: TButton
    Left = 8
    Top = 408
    Width = 73
    Height = 25
    Caption = 'Save'
    TabOrder = 6
    OnClick = B_SavClick
  end
  object XPManifest1: TXPManifest
    Left = 40
    Top = 544
  end
  object ColorDialog1: TColorDialog
    Left = 8
    Top = 544
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 72
    Top = 544
  end
  object SavePictureDialog1: TSavePictureDialog
    Left = 104
    Top = 544
  end
  object T_Anime: TTimer
    Enabled = False
    Interval = 1
    OnTimer = T_AnimeTimer
    Left = 136
    Top = 544
  end
  object T_Aff: TTimer
    Enabled = False
    Interval = 50
    OnTimer = T_AffTimer
    Left = 12
    Top = 316
  end
end
