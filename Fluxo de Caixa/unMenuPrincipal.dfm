object frm_Menu: Tfrm_Menu
  Left = 0
  Top = 0
  Caption = 'Fluxo de Caixa'
  ClientHeight = 296
  ClientWidth = 504
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
    Left = 80
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Parametros'
    TabOrder = 0
    OnClick = btn_frmParametrosClick
  end
  object btn_frmPessoas: TButton
    Left = 200
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Pessoas'
    TabOrder = 1
    OnClick = btn_frmPessoasClick
  end
end
