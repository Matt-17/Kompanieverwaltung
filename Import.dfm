object FrmImport: TFrmImport
  Left = 334
  Top = 125
  Width = 356
  Height = 268
  Caption = 'Liste Importieren'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DGListe: TValueListEditor
    Left = 0
    Top = 0
    Width = 185
    Height = 177
    KeyOptions = [keyEdit]
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goAlwaysShowEditor, goThumbTracking]
    ScrollBars = ssVertical
    Strings.Strings = (
      'S=01SCH'
      'G=02GEF'
      'OG=03OBG'
      'HG=04HAG'
      'SG=05STG'
      'OSG=06OSG'
      'U=07UFF'
      'SU=08STU'
      'Fw=09FWB'
      'OF=10OFW'
      'HF=11HFW'
      'SFw=12SFW'
      'OSF=13OSF'
      'LT=14LTN'
      'OL=15OLT'
      'H=16HPT'
      'SH=17SHM'
      'M=18MAJ'
      'OTL=19OTL'
      'O=20OST'
      'BG=21BGE'
      'GM=22GMA'
      'GL=23GLT'
      'GEN=24GEN')
    TabOrder = 0
    TitleCaptions.Strings = (
      'Dienstgrad'
      'Abk'#252'rzung')
    ColWidths = (
      81
      82)
  end
  object Button1: TButton
    Left = 0
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Importieren'
    Default = True
    Enabled = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 0
    Top = 184
    Width = 265
    Height = 21
    ReadOnly = True
    TabOrder = 2
    Text = 'C:\'
  end
  object Button2: TButton
    Left = 272
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Suchen'
    TabOrder = 3
    OnClick = Button2Click
  end
  object ZugListe: TValueListEditor
    Left = 192
    Top = 0
    Width = 153
    Height = 177
    KeyOptions = [keyEdit]
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goAlwaysShowEditor, goThumbTracking]
    Strings.Strings = (
      'KpF'#252'Grp=01K'
      'AbsZg=02A'
      'EskZg=03E'
      'PersSZg=04P'
      'BFD=05B')
    TabOrder = 4
    TitleCaptions.Strings = (
      'Zug'
      'Abk'#252'rzung')
    ColWidths = (
      41
      106)
  end
  object Button3: TButton
    Left = 272
    Top = 216
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Abbrechen'
    TabOrder = 5
    OnClick = Button3Click
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Excel|*.xls'
    InitialDir = 'C:\'
    Title = 'Zugliste '#246'ffnen'
    OnSelectionChange = OpenDialog1SelectionChange
    Left = 280
    Top = 184
  end
  object SdtData: TADODataSet
    Connection = XLSCon
    CursorType = ctStatic
    CommandText = #39'Tabelle 2$'#39
    CommandType = cmdTable
    Parameters = <>
    Left = 280
  end
  object XLSCon: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=D:\Zu' +
      'gListe.xls;Mode=Share Deny None;Extended Properties=Excel 8.0;Pe' +
      'rsist Security Info=False;Jet OLEDB:System database="";Jet OLEDB' +
      ':Registry Path="";Jet OLEDB:Database Password="";Jet OLEDB:Engin' +
      'e Type=35;Jet OLEDB:Database Locking Mode=0;Jet OLEDB:Global Par' +
      'tial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:N' +
      'ew Database Password="";Jet OLEDB:Create System Database=False;J' +
      'et OLEDB:Encrypt Database=False;Jet OLEDB:Don'#39't Copy Locale on C' +
      'ompact=False;Jet OLEDB:Compact Without Replica Repair=False;Jet ' +
      'OLEDB:SFP=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 312
  end
  object SdtLGs: TADODataSet
    Connection = XLSCon
    CursorType = ctStatic
    CommandText = #39'Tabelle 1$'#39
    CommandType = cmdTable
    Parameters = <>
    Left = 280
    Top = 32
  end
end
