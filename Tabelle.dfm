object Frm_Table: TFrm_Table
  Left = 192
  Top = 107
  Width = 357
  Height = 309
  Caption = 'Tabelle anpassen'
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
  object SpeedButton1: TSpeedButton
    Left = 160
    Top = 24
    Width = 23
    Height = 22
    Caption = 'H'
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 160
    Top = 56
    Width = 23
    Height = 22
    Caption = '->'
    OnClick = SpeedButton2Click
  end
  object SpeedButton3: TSpeedButton
    Left = 160
    Top = 88
    Width = 23
    Height = 22
    Caption = '<-'
    OnClick = SpeedButton3Click
  end
  object SpeedButton4: TSpeedButton
    Left = 160
    Top = 120
    Width = 23
    Height = 22
    Caption = 'R'
    OnClick = SpeedButton4Click
  end
  object ListNo: TListBox
    Left = 8
    Top = 8
    Width = 137
    Height = 225
    ItemHeight = 13
    TabOrder = 0
    OnDblClick = SpeedButton2Click
  end
  object ListYes: TListBox
    Left = 192
    Top = 8
    Width = 145
    Height = 225
    ItemHeight = 13
    TabOrder = 1
    OnDblClick = SpeedButton3Click
  end
  object Button1: TButton
    Left = 232
    Top = 248
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Abbrechen'
    ModalResult = 2
    TabOrder = 2
  end
  object Button2: TButton
    Left = 48
    Top = 248
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 3
    OnClick = Button2Click
  end
end
