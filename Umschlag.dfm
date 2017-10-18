object Frm_Umschlag: TFrm_Umschlag
  Left = 205
  Top = 137
  Width = 536
  Height = 355
  Caption = 'Briefe drucken'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 248
    Top = 48
    Width = 13
    Height = 13
    Caption = 'An'
  end
  object Label2: TLabel
    Left = 248
    Top = 72
    Width = 38
    Height = 13
    Caption = 'Adresse'
  end
  object Label3: TLabel
    Left = 248
    Top = 144
    Width = 45
    Height = 13
    Caption = 'PLZ / Ort'
  end
  object Button1: TButton
    Left = 160
    Top = 104
    Width = 75
    Height = 25
    Caption = 'L'#246'schen'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 160
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Hinzuf'#252'gen'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 160
    Top = 72
    Width = 75
    Height = 25
    Caption = #196'ndern'
    TabOrder = 2
    OnClick = Button3Click
  end
  object EdAdr1: TEdit
    Left = 312
    Top = 64
    Width = 121
    Height = 21
    Color = clBtnFace
    MaxLength = 64
    ReadOnly = True
    TabOrder = 3
  end
  object EdAdr2: TEdit
    Left = 312
    Top = 84
    Width = 121
    Height = 21
    Color = clBtnFace
    MaxLength = 64
    ReadOnly = True
    TabOrder = 4
  end
  object EdPLZ: TEdit
    Left = 312
    Top = 136
    Width = 41
    Height = 21
    Color = clBtnFace
    MaxLength = 5
    ReadOnly = True
    TabOrder = 5
  end
  object EdOrt: TEdit
    Left = 352
    Top = 136
    Width = 81
    Height = 21
    Color = clBtnFace
    MaxLength = 32
    ReadOnly = True
    TabOrder = 6
  end
  object EdAdr3: TEdit
    Left = 312
    Top = 104
    Width = 121
    Height = 21
    Color = clBtnFace
    MaxLength = 64
    ReadOnly = True
    TabOrder = 7
  end
  object GroupsBox: TComboBox
    Left = 8
    Top = 8
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 8
    OnChange = GroupsBoxChange
    OnDropDown = GroupsBoxDropDown
  end
  object AddrBox: TListBox
    Left = 8
    Top = 32
    Width = 145
    Height = 289
    ItemHeight = 13
    Sorted = True
    TabOrder = 9
    OnClick = AddrBoxClick
  end
  object GroupsEd: TEdit
    Left = 160
    Top = 8
    Width = 121
    Height = 21
    MaxLength = 32
    TabOrder = 10
  end
  object Button4: TButton
    Left = 448
    Top = 8
    Width = 75
    Height = 25
    Caption = 'L'#246'schen'
    Enabled = False
    TabOrder = 11
  end
  object Button5: TButton
    Left = 288
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Hinzuf'#252'gen'
    TabOrder = 12
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 368
    Top = 8
    Width = 75
    Height = 25
    Caption = #196'ndern'
    Enabled = False
    TabOrder = 13
  end
  object Button7: TButton
    Left = 160
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Drucken'
    TabOrder = 14
    OnClick = Button7Click
  end
  object Person: TEdit
    Left = 312
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 15
  end
  object Button8: TButton
    Left = 448
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Zur'#252'ck'
    TabOrder = 16
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 240
    Top = 296
    Width = 97
    Height = 25
    Caption = 'Papier einstellen'
    TabOrder = 17
    OnClick = Button9Click
  end
  object PDlg: TPrintDialog
    Left = 272
    Top = 80
  end
  object PSDlg: TPrinterSetupDialog
    Left = 272
    Top = 112
  end
  object PgSetup: TPageSetupDialog
    MinMarginLeft = 2500
    MinMarginTop = 2500
    MinMarginRight = 2500
    MinMarginBottom = 2500
    MarginLeft = 2500
    MarginTop = 2500
    MarginRight = 2500
    MarginBottom = 2500
    Options = [psoDefaultMinMargins, psoDisableMargins]
    PageWidth = 22000
    PageHeight = 11000
    Units = pmMillimeters
    OnDrawMargin = PgSetupDrawMargin
    OnDrawGreekText = PgSetupDrawEnvStamp
    OnDrawEnvStamp = PgSetupDrawEnvStamp
    OnDrawRetAddress = PgSetupDrawEnvStamp
    Left = 160
    Top = 264
  end
end
