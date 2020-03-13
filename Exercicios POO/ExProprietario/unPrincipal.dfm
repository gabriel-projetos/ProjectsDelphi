object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 325
  ClientWidth = 694
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btn_Acelera: TButton
    Left = 424
    Top = 160
    Width = 97
    Height = 25
    Caption = 'Acelera'
    TabOrder = 0
    OnClick = btn_AceleraClick
  end
  object Button2: TButton
    Left = 424
    Top = 104
    Width = 97
    Height = 25
    Caption = 'Velocidade Atual'
    TabOrder = 1
  end
  object btn_Freia: TButton
    Left = 424
    Top = 216
    Width = 97
    Height = 25
    Caption = 'Freia'
    TabOrder = 2
    OnClick = btn_FreiaClick
  end
  object btnCriarProprieatario: TButton
    Left = 32
    Top = 200
    Width = 129
    Height = 25
    Caption = 'Dados do Proprietario'
    TabOrder = 3
    OnClick = btnCriarProprieatarioClick
  end
  object edt_nomeProprietario: TEdit
    Left = 24
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 4
    TextHint = 'Digite seu nome'
  end
  object edt_Endereco: TEdit
    Left = 24
    Top = 64
    Width = 297
    Height = 21
    TabOrder = 5
    TextHint = 'Digite seu endere'#231'o'
  end
end
