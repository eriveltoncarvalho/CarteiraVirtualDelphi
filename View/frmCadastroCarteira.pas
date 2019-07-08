unit frmCadastroCarteira;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmCadastroCarteiraF = class(TForm)
    Panel: TPanel;
    Bevel: TBevel;
    lblCarteira: TLabel;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    edtCarteira: TEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     class function Execute: boolean;
  end;

var
  frmCadastroCarteiraF: TfrmCadastroCarteiraF;

implementation

{$R *.dfm}

uses uCarteiraController, uCarteiraModel;

{ TfrmCadastroCarteiraF }

procedure TfrmCadastroCarteiraF.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmCadastroCarteiraF.btnSalvarClick(Sender: TObject);
var
  // variáveis das camadas utilizadas na rotina
    objetoCarteira: TCarteira;
    objetoController: TControllerCarteira;
begin
    objetoCarteira  := TCarteira.Create; // classe Modelo
    objetoController := TControllerCarteira.Create; // classe Controller
    try
      // preenchimento dos dados
      objetoCarteira.nome  := edtCarteira.Text;

      // chamada da rotina para gravação
      objetoController.Salvar(objetoCarteira);
      ModalResult := mrOk;
    finally
      // liberação dos objetos da memória
      FreeAndNil(objetoCarteira);
      FreeAndNil(objetoController);
    end;

end;

class function TfrmCadastroCarteiraF.Execute: boolean;
begin
   with TfrmCadastroCarteiraF.Create(Screen.ActiveForm) do begin
     Result:= ShowModal() = mrOK;
   end;
end;

end.
