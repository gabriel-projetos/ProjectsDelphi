unit unPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unProprietario, unCarro, Vcl.StdCtrls, unEndereco;

type
  TForm2 = class(TForm)
    btn_Acelera: TButton;
    Button2: TButton;
    btn_Freia: TButton;
    btnCriarProprieatario: TButton;
    edt_nomeProprietario: TEdit;
    edt_Endereco: TEdit;
    procedure btn_AceleraClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_FreiaClick(Sender: TObject);
    procedure btnCriarProprieatarioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  Carro: TCarro;
  Proprietario: TProprietario;
  Endereco : TEndecero;

implementation

{$R *.dfm}

procedure TForm2.btnCriarProprieatarioClick(Sender: TObject);
begin
   Proprietario.Nome := edt_nomeProprietario.Text;
   ShowMessage(Proprietario.Nome);
   //Proprietario.Endereco.Rua := edt_Endereco.Text;
    Proprietario.Endereco.Rua := edt_Endereco.Text;
    ShowMessage(Proprietario.Endereco.Rua);
end;

procedure TForm2.btn_AceleraClick(Sender: TObject);
Var
  Data: TDateTime;
begin
  Carro.Acelera(Carro.VelocidadeAtual);
  ShowMessage(FloatToStr(Carro.VelocidadeAtual));
  Data := Now;
  ShowMessage(DateToStr(data));

end;

procedure TForm2.btn_FreiaClick(Sender: TObject);
begin
  Carro.Freia(Carro.VelocidadeAtual);
  ShowMessage(FloatToStr(Carro.VelocidadeAtual));
  //Proprietario.Endereco.Rua := edt_Endereco.Text;
  //ShowMessage(Proprietario.Endereco.Rua);
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(Carro);
  FreeAndNil(Proprietario);
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
   Endereco := TEndecero.Create;
   Proprietario := TProprietario.Create;
   Carro := TCarro.Create;
   Carro.VelocidadeAtual := 0;
end;

end.
