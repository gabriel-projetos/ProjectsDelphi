object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Pesquisa de T'#237'tulos'
  ClientHeight = 217
  ClientWidth = 448
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    448
    217)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 432
    Height = 201
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        Visible = True
      end>
  end
  object dsTitulos: TDataSource
    DataSet = qryTitulos
    Left = 351
    Top = 64
  end
  object qryTitulos: TADOQuery
    Connection = frm_DataModule.Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select id, pesFantasia, pesRazaoSocial,'
      'case when pesTipo = '#39'J'#39' then'
      '           '#39'Jur'#39
      'else'
      '           '#39'Fis'#39' end pesTipo,'
      'case when pesCliente = '#39'S'#39' then'
      '           '#39'Sim'#39
      'else'
      '           '#39'N'#227'o'#39' end pesCliente,'
      'case when pesFornecedor = '#39'S'#39' then'
      '           '#39'Sim'#39
      'else'
      '           '#39'N'#227'o'#39' end pesFornecedor,'
      
        'isnull(pesTelefone, '#39#39') pesTelefone, isnull(pesEmail, '#39#39') pesEma' +
        'il,'
      'case when pesInativa = '#39'S'#39' then'
      '          '#39'Sim'#39
      'else'
      '         '#39'N'#227'o'#39' end pesInativa'
      'from tbPessoas'
      'order by PesFantasia'
      ' ')
    Left = 351
    Top = 16
  end
end
