unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btn_salvarValor: TButton;
    edt_textStringList: TEdit;
    Memo1: TMemo;
    btn_mostrarDados: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_salvarValorClick(Sender: TObject);
    procedure btn_mostrarDadosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  dados : TStringList;

implementation

{$R *.dfm}

procedure TForm1.btn_mostrarDadosClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to dados.Count-1 do
    Memo1.Lines.Add(dados.Strings[i]);

end;

procedure TForm1.btn_salvarValorClick(Sender: TObject);
begin
  if (Length(edt_textStringList.Text) > 0) then
  begin
    dados.Add(edt_textStringList.Text);
    edt_textStringList.Clear;
  end;

end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dados.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  dados := TStringList.Create;
end;

end.
