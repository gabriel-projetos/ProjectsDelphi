unit unFuncoes;

interface

uses
  Vcl.Dialogs, Vcl.Controls;

function confirma(pergunta: String): boolean;
function emailValido(email: String) : boolean;
procedure alerta(mensagem: string);
procedure mensagem(mensagem: string);
procedure erro(mensagem: string);

implementation

function Confirma(pergunta: String): boolean;
begin
  result := MessageDlg(pergunta, mtConfirmation, [mbYes, mbNo], 0) = mrYes
end;

function EmailValido(email: String) : boolean;
begin
  //função pos retorna a posição, se tiver espaço no email, tera alguma posição entao será maior que zero
  //Se não tiver ponto nem @
  if (Pos(' ', email) > 0) or (Pos('.',email) = 0) or (Pos('@',email) = 0) then
    result := False
  else
    result := True;
end;

procedure alerta(mensagem: string);
begin
  MessageDlg(mensagem, mtWarning, [mbOK], 0);
end;

procedure mensagem(mensagem: string);
begin
  MessageDlg(mensagem, mtInformation, [mbOK], 0);
end;

procedure erro(mensagem: string);
begin
  MessageDlg(mensagem, mtError, [mbOK], 0);
end;

end.
