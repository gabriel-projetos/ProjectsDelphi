program Project1;

uses
  Vcl.Forms,
  unForm1 in 'unForm1.pas' {Form2},
  unPessoa in '..\unPessoa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
