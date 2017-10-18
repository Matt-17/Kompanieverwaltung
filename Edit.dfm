object FrmEdit: TFrmEdit
  Left = 320
  Top = 148
  BorderStyle = bsDialog
  Caption = 'Soldat bearbeiten'
  ClientHeight = 480
  ClientWidth = 579
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 33
    Height = 13
    Caption = 'Name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 40
    Width = 42
    Height = 13
    Caption = 'Vorname'
  end
  object Label3: TLabel
    Left = 16
    Top = 88
    Width = 17
    Height = 13
    Caption = 'PK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 16
    Top = 112
    Width = 23
    Height = 13
    Caption = 'Zug'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 16
    Top = 64
    Width = 62
    Height = 13
    Caption = 'Dienstgrad'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 16
    Top = 136
    Width = 115
    Height = 13
    Caption = 'Truppenausweisnummer'
  end
  object Label7: TLabel
    Left = 16
    Top = 160
    Width = 30
    Height = 13
    Caption = 'Status'
  end
  object DZE: TLabel
    Left = 16
    Top = 184
    Width = 22
    Height = 13
    Caption = 'DZE'
  end
  object Label8: TLabel
    Left = 304
    Top = 16
    Width = 25
    Height = 13
    Caption = 'WBV'
  end
  object Label9: TLabel
    Left = 304
    Top = 64
    Width = 38
    Height = 13
    Caption = 'Adresse'
  end
  object Label10: TLabel
    Left = 304
    Top = 112
    Width = 37
    Height = 13
    Caption = 'PLZ Ort'
  end
  object Label11: TLabel
    Left = 304
    Top = 136
    Width = 79
    Height = 13
    Caption = 'Telefonnummern'
  end
  object Label13: TLabel
    Left = 16
    Top = 232
    Width = 66
    Height = 13
    Caption = 'Bemerkungen'
  end
  object GebLbl: TLabel
    Left = 16
    Top = 208
    Width = 52
    Height = 13
    Caption = 'Geburtstag'
  end
  object KfzLbl: TLabel
    Left = 304
    Top = 208
    Width = 15
    Height = 13
    Caption = 'Kfz'
  end
  object Label16: TLabel
    Left = 304
    Top = 232
    Width = 62
    Height = 13
    Caption = 'Kennzeichen'
  end
  object EditName: TEdit
    Left = 136
    Top = 8
    Width = 160
    Height = 21
    TabOrder = 0
  end
  object EditVorname: TEdit
    Left = 136
    Top = 32
    Width = 160
    Height = 21
    TabOrder = 1
  end
  object EditPK1: TEdit
    Left = 136
    Top = 80
    Width = 73
    Height = 21
    MaxLength = 6
    TabOrder = 2
  end
  object EditPK2: TEdit
    Left = 208
    Top = 80
    Width = 17
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 1
    TabOrder = 3
  end
  object EditPK3: TEdit
    Left = 224
    Top = 80
    Width = 73
    Height = 21
    MaxLength = 5
    TabOrder = 4
  end
  object Button1: TButton
    Left = 392
    Top = 448
    Width = 83
    Height = 25
    Caption = '&Zur'#252'cksetzen'
    TabOrder = 5
    OnClick = Button1Click
  end
  object BoxZug: TComboBox
    Left = 136
    Top = 104
    Width = 160
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 6
  end
  object BoxDG: TComboBox
    Left = 136
    Top = 56
    Width = 121
    Height = 21
    Style = csDropDownList
    DropDownCount = 30
    ItemHeight = 13
    TabOrder = 7
  end
  object EditDZE: TDateTimePicker
    Left = 136
    Top = 176
    Width = 160
    Height = 21
    Date = 38019.469301550930000000
    Time = 38019.469301550930000000
    TabOrder = 8
  end
  object Button2: TButton
    Left = 304
    Top = 448
    Width = 83
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 9
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 392
    Top = 8
    Width = 153
    Height = 21
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 10
    Text = '1'
    OnChange = Edit1Change
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 328
    Width = 545
    Height = 113
    Caption = 'Lehrg'#228'nge'
    TabOrder = 11
    object LGa: TDateTimePicker
      Left = 8
      Top = 16
      Width = 92
      Height = 21
      Date = 38027.483038113420000000
      Time = 38027.483038113420000000
      TabOrder = 0
      OnCloseUp = LGaChange
      OnChange = LGaChange
    end
    object LGb: TDateTimePicker
      Left = 104
      Top = 16
      Width = 92
      Height = 21
      Date = 38027.483110787030000000
      Time = 38027.483110787030000000
      TabOrder = 1
      OnCloseUp = LGbChange
      OnChange = LGbChange
    end
    object EdLG: TEdit
      Left = 200
      Top = 16
      Width = 257
      Height = 21
      TabOrder = 2
    end
    object BtnLGAdd: TButton
      Left = 464
      Top = 16
      Width = 73
      Height = 25
      Caption = 'Hinzuf'#252'gen'
      TabOrder = 3
      OnClick = BtnLGAddClick
    end
    object BtnLGChg: TButton
      Left = 464
      Top = 48
      Width = 73
      Height = 25
      Caption = 'Editieren'
      TabOrder = 4
      OnClick = BtnLGChgClick
    end
    object BtnLGDel: TButton
      Left = 464
      Top = 80
      Width = 73
      Height = 25
      Caption = 'L'#246'schen'
      TabOrder = 5
      OnClick = BtnLGDelClick
    end
    object LGGrid: TStringGrid
      Left = 8
      Top = 40
      Width = 449
      Height = 67
      ColCount = 3
      Ctl3D = True
      DefaultRowHeight = 15
      FixedCols = 0
      RowCount = 4
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
      ParentCtl3D = False
      ScrollBars = ssNone
      TabOrder = 6
      OnSelectCell = LGGridSelectCell
      ColWidths = (
        93
        96
        257)
    end
  end
  object Edit6: TEdit
    Left = 392
    Top = 56
    Width = 169
    Height = 21
    MaxLength = 64
    TabOrder = 12
  end
  object Edit7: TEdit
    Left = 392
    Top = 80
    Width = 169
    Height = 21
    MaxLength = 64
    TabOrder = 13
  end
  object Edit8: TEdit
    Left = 392
    Top = 104
    Width = 49
    Height = 21
    MaxLength = 5
    TabOrder = 14
  end
  object Edit9: TEdit
    Left = 440
    Top = 104
    Width = 121
    Height = 21
    MaxLength = 64
    TabOrder = 15
  end
  object Edit10: TEdit
    Left = 392
    Top = 128
    Width = 169
    Height = 21
    MaxLength = 16
    TabOrder = 16
  end
  object Edit11: TEdit
    Left = 392
    Top = 152
    Width = 169
    Height = 21
    MaxLength = 16
    TabOrder = 17
  end
  object Edit12: TEdit
    Left = 392
    Top = 176
    Width = 169
    Height = 21
    MaxLength = 16
    TabOrder = 18
  end
  object Button3: TButton
    Left = 480
    Top = 448
    Width = 83
    Height = 25
    Cancel = True
    Caption = '&Abbrechen'
    ModalResult = 2
    TabOrder = 19
  end
  object UpDown1: TUpDown
    Left = 545
    Top = 8
    Width = 16
    Height = 21
    Associate = Edit1
    Min = 1
    Max = 7
    Position = 1
    TabOrder = 20
  end
  object Label12: TPanel
    Left = 392
    Top = 32
    Width = 169
    Height = 21
    ParentShowHint = False
    ShowHint = True
    TabOrder = 21
  end
  object MarkChck: TCheckBox
    Left = 304
    Top = 308
    Width = 73
    Height = 17
    Caption = 'Markieren'
    TabOrder = 22
  end
  object MarkColBox: TColorBox
    Left = 392
    Top = 303
    Width = 169
    Height = 21
    DefaultColorColor = clWhite
    Selected = clWhite
    Style = [cbStandardColors, cbExtendedColors]
    DropDownCount = 20
    ItemHeight = 15
    TabOrder = 23
  end
  object EdBem: TMemo
    Left = 16
    Top = 248
    Width = 281
    Height = 81
    TabOrder = 24
  end
  object EditStat: TComboBox
    Left = 136
    Top = 152
    Width = 161
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 25
    Text = 'GWDL'
    Items.Strings = (
      'GWDL'
      'FWDL'
      'SaZ'
      'BS')
  end
  object GeschlechtGrp: TRadioGroup
    Left = 392
    Top = 248
    Width = 169
    Height = 33
    Caption = 'Geschlecht'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'M'#228'nnlich'
      'Weiblich')
    TabOrder = 26
  end
  object TANEdit: TEdit
    Left = 136
    Top = 128
    Width = 161
    Height = 21
    MaxLength = 7
    TabOrder = 27
  end
  object EditKZ: TEdit
    Left = 392
    Top = 224
    Width = 169
    Height = 21
    MaxLength = 32
    TabOrder = 28
  end
  object EditKFZ: TEdit
    Left = 392
    Top = 200
    Width = 169
    Height = 21
    MaxLength = 16
    TabOrder = 29
  end
  object EditBDay: TDateTimePicker
    Left = 136
    Top = 200
    Width = 161
    Height = 21
    Date = 38027.483038113420000000
    Time = 38027.483038113420000000
    TabOrder = 30
    OnCloseUp = LGaChange
    OnChange = LGaChange
  end
  object Button4: TButton
    Left = 16
    Top = 448
    Width = 105
    Height = 25
    Caption = '&Wiederaufnehmen'
    TabOrder = 31
    Visible = False
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 304
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Button5'
    TabOrder = 32
  end
  object BoxDZ: TComboBox
    Left = 256
    Top = 56
    Width = 41
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 33
  end
end
