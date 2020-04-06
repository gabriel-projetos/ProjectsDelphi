object frmPesquisaCentroCusto: TfrmPesquisaCentroCusto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Pesquisa de Centro de Custos'
  ClientHeight = 237
  ClientWidth = 526
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    526
    237)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 510
    Height = 221
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsCentroCusto
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
        Title.Alignment = taRightJustify
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ccuDescricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ccuReceita'
        Title.Caption = 'Receita'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ccuDespesa'
        Title.Caption = 'Despesa'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ccuInativo'
        Title.Caption = 'Inativo'
        Visible = True
      end>
  end
  object qryCentroCusto: TADOQuery
    Active = True
    Connection = frm_DataModule.Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select '
      'id, ccuDescricao, '
      
        'case when ccuReceita = '#39'S'#39' then'#9#39'Sim'#39' else '#39'N'#227'o'#39' end ccuReceita,' +
        ' '
      
        'case when ccuDespesa = '#39'S'#39' then '#39'Sim'#39' else '#39'N'#227'o'#39' end ccuDespesa,' +
        ' '
      'case when ccuInativo = '#39'S'#39' then '#39'Sim'#39' else '#39'N'#227'o'#39' end ccuInativo'
      'from tbCentroCustos'
      'order by ccuDescricao')
    Left = 480
    Top = 16
  end
  object dsCentroCusto: TDataSource
    DataSet = qryCentroCusto
    Left = 480
    Top = 64
  end
end
