unit frmMovimentacaoCarteira;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, DBAccess, MyAccess,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,Vcl.Imaging.pngimage,
  Datasnap.DBClient, Vcl.ComCtrls, DateUtils, ComObj, System.UITypes;


type
  TfrmMovimentacaoCarteiraF = class(TForm)
    GroupBox1: TGroupBox;
    Panel: TPanel;
    lblCodigo: TLabel;
    lblCarteira: TLabel;
    edtCodigo: TEdit;
    edtNome: TEdit;
    btnPesqCarteira: TBitBtn;
    Panel1: TPanel;
    lblSaldo: TLabel;
    lblSaldoValor: TLabel;
    btnLancar: TBitBtn;
    dbgMovimentacao: TDBGrid;
    cdsMovimentacao: TClientDataSet;
    dsMovimentacao: TDataSource;
    cdsMovimentacaoData: TDateTimeField;
    cdsMovimentacaoCategoria: TStringField;
    cdsMovimentacaoOperacao: TStringField;
    cdsMovimentacaoObservacao: TStringField;
    cdsMovimentacaoValor: TCurrencyField;
    cdsMovimentacaoSaldo: TCurrencyField;
    GroupBox2: TGroupBox;
    dtInicial: TDateTimePicker;
    ckbPeriodo: TCheckBox;
    dtFinal: TDateTimePicker;
    lblPeriodo: TLabel;
    cmbOperacao: TComboBox;
    lblOperacao: TLabel;
    btnGerarGrafico: TBitBtn;
    btnExportar: TBitBtn;
    ckbUltimasMovimentacoes: TCheckBox;
    Bevel: TBevel;
    procedure btnLancarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ckbPeriodoClick(Sender: TObject);
    procedure ckbUltimasMovimentacoesClick(Sender: TObject);
    procedure dtInicialExit(Sender: TObject);
    procedure dtFinalExit(Sender: TObject);
    procedure cmbOperacaoSelect(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure btnGerarGraficoClick(Sender: TObject);
    procedure btnPesqCarteiraClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure BuscarCarteira(pID_Carteira:integer);
    procedure ExpCSV(DataSet: TDataSet; Arq: string);
    function filtro(grafico:boolean=false):string;

    class function Execute: boolean;
  end;

var
  frmMovimentacaoCarteiraF: TfrmMovimentacaoCarteiraF;

implementation

{$R *.dfm}

uses frmCadastroLancamento, uMovimentacaoController, uMovimentacaoModel,
  frmGrafico, frmPesquisaCarteira;

{ TfrmMovimentacaoCarteiraF }

procedure TfrmMovimentacaoCarteiraF.btnExportarClick(Sender: TObject);
begin
  ExpCSV(cdsMovimentacao,'Arquivo');
end;

procedure TfrmMovimentacaoCarteiraF.btnGerarGraficoClick(Sender: TObject);
begin
  if TfrmGraficoF.Execute(strtoint(edtCodigo.Text),filtro(true)) then
end;

procedure TfrmMovimentacaoCarteiraF.btnLancarClick(Sender: TObject);
begin
   if TfrmCadastroLancamentoF.Execute(StrToInt(edtCodigo.Text)) then
     BuscarCarteira(StrToInt(edtCodigo.Text));
end;

procedure TfrmMovimentacaoCarteiraF.btnPesqCarteiraClick(Sender: TObject);
var id_carteira: integer;
begin
  if TfrmPesquisaCarteiraF.Execute(id_carteira) then
     BuscarCarteira(id_carteira);
end;

procedure TfrmMovimentacaoCarteiraF.BuscarCarteira(pID_Carteira: integer);
   var
  // vari�veis das camadas utilizadas na rotina
    objetoMovimentacao: TMovimentacao;
    objetoController: TControllerMovimentacao;
begin
    objetoMovimentacao  := TMovimentacao.Create; // classe Modelo
    objetoController := TControllerMovimentacao.Create; // classe Controller
    try
      objetoMovimentacao.id_carteiras := pID_Carteira;
      objetoMovimentacao.filter := filtro;
      objetoController.Buscar(objetoMovimentacao);

      if not cdsMovimentacao.Active then
         cdsMovimentacao.CreateDataSet
      else begin
         cdsMovimentacao.Active := false;
         cdsMovimentacao.CreateDataSet;
      end;

      edtCodigo.Text := IntToStr(pID_Carteira);
      edtNome.Text := objetoMovimentacao.qrySQL.FieldByName('carteira').AsString;

      if objetoMovimentacao.qrySQL.IsEmpty then
         MessageDlg('N�o foi encontrado nenhum lan�amento!', mtInformation, [mbOK], 0);

      objetoMovimentacao.qrySQL.First;

      while not objetoMovimentacao.qrySQL.Eof do begin
          cdsMovimentacao.Append;
          cdsMovimentacaoData.AsDateTime       := objetoMovimentacao.qrySQL.FieldByName('data_cadastro').AsDateTime;
          cdsMovimentacaoCategoria.AsString    := objetoMovimentacao.qrySQL.FieldByName('categoria').AsString;
          cdsMovimentacaoOperacao.AsString     := objetoMovimentacao.qrySQL.FieldByName('operacao').AsString;
          cdsMovimentacaoObservacao.AsString   := objetoMovimentacao.qrySQL.FieldByName('observacao').AsString;
          cdsMovimentacaoValor.AsCurrency      := objetoMovimentacao.qrySQL.FieldByName('valor').AsCurrency;
          cdsMovimentacaoSaldo.AsCurrency      := objetoMovimentacao.qrySQL.FieldByName('saldo').AsCurrency;
          cdsMovimentacao.Post;

          objetoMovimentacao.qrySQL.Next;
      end;

      cdsMovimentacao.Open;

       //chamada da rotina saldo atual
      objetoController.GetSaldo(objetoMovimentacao);
      lblSaldoValor.Caption :=  formatfloat('R$ #,##0.00', objetoMovimentacao.saldo);

    finally
      // libera��o dos objetos da mem�ria
      FreeAndNil(objetoMovimentacao);
      FreeAndNil(objetoController);
    end;
end;

procedure TfrmMovimentacaoCarteiraF.ckbPeriodoClick(Sender: TObject);
begin
  dtInicial.Enabled := ckbPeriodo.Checked;
  dtFinal.Enabled := ckbPeriodo.Checked;

  BuscarCarteira(StrToInt(edtCodigo.Text));
end;

procedure TfrmMovimentacaoCarteiraF.ckbUltimasMovimentacoesClick(
  Sender: TObject);
begin
   cmbOperacao.Enabled := not ckbUltimasMovimentacoes.Checked;
   ckbPeriodo.Enabled := not ckbUltimasMovimentacoes.Checked;
   cmbOperacao.ItemIndex := 0;

   if ckbUltimasMovimentacoes.Checked then
     ckbPeriodo.Checked := not ckbUltimasMovimentacoes.Checked;

    BuscarCarteira(StrToInt(edtCodigo.Text));
end;

procedure TfrmMovimentacaoCarteiraF.cmbOperacaoSelect(Sender: TObject);
begin
   BuscarCarteira(StrToInt(edtCodigo.Text));
end;

procedure TfrmMovimentacaoCarteiraF.dtFinalExit(Sender: TObject);
begin
   BuscarCarteira(StrToInt(edtCodigo.Text));
end;

procedure TfrmMovimentacaoCarteiraF.dtInicialExit(Sender: TObject);
begin
  BuscarCarteira(StrToInt(edtCodigo.Text));
end;

class function TfrmMovimentacaoCarteiraF.Execute: boolean;
begin
  with TfrmMovimentacaoCarteiraF.Create(Screen.ActiveForm) do
  begin
    Result:= ShowModal() = mrOK;
  end;
end;

procedure TfrmMovimentacaoCarteiraF.ExpCSV(DataSet: TDataSet; Arq: string);
var
  ExcApp: OleVariant;
  i,l: integer;
begin
  ExcApp := CreateOleObject('Excel.Application');
  ExcApp.Visible := True;
  ExcApp.WorkBooks.Add;
  DataSet.First;

  l := 1;
  DataSet.First;
  while not DataSet.EOF do
  begin
    for i := 0 to DataSet.Fields.Count - 1 do
      ExcApp.WorkBooks[1].Sheets[1].Cells[l,i + 1] :=
        DataSet.Fields[i].DisplayText;
    DataSet.Next;
    l := l + 1;
  end;
  ExcApp.WorkBooks[1].SaveAs(Arq);

end;

function TfrmMovimentacaoCarteiraF.filtro(grafico:boolean=false): string;
begin
   if cmbOperacao.ItemIndex > 0 then
     Result := ' and mv.operacao='+QuotedStr(cmbOperacao.Text);

   if ckbPeriodo.Checked then
      Result := Result + ' and (data_cadastro between '+QuotedStr(FormatDateTime('yyyy-mm-dd 00:00:00', dtInicial.Date))+
                               ' and '+QuotedStr(FormatDateTime('yyyy-mm-dd 23:59:59', dtFinal.Date))+')';

  if ckbUltimasMovimentacoes.Checked then begin
     if grafico then
        Result := Result + ' group by categoria order by categoria limit 10'
     else Result := Result + ' order by mv.id limit 10';
  end 
  else begin
    if grafico then
      Result := Result + ' group by categoria order by categoria'
    else Result := Result + ' order by mv.id';
  end;

end;

procedure TfrmMovimentacaoCarteiraF.FormCreate(Sender: TObject);
begin
   dtInicial.Date := StartOfTheMonth(Date);
   dtFinal.Date := EndOfTheMonth(date);
   BuscarCarteira(1);
end;

procedure TfrmMovimentacaoCarteiraF.FormDestroy(Sender: TObject);
begin
  FreeAndNil(cdsMovimentacao);
end;

end.
