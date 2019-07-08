program CarteiraVirtual;

uses
  Vcl.Forms,
  frmCarteiraVirtual in 'View\frmCarteiraVirtual.pas' {frmCarteiraVirtualF},
  frmCadastroCarteira in 'View\frmCadastroCarteira.pas' {frmCadastroCarteiraF},
  frmCadastroCategoria in 'View\frmCadastroCategoria.pas' {frmCadastroCategoriaF},
  frmMovimentacaoCarteira in 'View\frmMovimentacaoCarteira.pas' {frmMovimentacaoCarteiraF},
  uConexaoBanco in 'Model\Conexao\uConexaoBanco.pas',
  uMovimentacaoModel in 'Model\uMovimentacaoModel.pas',
  frmCadastroLancamento in 'View\frmCadastroLancamento.pas' {frmCadastroLancamentoF},
  uMovimentacaoController in 'Controller\uMovimentacaoController.pas',
  uCategoriaModel in 'Model\uCategoriaModel.pas',
  uCategoriaController in 'Controller\uCategoriaController.pas',
  frmGrafico in 'View\frmGrafico.pas' {frmGraficoF},
  uCarteiraModel in 'Model\uCarteiraModel.pas',
  uCarteiraController in 'Controller\uCarteiraController.pas',
  frmPesquisaCarteira in 'View\frmPesquisaCarteira.pas' {frmPesquisaCarteiraF};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCarteiraVirtualF, frmCarteiraVirtualF);
  Application.CreateForm(TfrmPesquisaCarteiraF, frmPesquisaCarteiraF);
  Application.Run;
end.
