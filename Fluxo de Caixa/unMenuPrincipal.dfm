object frm_Menu: Tfrm_Menu
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Fluxo de Caixa'
  ClientHeight = 296
  ClientWidth = 526
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btn_frmParametros: TButton
    Left = 24
    Top = 72
    Width = 105
    Height = 25
    Caption = 'Parametros'
    TabOrder = 0
    OnClick = btn_frmParametrosClick
  end
  object btn_frmPessoas: TButton
    Left = 24
    Top = 103
    Width = 105
    Height = 25
    Caption = 'Pessoas'
    TabOrder = 1
    OnClick = btn_frmPessoasClick
  end
  object btn_frmCentroCusto: TButton
    Left = 24
    Top = 134
    Width = 105
    Height = 25
    Caption = 'Centro Custos'
    TabOrder = 2
    OnClick = btn_frmCentroCustoClick
  end
  object btn_frmTitulos: TButton
    Left = 24
    Top = 165
    Width = 105
    Height = 25
    Caption = 'Titulos'
    TabOrder = 3
    OnClick = btn_frmTitulosClick
  end
end
