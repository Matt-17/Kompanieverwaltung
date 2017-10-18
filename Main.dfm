object FrmMainList: TFrmMainList
  Left = 197
  Top = 282
  Width = 680
  Height = 450
  Caption = 'Kompanie '#220'bersicht'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 672
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 3
      Width = 101
      Height = 13
      Caption = 'Schnellsuche - Name'
    end
    object LblName: TLabel
      Left = 248
      Top = 8
      Width = 70
      Height = 13
      AutoSize = False
      Caption = 'Name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblPK: TLabel
      Left = 520
      Top = 8
      Width = 40
      Height = 13
      AutoSize = False
      Caption = 'PK'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblTA: TLabel
      Left = 520
      Top = 24
      Width = 40
      Height = 13
      AutoSize = False
      Caption = 'TrANr'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblWBV: TLabel
      Left = 520
      Top = 40
      Width = 40
      Height = 13
      AutoSize = False
      Caption = 'WBV'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblDG: TLabel
      Left = 248
      Top = 40
      Width = 70
      Height = 13
      AutoSize = False
      Caption = 'Dienstgrad'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblShowName: TLabel
      Left = 328
      Top = 8
      Width = 3
      Height = 13
    end
    object LblShowDG: TLabel
      Left = 328
      Top = 40
      Width = 3
      Height = 13
    end
    object LblShowPK: TLabel
      Left = 568
      Top = 8
      Width = 3
      Height = 13
    end
    object LblShowTA: TLabel
      Left = 568
      Top = 24
      Width = 89
      Height = 13
      AutoSize = False
    end
    object LblShowWBV: TLabel
      Left = 568
      Top = 40
      Width = 89
      Height = 13
      AutoSize = False
      ParentShowHint = False
      ShowHint = True
    end
    object CountLbl: TLabel
      Left = 8
      Top = 42
      Width = 28
      Height = 13
      Caption = 'Count'
    end
    object EditSrch: TEdit
      Left = 8
      Top = 18
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = EditSrchChange
      OnClick = EditSrchEnter
      OnEnter = EditSrchEnter
      OnKeyDown = EditSrchKeyDown
    end
  end
  object StatBar: TStatusBar
    Left = 0
    Top = 385
    Width = 672
    Height = 19
    Panels = <
      item
        Width = 50
      end
      item
        Alignment = taCenter
        Width = 140
      end
      item
        Width = 50
      end>
  end
  object TabCtrl: TTabControl
    Left = 0
    Top = 57
    Width = 672
    Height = 328
    Align = alClient
    TabOrder = 2
    TabPosition = tpBottom
    Tabs.Strings = (
      'Aktuell'
      'Entlassen')
    TabIndex = 0
    OnChange = TabCtrlChange
    object SdtList: TStringGrid
      Left = 4
      Top = 4
      Width = 664
      Height = 302
      Align = alClient
      Color = clWhite
      ColCount = 6
      Ctl3D = True
      DefaultColWidth = 128
      DefaultRowHeight = 16
      FixedCols = 0
      RowCount = 2
      GridLineWidth = 0
      Options = [goColSizing, goEditing, goRowSelect, goThumbTracking]
      ParentCtl3D = False
      PopupMenu = PopupMenu1
      TabOrder = 0
      OnDblClick = SdtListDblClick
      OnDrawCell = SdtListDrawCell
      OnMouseDown = SdtListMouseDown
      OnSelectCell = SdtListSelectCell
    end
  end
  object MainMenu1: TMainMenu
    Left = 288
    object Datei1: TMenuItem
      Caption = '&Datei'
      object Listeausdrucken1: TMenuItem
        Caption = 'Liste ausdrucken'
        ShortCut = 16464
        OnClick = Listeausdrucken1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Speichern1: TMenuItem
        Caption = 'Speichern'
        ShortCut = 113
        OnClick = Speichern1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Beenden1: TMenuItem
        Caption = '&Beenden'
        OnClick = Beenden1Click
      end
    end
    object Bearbeiten1: TMenuItem
      Caption = 'B&earbeiten'
      object Hinzufgen1: TMenuItem
        Caption = 'Soldat &Hinzuf'#252'gen'
        ShortCut = 45
        OnClick = Hinzufgen1Click
      end
      object Bearbeiten2: TMenuItem
        Caption = 'Soldat &Bearbeiten'
        ShortCut = 13
        OnClick = Bearbeiten2Click
      end
      object Lschen1: TMenuItem
        Caption = 'Soldat &L'#246'schen'
        ShortCut = 46
        OnClick = Lschen1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Filter1: TMenuItem
        Caption = '&Filter'
        ShortCut = 16454
        OnClick = Filter1Click
      end
      object Filteraufheben1: TMenuItem
        Caption = 'Filter &aufheben'
        ShortCut = 49222
        OnClick = Filteraufheben1Click
      end
      object abelleanpassen1: TMenuItem
        Caption = '&Tabelle anpassen'
        ShortCut = 16468
        OnClick = abelleanpassen1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Statistik1: TMenuItem
        Caption = 'Statistik'
        ShortCut = 16467
        OnClick = Statistik1Click
      end
    end
    object Extras1: TMenuItem
      Caption = 'E&xtras'
      object Alterextrahieren1: TMenuItem
        Caption = 'Geburtstag extrahieren'
        OnClick = Alterextrahieren1Click
      end
      object VergangeneLehrgngelschen1: TMenuItem
        Caption = 'Vergangene Lehrg'#228'nge l'#246'schen'
        ShortCut = 49228
        OnClick = VergangeneLehrgngelschen1Click
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object Adressekopieren1: TMenuItem
        Caption = 'Adresse kopieren'
        ShortCut = 16451
        OnClick = Adressekopieren1Click
      end
      object WerhatheuteGeburtstag1: TMenuItem
        Caption = 'Wer hat heute Geburtstag?'
        OnClick = WerhatheuteGeburtstag1Click
      end
    end
    object Info1: TMenuItem
      Caption = '&Hilfe'
      ShortCut = 112
      object Info2: TMenuItem
        Caption = '&Info'
        OnClick = Info2Click
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 320
    object Hinzufgen2: TMenuItem
      Caption = 'Soldat &Hinzuf'#252'gen'
      OnClick = Hinzufgen1Click
    end
    object Bearbeiten3: TMenuItem
      Caption = 'Soldat &Bearbeiten'
      OnClick = Bearbeiten2Click
    end
    object Lschen2: TMenuItem
      Caption = 'Soldat &L'#246'schen'
      OnClick = Lschen1Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object Filter2: TMenuItem
      Caption = '&Filter'
      OnClick = Filter1Click
    end
    object Filteraufheben2: TMenuItem
      Caption = 'Filter &aufheben'
      OnClick = Filteraufheben1Click
    end
    object abelleanpassen2: TMenuItem
      Caption = '&Tabelle anpassen'
      OnClick = abelleanpassen1Click
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object Adressekopieren2: TMenuItem
      Caption = 'Adresse kopieren'
      OnClick = Adressekopieren1Click
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object Statistik2: TMenuItem
      Caption = 'Statistik'
      OnClick = Statistik1Click
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 352
  end
  object Timer1: TTimer
    Interval = 600000
    OnTimer = Timer1Timer
    Left = 144
    Top = 16
  end
end
