unit unPesquisaPessoas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unDataModule, Data.DB, Data.Win.ADODB,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmPesquisaPessoa = class(TForm)
    DBGrid1: TDBGrid;
    qryPessoa: TADOQuery;
    dsPessoa: TDataSource;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
   //10minutos aula 23
var
  frmPesquisaPessoa: TfrmPesquisaPessoa;

implementation

{$R *.dfm}

procedure TfrmPesquisaPessoa.DBGrid1DblClick(Sender: TObject);
begin
  if qryPessoa.RecNo > 0 then
  begin
    tag := 1;
    Close;
  end;
end;

procedure TfrmPesquisaPessoa.FormCreate(Sender: TObject);
begin
    qryPessoa.Close;
    qryPessoa.SQL.Text :=
      ' select id, pesFantasia, pesRazaoSocial, ' +
      ' case when pesTipo = ''J'' then          ' +
      '            ''Jur''                      ' +
      ' else                                    ' +
      '            ''Fis'' end pesTipo,         ' +
      ' case when pesCliente = ''S'' then       ' +
      '            ''Sim''                      ' +
      ' else                                    ' +
      '            ''N�o'' end pesCliente,      ' +
      ' case when pesFornecedor = ''S'' then    ' +
      '            ''Sim''                      ' +
      ' else                                    ' +
      '            ''N�o'' end pesFornecedor,   ' +
      ' isnull(pesTelefone, '''') pesTelefone, isnull(pesEmail, '''') pesEmail, ' +
      ' case when pesInativa = ''S'' then       ' +
      '           ''Sim''                       ' +
      ' else                                    ' +
      '          ''N�o'' end pesInativa         ' +
      ' from tbPessoas                          ' +
      ' order by PesFantasia                    ';
    qryPessoa.Open;


end;

end.
