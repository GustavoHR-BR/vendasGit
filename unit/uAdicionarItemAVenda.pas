unit uAdicionarItemAVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Data.DB, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons;

type
  TfrmAdicionarItemAVenda = class(TForm)
    Label1: TLabel;
    edtBuscar: TEdit;
    Panel1: TPanel;
    btnConfirmar: TSpeedButton;
    btnCancelar: TSpeedButton;
    Label2: TLabel;
    DBEdtNome: TDBEdit;
    Label3: TLabel;
    DBEdtPreco: TDBEdit;
    Label4: TLabel;
    DBEdtDescricao: TDBEdit;
    Label5: TLabel;
    DBEdtEstoque: TDBEdit;
    edtQuantidade: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    edtAcrescimo: TEdit;
    Label8: TLabel;
    edtDesconto: TEdit;
    edtValorTotal: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    procedure edtBuscarChange(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtQuantidadeChange(Sender: TObject);
    procedure edtDescontoChange(Sender: TObject);
    procedure edtAcrescimoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdicionarItemAVenda: TfrmAdicionarItemAVenda;

implementation

{$R *.dfm}

uses uCadastrarCliente, uCadastrarProduto, uCadastrarVenda, uDataModule,
  uFunctions, uMain, uPedidosDeVenda;

procedure TfrmAdicionarItemAVenda.btnConfirmarClick(Sender: TObject);
begin
  dm.SQLConnection.Close;
  dm.SQLConnection.Open;

  dm.CDSitens.Edit;
  dm.CDSitensfkVenda.AsInteger := StrToInt(dm.CDSvendasid.Text);
  dm.CDSitensfkproduto.AsInteger := StrToInt(dm.CDSprodutosid.Text);
  dm.CDSitensnome.Text := dm.CDSprodutosnome.Text;
  dm.CDSitenspreco.Text := dm.CDSprodutospreco.Text;
  dm.CDSitensdescricao.Text := dm.CDSprodutosdescricao.Text;
  dm.CDSitensquantidade.AsInteger := StrToInt(edtQuantidade.Text);
  dm.CDSitens.Post;
  dm.CDSitens.ApplyUpdates(2);

  frmCadastrarVenda.edtDesconto.Enabled := true;
  frmCadastrarVenda.edtFrete.Enabled := true;
  frmCadastrarVenda.btnConfirmarVenda.Enabled := true;

  frmCadastrarVenda.edtSubTotal.Text :=
    inttostr(StrToInt(frmCadastrarVenda.edtSubTotal.Text) +
    StrToInt(edtValorTotal.Text));

  dm.dataSetItens.CommandText := 'select * from item where fkVenda = ' +
    dm.CDSvendasid.Text + ' order by id asc;';
  frmCadastrarVenda.DBGridItensDaVenda.DataSource := dm.DSitens;

  Tag := 1;
  frmAdicionarItemAVenda.Close;

end;

procedure TfrmAdicionarItemAVenda.Button1Click(Sender: TObject);
begin
  edtValorTotal.Text := floattostr(valorTotalDoItem);
end;

procedure TfrmAdicionarItemAVenda.edtAcrescimoChange(Sender: TObject);
begin
  edtValorTotal.Text := floattostr(valorTotalDoItem);
end;

procedure TfrmAdicionarItemAVenda.edtBuscarChange(Sender: TObject);
begin
  dm.CDSprodutos.Close;
  dm.dataSetProdutos.Close;
  dm.dataSetProdutos.CommandText :=
    ('select * from produto where nome LIKE "%' + LowerCase(Trim(edtBuscar.Text)
    ) + '%";');
  dm.dataSetProdutos.Open;
  dm.CDSprodutos.Open;

  if edtBuscar.Text <> '' then
  begin
    if dm.CDSclientesnome.Text <> '' then
    begin
      btnConfirmar.Enabled := true;
      btnCancelar.Enabled := true;
      edtValorTotal.Text := floattostr(valorTotalDoItem);
    end;
  end
  else
  begin
    DBEdtNome.Clear;
    DBEdtPreco.Clear;
    DBEdtDescricao.Clear;
    DBEdtEstoque.Clear;
    btnConfirmar.Enabled := false;
  end;
end;

procedure TfrmAdicionarItemAVenda.edtDescontoChange(Sender: TObject);
begin
  edtValorTotal.Text := floattostr(valorTotalDoItem);
end;

procedure TfrmAdicionarItemAVenda.edtQuantidadeChange(Sender: TObject);
begin
  edtValorTotal.Text := floattostr(valorTotalDoItem);
end;

procedure TfrmAdicionarItemAVenda.btnCancelarClick(Sender: TObject);
begin
  btnConfirmar.Enabled := false;
  btnCancelar.Enabled := false;
  edtBuscar.Clear;
  DBEdtNome.Clear;
  DBEdtPreco.Clear;
  DBEdtDescricao.Clear;
  DBEdtEstoque.Clear;
end;

procedure TfrmAdicionarItemAVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Tag = 1 then
  begin
    frmCadastrarVenda.edtValorTotal.Text := floattostr(valorTotalDaVenda);
    frmAdicionarItemAVenda.Close;
  end
  else
  begin
    dm.CDSitens.Close;
    dm.CDSitens.Open;
    frmAdicionarItemAVenda.Close;
  end;
end;

procedure TfrmAdicionarItemAVenda.FormShow(Sender: TObject);
begin
  DBEdtNome.Clear;
  DBEdtPreco.Text := '0';
  DBEdtDescricao.Clear;
  DBEdtEstoque.Text := '0';

  dm.CDSitens.Append;
  dm.CDSitensid.AsInteger := getId('id', 'item');
  try
    dm.CDSitens.Post;
    dm.CDSitens.ApplyUpdates(0);
  except
    on E: Exception do
  end;
end;

end.
