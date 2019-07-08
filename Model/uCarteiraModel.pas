unit uCarteiraModel;

interface

uses
  Dialogs, MyAccess;

type
   TCarteira=class
   private
      // atributos da classe
      Fid: integer;
      Fnome: string;
      FConexaoBanco: TMyConnection;
    FqrySQL: TMyQuery;

   public
      // métodos públicos da classe
      constructor Create;
      destructor  Destroy; override;
      procedure Buscar(const objetoCarteira: TCarteira);
      procedure Salvar(const objetoCarteira: TCarteira);

      // propriedades da classe
      property id: integer read Fid write Fid;
      property nome: string read Fnome write Fnome;
      property ConexaoBanco:TMyConnection read FConexaoBanco;
      property qrySQL:TMyQuery read FqrySQL write FqrySQL;
   end;

implementation

uses
  SysUtils, uConexaoBanco;


{ TCarteira }

procedure TCarteira.Buscar(const objetoCarteira: TCarteira);
begin
  Self.qrySQL := TMyQuery.Create(nil);
  Self.qrySQL.Connection:= FConexaoBanco;
  Self.qrySQL.SQL.Add('select *from carteiras order by id');
  Self.qrySQL.Open;
end;

constructor TCarteira.Create;
 var ConexaoBanco : TConexaoBanco;
begin
   ConexaoBanco := TConexaoBanco.Create;

   FConexaoBanco := ConexaoBanco.GetConexao;
end;

destructor TCarteira.Destroy;
begin
  inherited;
  FConexaoBanco.Free;
end;

procedure TCarteira.Salvar(const objetoCarteira: TCarteira);
 var Qry : TMyQuery;
begin
   try
      Qry := TMyQuery.Create(nil);
      qry.Connection:= FConexaoBanco;
      qry.SQL.Add('INSERT INTO carteiras (nome) VALUES('+QuotedStr(objetoCarteira.nome)+')');
      Qry.ExecSQL;
    finally

     FreeAndNil(Qry);
    end;
end;

end.
