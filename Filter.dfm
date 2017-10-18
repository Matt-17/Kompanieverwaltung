object Frm_Filter: TFrm_Filter
  Left = 365
  Top = 109
  Width = 393
  Height = 407
  Caption = 'Filter setzen'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 20
    Width = 28
    Height = 13
    Caption = 'Name'
  end
  object Label2: TLabel
    Left = 8
    Top = 44
    Width = 42
    Height = 13
    Caption = 'Vorname'
  end
  object Label3: TLabel
    Left = 8
    Top = 68
    Width = 14
    Height = 13
    Caption = 'PK'
  end
  object Label4: TLabel
    Left = 8
    Top = 92
    Width = 33
    Height = 13
    Caption = 'DstGrd'
  end
  object Label5: TLabel
    Left = 8
    Top = 116
    Width = 19
    Height = 13
    Caption = 'Zug'
  end
  object Label6: TLabel
    Left = 8
    Top = 140
    Width = 14
    Height = 13
    Caption = 'Ort'
  end
  object Label7: TLabel
    Left = 8
    Top = 164
    Width = 30
    Height = 13
    Caption = 'Status'
  end
  object Label8: TLabel
    Left = 8
    Top = 260
    Width = 51
    Height = 13
    Caption = 'LG Anfang'
    Transparent = False
  end
  object Label9: TLabel
    Left = 8
    Top = 284
    Width = 42
    Height = 13
    Caption = 'LG Ende'
  end
  object Label10: TLabel
    Left = 8
    Top = 236
    Width = 45
    Height = 13
    Caption = 'Lehrgang'
  end
  object Label11: TLabel
    Left = 8
    Top = 188
    Width = 22
    Height = 13
    Caption = 'DZE'
    Transparent = False
  end
  object Label12: TLabel
    Left = 8
    Top = 212
    Width = 52
    Height = 13
    Caption = 'Geburtstag'
  end
  object Label13: TLabel
    Left = 8
    Top = 307
    Width = 53
    Height = 13
    Caption = 'Markierung'
  end
  object Button1: TButton
    Left = 264
    Top = 344
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 344
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Abbrechen'
    ModalResult = 2
    TabOrder = 1
  end
  object BtnLeer: TButton
    Left = 136
    Top = 344
    Width = 75
    Height = 25
    Caption = '&L'#246'schen'
    TabOrder = 2
    OnClick = BtnLeerClick
  end
  object FName: TEdit
    Left = 88
    Top = 16
    Width = 249
    Height = 21
    TabOrder = 3
  end
  object FVorname: TEdit
    Left = 88
    Top = 40
    Width = 249
    Height = 21
    TabOrder = 4
  end
  object FPK1: TEdit
    Left = 88
    Top = 64
    Width = 105
    Height = 21
    MaxLength = 6
    TabOrder = 5
  end
  object FPK2: TEdit
    Left = 192
    Top = 64
    Width = 17
    Height = 21
    MaxLength = 1
    TabOrder = 6
  end
  object FPK3: TEdit
    Left = 208
    Top = 64
    Width = 129
    Height = 21
    MaxLength = 5
    TabOrder = 7
  end
  object FOrt: TEdit
    Left = 88
    Top = 136
    Width = 249
    Height = 21
    TabOrder = 8
  end
  object BoxZug: TComboBox
    Left = 88
    Top = 112
    Width = 249
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 9
    Text = '(Alle)'
    Items.Strings = (
      '(Alle)')
  end
  object BoxDG: TComboBox
    Left = 88
    Top = 88
    Width = 185
    Height = 21
    Style = csDropDownList
    DropDownCount = 30
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 10
    Text = '(Alle)'
    Items.Strings = (
      '(Alle)')
  end
  object FStatus: TComboBox
    Left = 88
    Top = 160
    Width = 249
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 11
    Items.Strings = (
      '(Alle)'
      'GWDL'
      'FWDL'
      'SaZ'
      'BS')
  end
  object FLGa: TDateTimePicker
    Left = 160
    Top = 256
    Width = 89
    Height = 21
    Date = 38027.483038113420000000
    Time = 38027.483038113420000000
    TabOrder = 12
  end
  object FLGb: TDateTimePicker
    Left = 160
    Top = 280
    Width = 89
    Height = 21
    Date = 38027.483110787030000000
    Time = 38027.483110787030000000
    TabOrder = 13
  end
  object FEdLG: TEdit
    Left = 88
    Top = 232
    Width = 145
    Height = 21
    TabOrder = 14
  end
  object FLGaOn: TComboBox
    Left = 88
    Top = 256
    Width = 65
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 15
    Text = '(Alle)'
    OnChange = FLGaOnChange
    Items.Strings = (
      '(Alle)'
      'Vor'
      'Am'
      'Nach'
      'Zwischen')
  end
  object FLGbOn: TComboBox
    Left = 88
    Top = 280
    Width = 65
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 16
    Text = '(Alle)'
    OnChange = FLGbOnChange
    Items.Strings = (
      '(Alle)'
      'Vor'
      'Am'
      'Nach'
      'Zwischen')
  end
  object FAllLGChck: TCheckBox
    Left = 236
    Top = 234
    Width = 101
    Height = 17
    Caption = 'Alle mit Lehrgang'
    TabOrder = 17
    OnClick = FAllLGChckClick
  end
  object FLGa2: TDateTimePicker
    Left = 248
    Top = 256
    Width = 89
    Height = 21
    Date = 38027.483038113420000000
    Time = 38027.483038113420000000
    TabOrder = 18
  end
  object FLGb2: TDateTimePicker
    Left = 248
    Top = 280
    Width = 89
    Height = 21
    Date = 38027.483110787030000000
    Time = 38027.483110787030000000
    TabOrder = 19
  end
  object FDZEa: TDateTimePicker
    Left = 160
    Top = 184
    Width = 89
    Height = 21
    Date = 38027.483038113420000000
    Time = 38027.483038113420000000
    TabOrder = 20
  end
  object FGeba: TDateTimePicker
    Left = 160
    Top = 208
    Width = 89
    Height = 21
    Date = 38027.483110787030000000
    Time = 38027.483110787030000000
    TabOrder = 21
  end
  object FDZEOn: TComboBox
    Left = 88
    Top = 184
    Width = 65
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 22
    Text = '(Alle)'
    OnChange = FDZEOnChange
    Items.Strings = (
      '(Alle)'
      'Vor'
      'Am'
      'Nach'
      'Zwischen')
  end
  object FGebOn: TComboBox
    Left = 88
    Top = 208
    Width = 65
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 23
    Text = '(Alle)'
    OnChange = FGebOnChange
    Items.Strings = (
      '(Alle)'
      'Vor'
      'Am'
      'Nach'
      'Zwischen')
  end
  object FDZEb: TDateTimePicker
    Left = 248
    Top = 184
    Width = 89
    Height = 21
    Date = 38027.483038113420000000
    Time = 38027.483038113420000000
    TabOrder = 24
  end
  object FGebb: TDateTimePicker
    Left = 248
    Top = 208
    Width = 89
    Height = 21
    Date = 38027.483110787030000000
    Time = 38027.483110787030000000
    TabOrder = 25
  end
  object MarkColBox: TColorBox
    Left = 88
    Top = 303
    Width = 249
    Height = 21
    DefaultColorColor = clWhite
    Selected = clLime
    Style = [cbStandardColors, cbExtendedColors]
    DropDownCount = 25
    ItemHeight = 15
    TabOrder = 26
  end
  object BoxDZ: TComboBox
    Left = 272
    Top = 88
    Width = 65
    Height = 21
    Style = csDropDownList
    DropDownCount = 30
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 27
    Text = '(Alle)'
    Items.Strings = (
      '(Alle)')
  end
end
