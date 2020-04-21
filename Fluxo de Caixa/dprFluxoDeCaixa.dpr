program dprFluxoDeCaixa;

uses
  Vcl.Forms,
  unMenuPrincipal in 'unMenuPrincipal.pas' {frm_Menu},
  unParametros in 'unParametros.pas' {frm_Parametros},
  unPessoas in 'unPessoas.pas' {frm_Pessoas},
  unCentroCustos in 'unCentroCustos.pas' {frm_centroCustos},
  unTitulos in 'unTitulos.pas' {frm_Titulos},
  unDataModule in 'unDataModule.pas' {frm_DataModule: TDataModule},
  unPesquisaCentroCustos in 'unPesquisaCentroCustos.pas' {frmPesquisaCentroCusto},
  unPesquisaPessoas in 'unPesquisaPessoas.pas' {frmPesquisaPessoa},
  unFuncoes in 'unFuncoes.pas',
  unPesquisaTitulos in 'unPesquisaTitulos.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_DataModule, frm_DataModule);
  Application.CreateForm(Tfrm_Menu, frm_Menu);
  Application.CreateForm(TfrmPesquisaCentroCusto, frmPesquisaCentroCusto);
  Application.CreateForm(TfrmPesquisaPessoa, frmPesquisaPessoa);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
