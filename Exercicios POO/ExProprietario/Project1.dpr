program Project1;

uses
  Vcl.Forms,
  unPrincipal in 'unPrincipal.pas' {Form2},
  unProprietario in 'unProprietario.pas',
  unCarro in 'unCarro.pas',
  unEndereco in 'unEndereco.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
