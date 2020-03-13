unit unProprietario;

interface

uses
  System.SysUtils, unEndereco;

type
  TProprietario = class
  private
    FNome: string;
    FCPF: String;
    FRG: String;
    FDataNascimento: String;

   public
    Endereco: TEndecero;
    function GetCPF: String;
    function GetNome: string;
    function GetDataNascimento: string;
    function GetRG: String;

    procedure SetCPF(const Value: String);
    procedure SetNome(const Value: string);
    procedure SetDataNascimento(const Value: string);
    procedure SetRG(const Value: String);

    property Nome: string read GetNome write SetNome;
    property CPF: String read GetCPF write SetCPF;
    property RG: String read GetRG write SetRG;
    property DataNascimento: string read GetDataNascimento write SetDataNascimento;

  end;

implementation

{ TProprietario }



function TProprietario.GetCPF: String;
begin
  result := FCPF;
end;

function TProprietario.GetDataNascimento: string;
begin
  result := FDataNascimento;
end;

function TProprietario.GetNome: string;
begin
  result := FNome;
end;

function TProprietario.GetRG: String;
begin
  result := FRG;
end;

procedure TProprietario.SetCPF(const Value: String);
begin
 FCPF := Value;
end;

procedure TProprietario.SetDataNascimento(const Value: string);
begin
  FDataNascimento := Value;
end;

procedure TProprietario.SetNome(const Value: string);
begin
    if Trim(Value) = '' then
      Raise exception.Create('O nome não pode ser nulo.')
    else
      FNome := Value;
end;

procedure TProprietario.SetRG(const Value: String);
begin
  FRG := Value;
end;

end.
