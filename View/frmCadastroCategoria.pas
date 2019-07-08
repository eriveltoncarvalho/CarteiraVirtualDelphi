unit frmCadastroCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ComCtrls, Vcl.StdCtrls,
  VCLTee.TeCanvas, Vcl.ExtCtrls, Vcl.Buttons;

type
  TfrmCadastroCategoriaF = class(TForm)
    Panel: TPanel;
    Bevel: TBevel;
    lblCategoria: TLabel;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    edtCategoria: TEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function Execute: boolean;
  end;

var
  frmCadastroCategoriaF: TfrmCadastroCategoriaF;

implementation

{$R *.dfm}

uses uCategoriaController, uCategoriaModel;


procedure TfrmCadastroCategoriaF.btnCancelarClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TfrmCadastroCategoriaF.btnSalvarClick(Sender: TObject);
var
  // variáveis das camadas utilizadas na rotina
    objetoCategoria: TCategoria;
    objetoController: TControllerCategoria;
begin
    objetoCategoria  := TCategoria.Create; // classe Modelo
    objetoController := TControllerCategoria.Create; // classe Controller
    try
      // preenchimento dos dados
      objetoCategoria.nome  := edtCategoria.Text;

      // chamada da rotina para gravação
      objetoController.Salvar(objetoCategoria);
      ModalResult := mrOk;
    finally
      // liberação dos objetos da memória
      FreeAndNil(objetoCategoria);
      FreeAndNil(objetoController);
    end;

end;

class function TfrmCadastroCategoriaF.Execute: boolean;
begin
   with TfrmCadastroCategoriaF.Create(Screen.ActiveForm) do begin
     Result:= ShowModal() = mrOK;
   end;
end;

end.
