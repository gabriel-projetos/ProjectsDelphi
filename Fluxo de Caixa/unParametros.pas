unit unParametros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB, StrUtils;

type
  Tfrm_Parametros = class(TForm)
    qryParametros: TADOQuery;
    Label1: TLabel;
    edtNomeEmpresa: TEdit;
    ckUsaCCustoReceita: TCheckBox;
    ckUsaCCustoPag: TCheckBox;
    btnGravar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Parametros: Tfrm_Parametros;

implementation

{$R *.dfm}

uses unDataModule;

procedure Tfrm_Parametros.btnGravarClick(Sender: TObject);
begin
  if Trim(edtNomeEmpresa.Text) = '' then begin
     ShowMessage('Informe o nome da empresa: ');
     edtNomeEmpresa.SetFocus;
     //Ver para que serve o abort
     Abort;
  end;

  if Length(edtNomeEmpresa.Text) > 30 then begin
     ShowMessage('Nome da empresa ultrapassou 30 caracteres.');
     edtNomeEmpresa.SetFocus;
     //Ver para que serve o abort
     Abort;
  end;


  qryParametros.Close;
  qryParametros.SQL.Text :=
       'update tbParametros' +
       ' set parNomeEmpresa = :parNomeEmpresa, ' +
       ' parUsaCCustoRec = :parUsaCCustoRec, ' +
       ' parUsaCCustoPag = :parUsaCCustoPag' ;
  qryParametros.Parameters.ParamByName('parNomeEmpresa').Value := Trim(edtNomeEmpresa.Text);
  qryParametros.Parameters.ParamByName('parUsaCCustoRec').Value := IfThen(ckUsaCCustoPag.Checked, 'S', 'N');
  qryParametros.Parameters.ParamByName('parUsaCCustoPag').Value := IfThen(ckUsaCCustoPag.Checked, 'S', 'N');

  qryParametros.ExecSQL;

  ShowMessage('Salvo com sucesso.');

end;

procedure Tfrm_Parametros.FormCreate(Sender: TObject);
begin
  { Select na tabela }
  qryParametros.Close;
  qryParametros.SQL.Text := 'select * from tbParametros';
  qryParametros.Open;
end;

procedure Tfrm_Parametros.FormShow(Sender: TObject);
begin
  { Alimentação dos campos }

  //Se tiver pelo menos um registro
  if qryParametros.RecordCount > 0 then
  begin
    edtNomeEmpresa.Text := Trim(qryParametros.FieldByName('parNomeEmpresa').AsString);
    ckUsaCCustoReceita.Checked := qryParametros.FieldByName('parUsaCCustoRec').AsString = 'S';
    ckUsaCCustoPag.Checked := qryParametros.FieldByName('parUsaCCustoPag').AsString = 'S';
  end;

  qryParametros.Close;

end;

end.
