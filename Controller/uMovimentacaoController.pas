unit uMovimentacaoController;

interface

uses uMovimentacaoModel;

type
  TControllerMovimentacao = class
  private

  public
    // procedimento para salvar o movimento
    procedure Salvar(const objetoMovimentacao: TMovimentacao);
    procedure GetSaldo(const objetoMovimentacao: TMovimentacao);
    procedure Buscar(const objetoMovimentacao: TMovimentacao);
    procedure BuscarGrafico(const objetoMovimentacao: TMovimentacao);
  end;

implementation

uses
  StrUtils, System.SysUtils;

{ TControleMovimentacao }

procedure TControllerMovimentacao.Buscar(const objetoMovimentacao: TMovimentacao);
begin
  objetoMovimentacao.Buscar(objetoMovimentacao);
end;

procedure TControllerMovimentacao.BuscarGrafico(const objetoMovimentacao: TMovimentacao);
begin
   objetoMovimentacao.BuscarGrafico(objetoMovimentacao);
end;

procedure TControllerMovimentacao.GetSaldo(const objetoMovimentacao: TMovimentacao);
begin
   objetoMovimentacao.GetSaldo(objetoMovimentacao);
end;

procedure TControllerMovimentacao.Salvar(const objetoMovimentacao: TMovimentacao);
begin

  if objetoMovimentacao.id_categorias = 0 then
    raise Exception.Create('Preencha a categotia.');

  if objetoMovimentacao.valor <= 0 then
    raise Exception.Create('Preencha o valor maior que zero.');

  if objetoMovimentacao.observacao = '' then
    raise Exception.Create('Preencha a oberva��o.');


  // se o objeto for v�lido, o m�todo Salvar � invocado
  objetoMovimentacao.Salvar(objetoMovimentacao);
end;

end.
