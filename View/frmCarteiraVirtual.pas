unit frmCarteiraVirtual;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, VclTee.TeeGDIPlus,
  VCLTee.TeEngine, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart, VCLTee.Series,
  Data.DB, VCLTee.DBChart, FireDAC.Stan.Intf, FireDAC.Stan.Param,
  FireDAC.Phys.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Phys, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Vcl.ToolWin,
  Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnMenus, FireDAC.Comp.Client,
  FireDAC.Phys.SQLiteVDataSet, Vcl.StdCtrls, VCLTee.TeCanvas, Vcl.ComCtrls,
  DBAccess, MyAccess;

type
  TfrmCarteiraVirtualF = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Movimentao1: TMenuItem;
    Sair1: TMenuItem;
    Carteira1: TMenuItem;
    Categoria1: TMenuItem;
    Carteira2: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure Categoria1Click(Sender: TObject);
    procedure Carteira2Click(Sender: TObject);
    procedure Carteira1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCarteiraVirtualF: TfrmCarteiraVirtualF;

implementation

{$R *.dfm}

uses frmCadastroCarteira, frmCadastroCategoria, frmMovimentacaoCarteira;

procedure TfrmCarteiraVirtualF.Carteira1Click(Sender: TObject);
begin
  TfrmCadastroCarteiraF.Execute;
end;

procedure TfrmCarteiraVirtualF.Carteira2Click(Sender: TObject);
begin
  TfrmMovimentacaoCarteiraF.Execute;
end;

procedure TfrmCarteiraVirtualF.Categoria1Click(Sender: TObject);
begin
  TfrmCadastroCategoriaF.Execute;
end;

procedure TfrmCarteiraVirtualF.Sair1Click(Sender: TObject);
begin
   If Application.MessageBox('Deseja sair do sistema?','Confirmação',
        mb_YesNo + mb_IconQuestion)= IdYes Then Begin
      Close;
   end;
end;

end.
