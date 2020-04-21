unit unCentroCustos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB, StrUtils, unDataModule,
  unPesquisaCentroCustos, System.UITypes;

type
  Tfrm_centroCustos = class(TForm)
    btnGravar: TButton;
    Label1: TLabel;
    edtCcuId: TEdit;
    edtCcuDescricao: TEdit;
    Label2: TLabel;
    ckCcuDespesa: TCheckBox;
    ckCcuReceita: TCheckBox;
    ckCcuInativo: TCheckBox;
    qryCentroCusto: TADOQuery;
    btnPesquisar: TButton;
    btnCancelar: TButton;
    btnExcluir: TButton;
    btnLimpar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
  private
    { Private declarations }
    procedure carregaDados(cod: integer);
    procedure limpaTela;
  public
    { Public declarations }
  end;

var
  frm_centroCustos: Tfrm_centroCustos;

implementation

{$R *.dfm}

procedure Tfrm_centroCustos.btnExcluirClick(Sender: TObject);
begin
  if Trim(edtCcuId.Text) = '0' then begin
    ShowMessage('Não é possivel excluir um registro com código zero');
    abort;
  end;

  if MessageDlg('Deseja realmente excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    qryCentroCusto.Close;
    qryCentroCusto.SQL.Text :=
      ' Delete from tbCentroCustos ' +
      ' where id = :id ';
    qryCentroCusto.Parameters.ParamByName('id').Value := Trim(edtCcuId.Text);
    qryCentroCusto.ExecSQL;
    ShowMessage('Excluido com sucesso');
    limpaTela;
  end;
end;

procedure Tfrm_centroCustos.btnGravarClick(Sender: TObject);
var
  insercao : Boolean;
begin
  insercao := false;
  if Trim(edtCcuDescricao.Text) = '' then begin
    ShowMessage('Informe a descrição do centro de custo.');
    edtCcuDescricao.SetFocus;
    Abort;
  end;

  //Insercao recebe True se edtCcuId.Text for igual a 0
  //pq se for inserção o id.text estara com 0 no Edit
  insercao := Trim(edtCcuId.Text) = '0';

  qryCentroCusto.Close;

  if insercao then begin
    qryCentroCusto.SQL.Text :=
    ' insert into tbCentroCustos (' +
    ' ccuDescricao, ccuInativo, ccuReceita, ccuDespesa ) ' +
    ' values ' +
    ' (:ccuDescricao, :ccuInativo, :ccuReceita, :ccuDespesa) ';
  end else begin
    qryCentroCusto.SQL.Text :=
    ' update tbCentroCustos ' +
    ' set ccuDescricao = :ccuDescricao, ' +
    ' ccuInativo = :ccuInativo, ' +
    ' ccuReceita = :ccuReceita, ' +
    ' ccuDespesa = :ccuDespesa ' +
    ' where id = :id';
  end;

  qryCentroCusto.Parameters.ParamByName('ccuDescricao').Value := Trim(edtCcuDescricao.Text);
  qryCentroCusto.Parameters.ParamByName('ccuInativo').Value := IfThen(ckCcuInativo.Checked, 'S', 'N');
  qryCentroCusto.Parameters.ParamByName('ccuReceita').Value := IfThen(ckCcuReceita.Checked, 'S', 'N');
  qryCentroCusto.Parameters.ParamByName('ccuDespesa').Value := IfThen(ckCcuDespesa.Checked, 'S', 'N');
  if not(insercao) then
    qryCentroCusto.Parameters.ParamByName('id').Value := Trim(edtCcuId.Text);
  qryCentroCusto.ExecSQL;

  ShowMessage('Gravado com sucesso');
  limpaTela;
end;

procedure Tfrm_centroCustos.btnLimparClick(Sender: TObject);
begin
  limpaTela;
end;

procedure Tfrm_centroCustos.btnCancelarClick(Sender: TObject);
begin
  if Trim(edtCcuId.Text) = '0' then begin
    limpaTela;
  end else begin
    carregaDados(strToInt(edtCcuId.Text));
  end;

end;

procedure Tfrm_centroCustos.btnPesquisarClick(Sender: TObject);
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

procedure Tfrm_centroCustos.carregaDados(cod: integer);
begin
  qryCentroCusto.Close;
  qryCentroCusto.SQL.Text :=
   ' select ' +
   ' id, ccuDescricao, ccuReceita, ccuDespesa, ccuInativo ' +
   ' from tbCentroCustos' +
   ' where id = :id ';
  qryCentroCusto.Parameters.ParamByName('id').Value := cod;
  qryCentroCusto.Open;

  { Verifica se tem dados no select }
  if qryCentroCusto.RecordCount > 0 then begin
    limpaTela;
    edtCcuId.Text := Trim(qryCentroCusto.FieldByName('id').AsString);
    edtCcuDescricao.Text := Trim(qryCentroCusto.FieldByName('ccuDescricao').AsString);
    ckCcuInativo.Checked := Trim(qryCentroCusto.FieldByName('ccuInativo').AsString) = 'S';
    ckCcuReceita.Checked := Trim(qryCentroCusto.FieldByName('ccuReceita').AsString) = 'S';
    ckCcuDespesa.Checked := Trim(qryCentroCusto.FieldByName('ccuDespesa').AsString) = 'S';
  end;

  qryCentroCusto.Close;
end;

procedure Tfrm_centroCustos.FormCreate(Sender: TObject);
begin
  edtCcuId.NumbersOnly := True;
  edtCcuId.ReadOnly := True;
  edtCcuDescricao.MaxLength := 60;
end;

procedure Tfrm_centroCustos.FormShow(Sender: TObject);
begin
  limpaTela;
end;

procedure Tfrm_centroCustos.limpaTela;
begin
  edtCcuId.Text := '0';
  edtCcuDescricao.Text := '';
  ckCcuInativo.Checked := false;
  ckCcuDespesa.Checked := false;
  ckCcuReceita.Checked := false;
  edtCcuDescricao.SetFocus;
end;

end.
