object Adr_Form: TAdr_Form
  Left = 188
  Top = 351
  BorderStyle = bsDialog
  Caption = 'Adresse'
  ClientHeight = 178
  ClientWidth = 191
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 38
    Height = 13
    Caption = 'Adresse'
  end
  object Label3: TLabel
    Left = 8
    Top = 128
    Width = 45
    Height = 13
    Caption = 'PLZ / Ort'
  end
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 28
    Height = 13
    Caption = 'Name'
  end
  object EdAdr1: TEdit
    Left = 64
    Top = 40
    Width = 121
    Height = 21
    Color = clCaptionText
    MaxLength = 64
    TabOrder = 1
  end
  object EdAdr2: TEdit
    Left = 64
    Top = 64
    Width = 121
    Height = 21
    Color = clCaptionText
    MaxLength = 64
    TabOrder = 2
  end
  object EdPLZ: TEdit
    Left = 64
    Top = 120
    Width = 41
    Height = 21
    Color = clCaptionText
    MaxLength = 5
    TabOrder = 4
  end
  object EdOrt: TEdit
    Left = 104
    Top = 120
    Width = 81
    Height = 21
    Color = clCaptionText
    MaxLength = 32
    TabOrder = 5
  end
  object EdAdr3: TEdit
    Left = 64
    Top = 88
    Width = 121
    Height = 21
    Color = clCaptionText
    MaxLength = 64
    TabOrder = 3
  end
  object Button1: TButton
    Left = 8
    Top = 152
    Width = 75
    Height = 25
    Caption = '&Ok'
    Default = True
    ModalResult = 1
    TabOrder = 6
  end
  object Button2: TButton
    Left = 112
    Top = 152
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Abbrechen'
    ModalResult = 2
    TabOrder = 7
  end
  object AddrEd: TEdit
    Left = 64
    Top = 8
    Width = 121
    Height = 21
    MaxLength = 32
    TabOrder = 0
  end
end
