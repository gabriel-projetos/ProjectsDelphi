unit SaideraBarView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    btn_adicionarProduto: TButton;
    Label1: TLabel;
    Label2: TLabel;
    edt_nmComanda: TEdit;
    edt_qntProduto: TEdit;
    edt_precoProduto: TEdit;
    edt_nomeProduto: TEdit;
    btn_criarComanda: TButton;
    btn_emitirNota: TButton;
    edt_totalPagar: TEdit;
    Label3: TLabel;
    Memo1: TMemo;
    procedure btn_criarComandaClick(Sender: TObject);
    procedure btn_adicionarProdutoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_emitirNotaClick(Sender: TObject);
  privatE
    { Private declarations }
  public
    { Public declarations }
  end;

  type
  TProduto = class
    FNomeProduto: string;
    FPrecoProduto: double;
    FQuantidadeProduto: integer;
  end;

  type
  TCaixaModel = class(TProduto)
  public
    Comanda : TCaixaModel;
    FNumeroComanda: string;
    FCodigoDeBarras: integer;
    FProdutos: TStringList;
  end;

var
  Form2: TForm2;
  dados : TStringList;

implementation

{$R *.dfm}

procedure TForm2.btn_adicionarProdutoClick(Sender: TObject);
var
  Comanda : TCaixaModel;
begin
  Comanda := TCaixaModel.Create();
  Comanda.FNomeProduto := edt_nomeProduto.Text;
  Comanda.FPrecoProduto := StrToFloat(edt_precoProduto.Text);
  Comanda.FQuantidadeProduto := STRTOINT(edt_qntProduto.Text);
  if(Length(edt_nomeProduto.Text) > 0) and (Length(edt_precoProduto.Text) > 0) and
   (Length(edt_qntProduto.Text) > 0)then
   begin
     dados.Add('Nome do produto: ' + edt_nomeProduto.Text +
     ' Pre�o: ' + edt_precoProduto.Text +
     ' Quantidade: ' + edt_qntProduto.Text);
     edt_nomeProduto.Clear;
     edt_precoProduto.Clear;
     edt_qntProduto.Clear;
   end;


  //Memo1.Lines.Add('Nome: ' + Comanda.FNomeProduto + ' Pre�o: ' + FloatToSTR(Comanda.FPrecoProduto) + ' Quantidade :' + IntToSTR(Comanda.FQuantidadeProduto));
end;

procedure TForm2.btn_criarComandaClick(Sender: TObject);
var
  Comanda : TCaixaModel;
begin
  Initialize(Comanda);
  Randomize;
  Comanda := TCaixaModel.Create();
  Comanda.FNumeroComanda := edt_nmComanda.Text;
  Comanda.FCodigoDeBarras := Random(123310);

  ShowMessage(Comanda.FNumeroComanda);
  ShowMessage(IntToSTR(Comanda.FCodigoDeBarras));
end;


procedure TForm2.btn_emitirNotaClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to dados.Count-1 do
  begin
    Memo1.Lines.Add(dados.Strings[i]);
  end;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dados.Free;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  dados:= TStringList.create;
end;

end.
