unit unCalculadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    edt_resultado: TEdit;
    btn_num_1: TButton;
    btn_num_2: TButton;
    btn_num_3: TButton;
    btn_num_6: TButton;
    Button5: TButton;
    btn_num_4: TButton;
    btn_num_9: TButton;
    btn_num_8: TButton;
    btn_num_7: TButton;
    btn_soma: TButton;
    btn_num_0: TButton;
    btn_virgula: TButton;
    btn_multiplicacao: TButton;
    btn_subtracao: TButton;
    btn_divisao: TButton;
    btn_resultado: TButton;
    btn_apagarUmNumero: TButton;
    btn_clear: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

end.
