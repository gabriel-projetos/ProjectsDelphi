unit unPesquisaCentroCustos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, unDataModule,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmPesquisaCentroCusto = class(TForm)
    qryCentroCusto: TADOQuery;
    DBGrid1: TDBGrid;
    dsCentroCusto: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisaCentroCusto: TfrmPesquisaCentroCusto;

implementation

{$R *.dfm}

procedure TfrmPesquisaCentroCusto.DBGrid1DblClick(Sender: TObject);
begin
  //Verifica se tem um registro selecionado
  if qryCentroCusto.RecNo > 0 then begin
    tag := 1;
    Close;
  end
  else
    ShowMessage('N�o foi selecionado um registro');

end;

procedure TfrmPesquisaCentroCusto.FormCreate(Sender: TObject);
begin
  qryCentroCusto.Close;
  qryCentroCusto.SQL.Text := ' select ' +
    ' id, ccuDescricao, ' +
    ' case when ccuReceita = ''S'' then	''Sim'' else ''N�o'' end ccuReceita, ' +
    ' case when ccuDespesa = ''S'' then ''Sim'' else ''N�o'' end ccuDespesa, ' +
    ' case when ccuInativo = ''S'' then ''Sim'' else ''N�o'' end ccuInativo  ' +
    ' from tbCentroCustos ' +
    ' order by ccuDescricao  ';
  qryCentroCusto.Open;
end;

end.
