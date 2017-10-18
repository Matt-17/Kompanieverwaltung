object Frm_Stat: TFrm_Stat
  Left = 224
  Top = 96
  BorderStyle = bsSingle
  Caption = 'Statistik'
  ClientHeight = 560
  ClientWidth = 654
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label36: TLabel
    Left = 536
    Top = 368
    Width = 36
    Height = 13
    Caption = 'Gesamt'
  end
  object LblG: TLabel
    Left = 592
    Top = 368
    Width = 22
    Height = 13
    Caption = 'LblG'
  end
  object GroupBox1: TGroupBox
    Left = 504
    Top = 176
    Width = 145
    Height = 81
    Caption = 'Status'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 64
      Width = 33
      Height = 13
      Caption = 'GWDL'
    end
    object Label2: TLabel
      Left = 8
      Top = 48
      Width = 31
      Height = 13
      Caption = 'FWDL'
    end
    object Label3: TLabel
      Left = 8
      Top = 32
      Width = 20
      Height = 13
      Caption = 'SaZ'
    end
    object Label4: TLabel
      Left = 8
      Top = 16
      Width = 14
      Height = 13
      Caption = 'BS'
    end
    object LblS1: TLabel
      Left = 104
      Top = 64
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'LblS1'
    end
    object LblS2: TLabel
      Left = 104
      Top = 48
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'LblS2'
    end
    object LblS3: TLabel
      Left = 104
      Top = 32
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'LblS3'
    end
    object LblS4: TLabel
      Left = 104
      Top = 16
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'LblS4'
    end
  end
  object BtnOK: TButton
    Left = 536
    Top = 512
    Width = 75
    Height = 25
    Caption = 'Ok'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = BtnOKClick
  end
  object GroupBox2: TGroupBox
    Left = 504
    Top = 8
    Width = 145
    Height = 105
    Caption = 'Zug'
    TabOrder = 2
    object Label5: TLabel
      Left = 8
      Top = 16
      Width = 83
      Height = 13
      Caption = 'Kompanief'#252'hrung'
    end
    object Label6: TLabel
      Left = 8
      Top = 48
      Width = 36
      Height = 13
      Caption = 'Eskorte'
    end
    object Label7: TLabel
      Left = 8
      Top = 64
      Width = 76
      Height = 13
      Caption = 'Personenschutz'
    end
    object Label8: TLabel
      Left = 8
      Top = 32
      Width = 59
      Height = 13
      Caption = 'Absicherung'
    end
    object LblZ1: TLabel
      Left = 104
      Top = 16
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'LblZ1'
    end
    object LblZ3: TLabel
      Left = 104
      Top = 48
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'LblZ3'
    end
    object LblZ4: TLabel
      Left = 104
      Top = 64
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'LblZ4'
    end
    object LblZ2: TLabel
      Left = 104
      Top = 32
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'LblZ2'
    end
    object Label9: TLabel
      Left = 8
      Top = 88
      Width = 18
      Height = 13
      Caption = 'BfD'
    end
    object LblZ5: TLabel
      Left = 104
      Top = 88
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'LblZ5'
    end
  end
  object GroupBox3: TGroupBox
    Left = 504
    Top = 120
    Width = 145
    Height = 49
    Caption = 'Geschlecht'
    TabOrder = 3
    object Label10: TLabel
      Left = 8
      Top = 16
      Width = 43
      Height = 13
      Caption = 'M'#228'nnlich'
    end
    object Label11: TLabel
      Left = 8
      Top = 32
      Width = 41
      Height = 13
      Caption = 'Weiblich'
    end
    object LblM1: TLabel
      Left = 104
      Top = 16
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'LblM1'
    end
    object LblM2: TLabel
      Left = 104
      Top = 32
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'LblM2'
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 8
    Width = 497
    Height = 545
    Caption = 'Dienstgrade'
    TabOrder = 4
    object DstGrid: TStringGrid
      Left = 2
      Top = 15
      Width = 493
      Height = 528
      Align = alClient
      BorderStyle = bsNone
      Color = clBtnFace
      ColCount = 11
      Ctl3D = False
      DefaultColWidth = 40
      DefaultRowHeight = 14
      FixedColor = clWhite
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSizing, goColSizing]
      ParentCtl3D = False
      TabOrder = 0
    end
  end
  object Button1: TButton
    Left = 536
    Top = 480
    Width = 75
    Height = 25
    Caption = 'Drucken'
    TabOrder = 5
    OnClick = Button1Click
  end
  object GroupBox5: TGroupBox
    Left = 504
    Top = 264
    Width = 145
    Height = 81
    Caption = 'DG Zusatz'
    TabOrder = 6
    object Label12: TLabel
      Left = 8
      Top = 64
      Width = 15
      Height = 13
      Caption = 'OA'
    end
    object Label13: TLabel
      Left = 8
      Top = 48
      Width = 13
      Height = 13
      Caption = 'FA'
    end
    object Label14: TLabel
      Left = 8
      Top = 32
      Width = 15
      Height = 13
      Caption = 'UA'
    end
    object Label15: TLabel
      Left = 8
      Top = 16
      Width = 24
      Height = 13
      Caption = 'ohne'
    end
    object LblDZ4: TLabel
      Left = 96
      Top = 64
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'LblDZ4'
    end
    object LblDZ3: TLabel
      Left = 96
      Top = 48
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'LblDZ3'
    end
    object LblDZ2: TLabel
      Left = 96
      Top = 32
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'LblDZ2'
    end
    object LblDZ1: TLabel
      Left = 96
      Top = 16
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'LblDZ1'
    end
  end
  object CheckBox1: TCheckBox
    Left = 504
    Top = 456
    Width = 97
    Height = 17
    Caption = 'Nullen anzeigen'
    TabOrder = 7
    OnClick = CheckBox1Click
  end
end
