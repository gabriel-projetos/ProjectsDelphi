object frmPesquisaPessoa: TfrmPesquisaPessoa
  Left = 0
  Top = 0
  Caption = 'frmPesquisaPessoa'
  ClientHeight = 287
  ClientWidth = 555
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    555
    287)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 539
    Height = 271
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsPessoa
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pesFantasia'
        Title.Caption = 'Fantasia'
        Width = 290
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pesRazaoSocial'
        Title.Caption = 'Raz'#227'o Social'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pesTipo'
        Title.Caption = 'Tipo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pesCliente'
        Title.Caption = 'Cliente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pesFornecedor'
        Title.Caption = 'Fornecedor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pesTelefone'
        Title.Caption = 'Telefone'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pesEmail'
        Title.Caption = 'Email'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pesInativa'
        Title.Caption = 'Inativa'
        Visible = True
      end>
  end
  object qryPessoa: TADOQuery
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
    Left = 480
    Top = 16
  end
  object dsPessoa: TDataSource
    DataSet = qryPessoa
    Left = 480
    Top = 64
  end
end
