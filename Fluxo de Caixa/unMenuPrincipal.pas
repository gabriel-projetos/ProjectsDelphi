unit unMenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tfrm_Menu = class(TForm)
    btn_frmParametros: TButton;
    btn_frmPessoas: TButton;
    procedure btn_frmParametrosClick(Sender: TObject);
    procedure btn_frmPessoasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Menu: Tfrm_Menu;

implementation

{$R *.dfm}

uses unPessoas, unParametros;

procedure Tfrm_Menu.btn_frmParametrosClick(Sender: TObject);
begin
  try
    frm_Parametros := Tfrm_Parametros.create(Self);
    frm_Parametros.ShowModal;
  finally
    FreeAndNil(frm_Parametros);
  end;

end;
           
procedure Tfrm_Menu.btn_frmPessoasClick(Sender: TObject);
begin
  try
    frm_Pessoas := Tfrm_Pessoas.create(Self);
    frm_Pessoas.ShowModal;
  finally
    FreeAndNil(frm_Pessoas);
  end;
end;

end.
