object Info_Frm: TInfo_Frm
  Left = 196
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Info'
  ClientHeight = 113
  ClientWidth = 233
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
  object Button1: TButton
    Left = 80
    Top = 80
    Width = 75
    Height = 25
    Caption = '&Schlie'#223'en'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object Memo1: TMemo
    Left = 24
    Top = 8
    Width = 185
    Height = 65
    Color = clBtnFace
    Lines.Strings = (
      'Erstellt f'#252'r 2./Feldj'#228'gerbataillon 350'
      'OG Voigt'
      ''
      'Januar - Juni 2004')
    TabOrder = 1
  end
end
