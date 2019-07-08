unit uConexaoBanco;

interface

uses
  inifiles, SysUtils, Forms, MyAccess;

type
   TConexaoBanco = class
      private

       FConexaoBanco : TMyConnection;
      public

       constructor Create;
       destructor  Destroy; override;


       function GetConexao : TMyConnection;
       property ConexaoBanco : TMyConnection   read GetConexao;
   end;

implementation

{ TConexaoBanco }

constructor TConexaoBanco.Create;
var ArquivoINI: string;
    LocalServer : Integer;
    Configuracoes : TIniFile;
begin
   ArquivoINI := ExtractFilePath(Application.ExeName) + 'config.ini';

   if not FileExists(ArquivoINI) then begin
        Exception.Create('Arquivo de Config n�o Encontrado!');
    end;

   Configuracoes := TIniFile.Create(ArquivoINI);

   try
     FConexaoBanco := TMyConnection.Create(Application);

    FConexaoBanco.Connected := False;

     FConexaoBanco.Server   := Configuracoes.ReadString('PARAMETROS', 'server', '');
     FConexaoBanco.Port     := StrToInt(Configuracoes.ReadString('PARAMETROS', 'port',''));
     FConexaoBanco.Username := Configuracoes.ReadString('PARAMETROS', 'username','');
     FConexaoBanco.Password := Configuracoes.ReadString('PARAMETROS', 'password','');
     FConexaoBanco.Database := Configuracoes.ReadString('PARAMETROS', 'database','');

     FConexaoBanco.Connected := True;

     Configuracoes.Free;
   except
       Exception.Create('Erro ao Conectar o Banco de dados. Verifique o arquivo config!');

   end;
end;

destructor TConexaoBanco.Destroy;
begin
  FConexaoBanco.Free;
  inherited;
end;

function TConexaoBanco.GetConexao: TMyConnection;
begin
   Result := FConexaoBanco;
end;

end.
