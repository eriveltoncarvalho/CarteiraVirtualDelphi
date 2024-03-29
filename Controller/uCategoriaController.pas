unit uCategoriaController;

interface

uses uCategoriaModel;

type
  TControllerCategoria = class
  private

  public
    // procedimento para salvar o categoria
    procedure Salvar(const objetoCategoria: TCategoria);
    procedure buscar(const objetoCategoria: TCategoria);
  end;

implementation

uses
  StrUtils, System.SysUtils,Dialogs;

{ TControllerCategoria }

procedure TControllerCategoria.buscar(const objetoCategoria: TCategoria);
begin
    objetoCategoria.Buscar(objetoCategoria);
end;

procedure TControllerCategoria.Salvar(const objetoCategoria: TCategoria);
begin
   if trim(objetoCategoria.nome) = '' then
      Raise exception.Create('Preencha a categoria!');

  // se o objeto for v�lido, o m�todo Salvar � invocado
  objetoCategoria.Salvar(objetoCategoria);
end;

end.
