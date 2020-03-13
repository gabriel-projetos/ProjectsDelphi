object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 201
  ClientWidth = 447
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
  object btn_salvarValor: TButton
    Left = 8
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Salvar Valor'
    TabOrder = 0
    OnClick = btn_salvarValorClick
  end
  object edt_textStringList: TEdit
    Left = 8
    Top = 45
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Memo1: TMemo
    Left = 200
    Top = 24
    Width = 239
    Height = 137
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object btn_mostrarDados: TButton
    Left = 200
    Top = 167
    Width = 81
    Height = 25
    Caption = 'Mostrar Dados'
    TabOrder = 3
    OnClick = btn_mostrarDadosClick
  end
end
