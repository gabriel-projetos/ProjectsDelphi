unit unDataModule;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, Vcl.Dialogs,
  Datasnap.DBClient, Forms;

type
  Tfrm_DataModule = class(TDataModule)
    Conexao: TADOConnection;
    qryAuxiliar: TADOQuery;
    cdsConexao: TClientDataSet;
    cdsConexaoServer: TStringField;
    cdsConexaoBanco: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    conectado : boolean;
  end;

var
  frm_DataModule: Tfrm_DataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ Tfrm_DataModule }

procedure Tfrm_DataModule.DataModuleCreate(Sender: TObject);
var
  servidor, database: string;
begin
  servidor := '';
  database := '';
  conectado := false;

  //Se existe o arquivo
  if FileExists(ExtractFilePath(Application.Name) + 'Parametros.xml') then
  begin
    cdsConexao.LoadFromFile(ExtractFilePath(Application.Name) + 'parametros.xml');
    cdsConexao.Open;

    servidor := cdsConexaoServer.AsString;
    database := cdsConexaoBanco.AsString;
  end;

  if (servidor = '') or (database = '') then
  begin
    //Se não der valida, clicar em cancelar ou fechar é false
    if not InputQuery('Informe', 'Nome do servidor:', servidor) then
      abort;
    if not InputQuery('Informe', 'Nome do banco:', database) then
     abort;
  end;


  if (servidor = '') or (database = '') then
  begin
    ShowMessage('É necessario informar o servidor e o banco de dados.');
    abort;
  end;


  //servidor := 'LAPTOP-0E5LQAT5';
  //database := 'dbFluxoDeCaixa';
  Conexao.Connected := false;
  Conexao.ConnectionString := Conexao.ConnectionString +
    ';datasource=' + servidor +
    ';initial catalog=' + database;

  try
    Conexao.Connected := True;
    conectado := true;

    if not cdsConexao.Active then
      cdsConexao.CreateDataSet;

    //Vai editar a conexão
    cdsConexao.Edit;
    //Recebe a informação digitadas
    cdsConexaoServer.Value := servidor;
    cdsConexaoBanco.Value := database;

    //Informação com os dados estão na memoria
    cdsConexao.Post;

    //Vai salvar os dados em um arquivo xml na pasta da aplicação
    //ExtractFilePath Pega o caminho da aplicação
    cdsConexao.SaveToFile(ExtractFilePath(Application.name) + 'Parametros.xml');

  except
    on e: Exception do begin
      ShowMessage('Erro ao conectar:' + #13 + e.Message);
    end;
  end;

end;

end.
