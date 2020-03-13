object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Saidera Bar'
  ClientHeight = 336
  ClientWidth = 746
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
  object Label1: TLabel
    Left = 26
    Top = 24
    Width = 45
    Height = 13
    Caption = 'Comanda'
  end
  object Label2: TLabel
    Left = 24
    Top = 104
    Width = 38
    Height = 13
    Caption = 'Produto'
  end
  object Label3: TLabel
    Left = 240
    Top = 275
    Width = 94
    Height = 13
    Caption = 'Pre'#231'o Total a Pagar'
  end
  object btn_adicionarProduto: TButton
    Left = 24
    Top = 204
    Width = 177
    Height = 25
    Caption = 'Adicionar produto a comanda'
    TabOrder = 0
    OnClick = btn_adicionarProdutoClick
  end
  object edt_nmComanda: TEdit
    Left = 26
    Top = 43
    Width = 172
    Height = 21
    TabOrder = 1
    TextHint = 'N'#250'mero da comanda'
  end
  object edt_qntProduto: TEdit
    Left = 26
    Top = 177
    Width = 172
    Height = 21
    TabOrder = 2
    TextHint = 'Quantdade'
  end
  object edt_precoProduto: TEdit
    Left = 26
    Top = 150
    Width = 172
    Height = 21
    TabOrder = 3
    TextHint = 'Pre'#231'o'
  end
  object edt_nomeProduto: TEdit
    Left = 26
    Top = 123
    Width = 172
    Height = 21
    TabOrder = 4
    TextHint = 'Nome'
  end
  object btn_criarComanda: TButton
    Left = 26
    Top = 70
    Width = 172
    Height = 25
    Caption = 'Criar Comanda'
    TabOrder = 5
    OnClick = btn_criarComandaClick
  end
  object btn_emitirNota: TButton
    Left = 304
    Top = 19
    Width = 377
    Height = 25
    Caption = 'Emitir nota fiscal'
    TabOrder = 6
    OnClick = btn_emitirNotaClick
  end
  object edt_totalPagar: TEdit
    Left = 240
    Top = 294
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 7
  end
  object Memo1: TMemo
    Left = 304
    Top = 50
    Width = 377
    Height = 167
    TabOrder = 8
  end
end
