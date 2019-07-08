unit frmPesquisaCarteira;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids;

type
  TfrmPesquisaCarteiraF = class(TForm)
    Panel: TPanel;
    Bevel: TBevel;
    btnOK: TBitBtn;
    btnCancelar: TBitBtn;
    GroupBox1: TGroupBox;
    dbgPesqCarteira: TDBGrid;
    cdsPesqCarteira: TClientDataSet;
    dsPesqCarteira: TDataSource;
    cdsPesqCarteiraCarteira: TStringField;
    cdsPesqCarteiraCodigo: TIntegerField;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure dbgPesqCarteiraDblClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }

     class function Execute(var ID_Carteira: integer): boolean;
  end;

var
  frmPesquisaCarteiraF: TfrmPesquisaCarteiraF;
  _IdCarteira: integer;

implementation

{$R *.dfm}

uses uCarteiraController, uCarteiraModel;

{ TfrmPesquisaCarteiraF }

procedure TfrmPesquisaCarteiraF.btnCancelarClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TfrmPesquisaCarteiraF.btnOKClick(Sender: TObject);
begin
   _IdCarteira := cdsPesqCarteiraCodigo.AsInteger;
   ModalResult := mrOk;
end;

procedure TfrmPesquisaCarteiraF.dbgPesqCarteiraDblClick(Sender: TObject);
begin
   _IdCarteira := cdsPesqCarteiraCodigo.AsInteger;
   ModalResult := mrOk;
end;

class function TfrmPesquisaCarteiraF.Execute(var ID_Carteira: integer): boolean;
begin
   with TfrmPesquisaCarteiraF.Create(Screen.ActiveForm) do begin
     Result:= ShowModal() = mrOK;
     if Result then
         ID_Carteira := _IdCarteira;
   end;
end;

procedure TfrmPesquisaCarteiraF.FormCreate(Sender: TObject);
var
  // variáveis das camadas utilizadas na rotina
    objetoCarteira: TCarteira;
    objetoController: TControllerCarteira;
begin
    objetoCarteira  := TCarteira.Create; // classe Modelo
    objetoController := TControllerCarteira.Create; // classe Controller
    try
      // chamada da rotina para buscar carteira
      objetoController.buscar(objetoCarteira);

      if not cdsPesqCarteira.Active then
         cdsPesqCarteira.CreateDataSet;

      objetoCarteira.qrySQL.First;
      while not objetoCarteira.qrySQL.Eof do begin
          cdsPesqCarteira.Append;

          cdsPesqCarteiraCodigo.AsInteger   := objetoCarteira.qrySQL.FieldByName('id').AsInteger;
          cdsPesqCarteiraCarteira.AsString  := objetoCarteira.qrySQL.FieldByName('nome').AsString;

          cdsPesqCarteira.Post;

          objetoCarteira.qrySQL.Next;
      end;

      cdsPesqCarteira.Open;
    finally
      // liberação dos objetos da memória
      FreeAndNil(objetoCarteira);
      FreeAndNil(objetoController);
    end;
end;

end.
