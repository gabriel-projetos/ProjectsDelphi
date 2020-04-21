unit unTitulos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Data.Win.ADODB, unFuncoes, Vcl.Mask, System.StrUtils, Math;

type
  Tfrm_Titulos = class(TForm)
    Panel1: TPanel;
    btnCancelar: TBitBtn;
    btnPesquisar: TBitBtn;
    btnGravar: TBitBtn;
    btnExcluir: TBitBtn;
    btnLimpar: TBitBtn;
    Label1: TLabel;
    edtCodigo: TEdit;
    rdgTipo: TRadioGroup;
    qryTitulos: TADOQuery;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lbDiaPagamento: TLabel;
    lbValorPago: TLabel;
    Label9: TLabel;
    edtPessoa: TEdit;
    edtCentroCusto: TEdit;
    edtReferencia: TEdit;
    edtValor: TEdit;
    edtValorRecPag: TEdit;
    Label10: TLabel;
    mkEdtDataCriacao: TMaskEdit;
    mObservacao: TMemo;
    mkEdtDataRecPag: TMaskEdit;
    mkEdtDataVencimento: TMaskEdit;
    edtTitPessoaDesc: TEdit;
    btnPesquisaPessoa: TSpeedButton;
    edtCentroCustoDesc: TEdit;
    edtPesquisaCCDesc: TSpeedButton;
    procedure btnExcluirClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure rdgTipoClick(Sender: TObject);
    procedure btnPesquisaPessoaClick(Sender: TObject);
    procedure edtPesquisaCCDescClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
    procedure limpaTela;
    procedure carregaDados(cod: integer);
  public
    { Public declarations }
  end;

var
  frm_Titulos: Tfrm_Titulos;

implementation

uses
  unPesquisaPessoas, unPesquisaCentroCustos;

{$R *.dfm}

procedure Tfrm_Titulos.btnCancelarClick(Sender: TObject);
begin
  //se id � zero � inser��o
  if Trim(edtCodigo.Text) = '0' then
    limpaTela
  else
    //se for altera��o ele retorna para o valor original
    carregaDados(StrToInt(edtCodigo.Text));
end;

procedure Tfrm_Titulos.btnExcluirClick(Sender: TObject);
begin
if Trim(edtCodigo.Text) = '0' then
  begin
    alerta('N�o � possivel excluir o registro 0 (Zero)');
    abort;
  end;

  if Confirma('Deseja realmente excluir o registro ?') then
  begin
    qryTitulos.Close;
    qryTitulos.SQL.Text :=
       ' delete from tbPessoas ' +
            ' where id = :id   ';
    qryTitulos.Parameters.ParamByName('id').Value := Trim(edtCodigo.Text);
    qryTitulos.ExecSQL;

    mensagem('Excluido com sucesso');
    limpaTela;
  end;
end;

procedure Tfrm_Titulos.btnGravarClick(Sender: TObject);
var
  insercao: Boolean;
  RecebimentoPagamento : string;
begin
//So pode gravar com id de pessoa existente no banco
  insercao := False;
  RecebimentoPagamento := IfThen(rdgTipo.ItemIndex = 0, 'P', 'R');

  if Trim(mkEdtDataCriacao.Text) = '/  /' then
  begin
    alerta('Informe a data do t�tulo.');
    mkEdtDataCriacao.SetFocus;
    Abort;
  end;

  //S� pode ser inserido uma pessoa existente
  if Trim(edtPessoa.Text) = '' then
  begin
    alerta('Informe a pessoa');
    edtPessoa.SetFocus;
    Abort;
  end;

  //Se usar centro de custo na despesa ou na receita na tela de parametros
  if Trim(edtCentroCusto.Text) = '' then
  begin
    alerta('Informe o Centro de Custo');
    edtCentroCusto.SetFocus;
    Abort;
  end;

  //Def = default, o valor 0 � o default pq caso o texto seja vazio da erro na convers�o de tipo
  if StrToFloatDef(edtValor.Text, 0) <= 0 then
  begin
    alerta('Informe o valor do t�tulo');
    edtValor.SetFocus;
    Abort;
  end;

  if Trim(mkEdtDataVencimento.Text) = '/  /' then
  begin
    alerta('Informe a data de vencimento do t�tulo.');
    mkEdtDataVencimento.SetFocus;
    Abort;
  end;

  if (StrToFloatDef(edtValorRecPag.Text, 0) > 0) or (Trim(mkEdtDataRecPag.Text) <> '/  /')then
  begin
    if StrToFloatDef(edtValorRecPag.Text, 0) <= 0 then
    begin
      if RecebimentoPagamento = 'P' then
        alerta('Informe o valor pago do t�tulo.')
      else
        alerta('Informe o valor recebido do t�tulo.');
      edtValorRecPag.SetFocus;
      Abort;
    end;

    if Trim(mkEdtDataRecPag.Text) = '/  /' then
    begin
      if RecebimentoPagamento = 'P' then
        alerta('Informe a data de pagamento do t�tulo.')
      else
        alerta('Informe a data de recebimento do t�tulo.');
      mkEdtDataRecPag.SetFocus;
      Abort;
    end;
  end;

  insercao := Trim(edtCodigo.Text) = '0';
  qryTitulos.Close;

  if insercao then
  begin
    qryTitulos.SQL.Text :=
      ' insert tbTitulos ( ' +
      ' titTipo, titDataCriacao, titPessoa, titCentroCusto, ' +
      ' titReferencia, titValor, titDataVencimento, titValorRecPag, ' +
      ' titDataRecPag, titObservacao ' +
      ' ) values ( ' +
      ' :titTipo, :titDataCriacao, :titPessoa, :titCentroCusto, ' +
      ' :titReferencia, :titValor, :titDataVencimento, :titValorRecPag, ' +
      ' :titDataRecPag, :titObservacao )';
  end
  else
  begin
    qryTitulos.SQL.Text :=
      ' update tbTitulos '   +
      ' set ' +
      ' titTipo = :titTipo,' +
      ' titDataCriacao = :titDataCriacao, ' +
      ' titPessoa = :titPessoa,           ' +
      ' titCentroCusto = :titCentroCusto, ' +
      ' titReferencia = :titReferencia,   ' +
      ' titValor = :titValor,             ' +
      ' titDataVencimento = :titDataVencimento, ' +
      ' titValorRecPag = :titValorRecPag, ' +
      ' titDataRecPag = :titDataRecPag,   ' +
      ' titObservacao = :titObservacao,   ' +
      ' where id = :id ';
    qryTitulos.Parameters.ParamByName('id').Value := Trim(edtCodigo.Text);
  end;

  qryTitulos.Parameters.ParamByName('titTipo').Value := IfThen(Trim(qryTitulos.FieldByName('titTipo').AsString) = 'P', 0, 1);
  qryTitulos.Parameters.ParamByName('titDataCriacao').Value := Trim(mkEdtDataCriacao.Text);
  qryTitulos.Parameters.ParamByName('titPessoa').Value := Trim(edtPessoa.Text);
  qryTitulos.Parameters.ParamByName('titCentroCusto').Value := Trim(edtCentroCusto.Text);
  qryTitulos.Parameters.ParamByName('titReferencia').Value := Trim(edtReferencia.Text);
  qryTitulos.Parameters.ParamByName('titValor').Value := Trim(edtValor.Text);
  qryTitulos.Parameters.ParamByName('titDataVencimento').Value := Trim(mkEdtDataVencimento.Text);
  qryTitulos.Parameters.ParamByName('titValorRecPag').Value := Trim(edtValorRecPag.Text);
  qryTitulos.Parameters.ParamByName('titDataRecPag').Value := Trim(mkEdtDataRecPag.Text);
  qryTitulos.Parameters.ParamByName('titObservacao').Value := Trim(mObservacao.Text);


  qryTitulos.ExecSQL;
  mensagem('Salvo com sucesso');
  limpaTela;
end;

procedure Tfrm_Titulos.btnLimparClick(Sender: TObject);
begin
  limpaTela;
end;

procedure Tfrm_Titulos.carregaDados(cod: integer);
begin
  qryTitulos.Close;
  qryTitulos.SQL.Text :=  'select id, titTipo, titDataCriacao, titPessoa, ' +
    ' titCentroCusto, titReferencia, titValor, titDataVencimento, '   +
    ' titValorRecPag, titDataRecPag, titObservacao '                  +
    ' From tbTitulos '                                                +
    ' where id = :id ';
  qryTitulos.Parameters.ParamByName('id').Value := cod;
  qryTitulos.Open;

  if qryTitulos.RecordCount > 0 then
  begin
    limpaTela;

    //Para usar n�meros na IfThen precisa usar a lib math
    edtCodigo.Text := Trim(qryTitulos.FieldByName('id').AsString);
    rdgTipo.ItemIndex := IfThen(Trim(qryTitulos.FieldByName('titTipo').AsString) = 'P', 0, 1);
    mkEdtDataCriacao.Text := Trim(qryTitulos.FieldByName('titDataCriacao').AsString);
    edtPessoa.Text := Trim(qryTitulos.FieldByName('titPessoa').AsString);
    edtCentroCusto.Text := Trim(qryTitulos.FieldByName('titCentroCusto').AsString);
    edtReferencia.Text := Trim(qryTitulos.FieldByName('titReferencia').AsString);
    edtValor.Text := FormatFloat('##.00', qryTitulos.FieldByName('titValor').AsFloat);
    mkEdtDataVencimento.Text := qryTitulos.FieldByName('titDataVencimento').AsString;
    edtValorRecPag.Text := FormatFloat('##.00', qryTitulos.FieldByName('titDataRecPag').AsFloat);
    mkEdtDataRecPag.Text := qryTitulos.FieldByName('titDataRecPag').AsString;
    mObservacao.Lines.Text := Trim(qryTitulos.FieldByName('titObservacao').AsString);
  end;

  qryTitulos.Close;
end;

procedure Tfrm_Titulos.edtPesquisaCCDescClick(Sender: TObject);
begin
  try
    frmPesquisaCentroCusto := TfrmPesquisaCentroCusto.Create(Self);
    frmPesquisaCentroCusto.ShowModal;

    //Se tiver selecionado algum registro
    if frmPesquisaCentroCusto.Tag = 1 then begin
      edtCentroCusto.Text := Trim(frmPesquisaCentroCusto.qryCentroCusto.FieldByName('id').AsString);
      edtCentroCustoDesc.Text := Trim(frmPesquisaCentroCusto.qryCentroCusto.FieldByName('ccuDescricao').AsString);
    end;
  finally
    FreeAndNil(frmPesquisaCentroCusto);
  end;
end;

procedure Tfrm_Titulos.FormShow(Sender: TObject);
begin
  limpaTela;
end;

procedure Tfrm_Titulos.limpaTela;
begin
//Rec = Recebido
  edtCodigo.Text := '0';
  rdgTipo.ItemIndex := 0;
  mkEdtDataCriacao.Text := FormatDateTime('dd/mm/yyyy', Date);//O sitema vai pegar a data atual e formar dessa forma
  edtPessoa.Clear;
  edtTitPessoaDesc.Clear;
  edtCentroCusto.Clear;
  edtReferencia.Clear;
  edtValor.Text := '0.00';
  mkEdtDataVencimento.Clear;
  edtValorRecPag.Text := '0.00';
  mkEdtDataRecPag.Clear;
  mObservacao.Lines.Clear;

  mkEdtDataCriacao.SetFocus;
end;

procedure Tfrm_Titulos.rdgTipoClick(Sender: TObject);
begin
  if rdgTipo.ItemIndex = 0 then
  begin
    lbValorPago.Caption := 'Valor: R$ Pago: ';
    lbDiaPagamento.Caption := 'Pago dia: ';
  end
  else
  begin
    lbValorPago.Caption := 'Valor: R$ Recebido: ';
    lbDiaPagamento.Caption := 'Recebido dia: ';
  end;


end;

procedure Tfrm_Titulos.btnPesquisaPessoaClick(Sender: TObject);
begin
  try
    frmPesquisaPessoa := TfrmPesquisaPessoa.Create(self);
    frmPesquisaPessoa.ShowModal;

    //Se a tag tiver valor 1 � pq tem algum registro selecionado
    if frmPesquisaPessoa.Tag = 1 then begin
      edtPessoa.Text := Trim(frmPesquisaPessoa.qryPessoa.FieldByName('id').AsString);
      edtTitPessoaDesc.Text := Trim(frmPesquisaPessoa.qryPessoa.FieldByName('pesFantasia').AsString);
    end;
  finally
    FreeAndNil(frmPesquisaPessoa);
  end;
end;

procedure Tfrm_Titulos.btnPesquisarClick(Sender: TObject);
var
  codigo : integer;
begin
  codigo := 0;
  try
    frmPesquisaCentroCusto := TfrmPesquisaCentroCusto.Create(Self);
    frmPesquisaCentroCusto.ShowModal;

    //Se tiver selecionado algum registro
    if frmPesquisaCentroCusto.Tag = 1 then begin
      codigo := frmPesquisaCentroCusto.qryCentroCusto.FieldByName('id').AsInteger;
    end;

  finally
    FreeAndNil(frmPesquisaCentroCusto);
  end;

  if codigo > 0 then begin
    carregaDados(codigo);
  end;
end;

end.
