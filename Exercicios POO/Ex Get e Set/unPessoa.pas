unit unPessoa;

interface

type
  TPessoa = class
  private
    FNome: string;
    procedure SetNome(AValue: string);
    function GetNome: string;
  public
    property Nome: string read GetNome write SetNome;
  end;

implementation

{ TPessoa }

function TPessoa.GetNome: string;
begin
  result := FNome;
end;

procedure TPessoa.SetNome(AValue: string);
begin
  FNome := AValue;
end;

end.
