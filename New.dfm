object FrmNew: TFrmNew
  Left = 192
  Top = 153
  Width = 294
  Height = 265
  Caption = 'Soldat hinzuf'#252'gen'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 8
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
    Left = 0
    Top = 32
    Width = 42
    Height = 13
    Caption = 'Vorname'
  end
  object Label3: TLabel
    Left = 0
    Top = 80
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
    Left = 0
    Top = 104
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
    Left = 0
    Top = 56
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
    Left = 0
    Top = 128
    Width = 115
    Height = 13
    Caption = 'Truppenausweisnummer'
  end
  object Label7: TLabel
    Left = 0
    Top = 152
    Width = 30
    Height = 13
    Caption = 'Status'
  end
  object DZE: TLabel
    Left = 0
    Top = 176
    Width = 22
    Height = 13
    Caption = 'DZE'
  end
  object EditName: TEdit
    Left = 120
    Top = 0
    Width = 160
    Height = 21
    TabOrder = 0
    OnChange = EditNameChange
  end
  object EditVorname: TEdit
    Left = 120
    Top = 24
    Width = 160
    Height = 21
    TabOrder = 1
  end
  object EditPK1: TEdit
    Left = 120
    Top = 72
    Width = 73
    Height = 21
    MaxLength = 6
    TabOrder = 3
    OnKeyPress = EditPK3KeyPress
  end
  object EditPK2: TEdit
    Left = 192
    Top = 72
    Width = 17
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 1
    TabOrder = 4
    OnKeyPress = EditPK2KeyPress
  end
  object EditPK3: TEdit
    Left = 208
    Top = 72
    Width = 73
    Height = 21
    MaxLength = 5
    TabOrder = 5
    OnKeyPress = EditPK3KeyPress
  end
  object Button1: TButton
    Left = 0
    Top = 208
    Width = 75
    Height = 25
    Caption = '&Hinzuf'#252'gen'
    Default = True
    TabOrder = 10
    OnClick = Button1Click
  end
  object BoxZug: TComboBox
    Left = 120
    Top = 96
    Width = 160
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 6
  end
  object BoxDG: TComboBox
    Left = 120
    Top = 48
    Width = 160
    Height = 21
    Style = csDropDownList
    DropDownCount = 30
    ItemHeight = 13
    TabOrder = 2
  end
  object TANEdit: TEdit
    Left = 120
    Top = 120
    Width = 160
    Height = 21
    TabOrder = 7
  end
  object EditDZE: TDateTimePicker
    Left = 120
    Top = 168
    Width = 160
    Height = 21
    Date = 38019.469301550930000000
    Time = 38019.469301550930000000
    TabOrder = 9
  end
  object Button2: TButton
    Left = 200
    Top = 208
    Width = 83
    Height = 25
    Cancel = True
    Caption = '&Abbruch'
    ModalResult = 2
    TabOrder = 11
  end
  object EditStat: TComboBox
    Left = 120
    Top = 144
    Width = 161
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 8
    Text = 'GWDL'
    Items.Strings = (
      'GWDL'
      'FWDL'
      'SaZ'
      'BS')
  end
end
