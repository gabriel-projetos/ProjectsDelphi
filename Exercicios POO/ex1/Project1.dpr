program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

begin
  try
    Readln();
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);

  end;
end.
