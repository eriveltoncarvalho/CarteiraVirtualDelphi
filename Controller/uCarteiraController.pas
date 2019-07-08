unit uCarteiraController;

interface

uses uCarteiraModel;

type
  TControllerCarteira = class
  private

  public
    // procedimento para salvar o categoria
    procedure Salvar(const objetoCarteira: TCarteira);
    procedure buscar(const objetoCarteira: TCarteira);
  end;

implementation

uses
  StrUtils, System.SysUtils,Dialogs;

{ TControllerCategoria }

procedure TControllerCarteira.buscar(const objetoCarteira: TCarteira);
begin
    objetoCarteira.Buscar(objetoCarteira);
end;

procedure TControllerCarteira.Salvar(const objetoCarteira: TCarteira);
begin
   if trim(objetoCarteira.nome) = '' then
      Raise exception.Create('Preencha a carteira!');

  // se o objeto for válido, o método Salvar é invocado
  objetoCarteira.Salvar(objetoCarteira);
end;

end.
