unit uCategoriaModel;

interface

uses
  Dialogs, MyAccess;

type
   TCategoria=class
   private
      // atributos da classe
      Fid: integer;
      Fnome: string;
      FConexaoBanco: TMyConnection;
    FqrySQL: TMyQuery;

   public
      // m�todos p�blicos da classe
      constructor Create;
      destructor  Destroy; override;
      procedure Buscar(const objetoCategoria: TCategoria);
      procedure Salvar(const objetoCategoria: TCategoria);


      // propriedades da classe
      property id: integer read Fid write Fid;
      property nome: string read Fnome write Fnome;
      property ConexaoBanco:TMyConnection read FConexaoBanco;
      property qrySQL:TMyQuery read FqrySQL write FqrySQL;

   end;

implementation

uses
  SysUtils, uConexaoBanco;


{ TCategoria }

procedure TCategoria.Buscar(const objetoCategoria: TCategoria);
begin
  Self.qrySQL := TMyQuery.Create(nil);
  Self.qrySQL.Connection:= FConexaoBanco;
  Self.qrySQL.SQL.Add('select *from categorias order by id');
  Self.qrySQL.Open;
end;

constructor TCategoria.Create;
 var ConexaoBanco : TConexaoBanco;
begin
   ConexaoBanco := TConexaoBanco.Create;

   FConexaoBanco := ConexaoBanco.GetConexao;
end;

destructor TCategoria.Destroy;
begin
  inherited;
  FConexaoBanco.Free;
end;

procedure TCategoria.Salvar(const objetoCategoria: TCategoria);
 var Qry : TMyQuery;
begin
   try
      Qry := TMyQuery.Create(nil);
      qry.Connection:= FConexaoBanco;
      qry.SQL.Add('INSERT INTO categorias (nome) VALUES('+QuotedStr(objetoCategoria.nome)+')');
      Qry.ExecSQL;
    finally

     FreeAndNil(Qry);
    end;
end;

end.
