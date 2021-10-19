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

  if (StrToInt(edtQuantidade.Text) < 1) or
    (StrToInt(edtQuantidade.Text) >
    StrToInt(dm.CDSprodutosquantidadeNoEstoque.Text)) then
    ShowMessage('Quantidade inv�lida!')
  else if (StrToInt(edtDesconto.Text) < 0) or (StrToInt(edtDesconto.Text) > 100)
  then
    ShowMessage('Desconto inv�lido!')
  else if (StrToInt(edtAcrescimo.Text) < 0) or
    (StrToInt(edtAcrescimo.Text) > 100) then
    ShowMessage('Acr�scimo inv�lido!')
  else
  begin
    dm.CDSitens.Edit;
    dm.CDSitensfkproduto.AsInteger := dm.CDSprodutosid.AsInteger;
    dm.CDSitensnome.AsString := dm.CDSprodutosnome.AsString;
    dm.CDSitenspreco.AsString := dm.CDSprodutospreco.AsString;
    dm.CDSitensdescricao.AsString := dm.CDSprodutosdescricao.AsString;
    dm.CDSitensquantidade.AsInteger := StrToInt(edtQuantidade.Text);
    dm.CDSitens.Post;
    dm.CDSitens.ApplyUpdates(0);

    frmCadastrarVenda.btnRemoverItem.Enabled := true;
    frmCadastrarVenda.btnEditarItem.Enabled := true;
    frmCadastrarVenda.edtDesconto.Enabled := true;
    frmCadastrarVenda.edtFrete.Enabled := true;
    frmCadastrarVenda.btnConfirmarVenda.Enabled := true;

    dm.dataSetItens.CommandText := 'select * from item where fkVenda = ' +
      dm.CDSvendasid.Text + ' order by id asc;';
    frmCadastrarVenda.DBGridItensDaVenda.DataSource := dm.DSitens;

    frmCadastrarVenda.edtAuxiliar.Text := edtValorTotal.Text;
    frmCadastrarVenda.edtSubTotal.Text :=
      FloatToStr(StrToFloat(frmCadastrarVenda.edtSubTotal.Text) +
      StrToFloat(frmCadastrarVenda.edtAuxiliar.Text));
    valorTotalDaVenda;
    Tag := 1;
    frmAdicionarItemAVenda.Close;
  end;

end;

procedure TfrmAdicionarItemAVenda.Button1Click(Sender: TObject);
begin
  valorTotalDoItem;
end;

procedure TfrmAdicionarItemAVenda.edtBuscarChange(Sender: TObject);
begin
  dm.SQLConnection.Close;
  dm.SQLConnection.Open;

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
      edtQuantidade.Enabled := true;
      edtAcrescimo.Enabled := true;
      edtDesconto.Enabled := true;
      valorTotalDoItem;
    end;
  end
  else
  begin
    DBEdtNome.Clear;
    DBEdtPreco.Clear;
    DBEdtDescricao.Clear;
    DBEdtEstoque.Clear;
    edtValorTotal.Clear;
    edtQuantidade.Clear;
    edtAcrescimo.Clear;
    edtDesconto.Clear;
    btnConfirmar.Enabled := false;
    edtQuantidade.Enabled := false;
    edtAcrescimo.Enabled := false;
    edtDesconto.Enabled := false;
  end;
end;

procedure TfrmAdicionarItemAVenda.edtDescontoChange(Sender: TObject);
begin
  valorTotalDoItem;
end;

procedure TfrmAdicionarItemAVenda.edtQuantidadeChange(Sender: TObject);
begin
  valorTotalDoItem;
end;

procedure TfrmAdicionarItemAVenda.edtAcrescimoChange(Sender: TObject);
begin
  valorTotalDoItem;
end;

procedure TfrmAdicionarItemAVenda.btnCancelarClick(Sender: TObject);
begin
  if frmCadastrarVenda.Tag <> 4 then
  begin
    btnConfirmar.Enabled := false;
    btnCancelar.Enabled := false;
    edtBuscar.Clear;
    edtValorTotal.Text := '0';
    DBEdtNome.Clear;
    DBEdtPreco.Clear;
    DBEdtDescricao.Clear;
    DBEdtEstoque.Clear;
  end
  else
  begin
    frmAdicionarItemAVenda.Close;
  end;
end;

procedure TfrmAdicionarItemAVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  if (Tag <> 1) and (Tag <> 2) then
  begin

    dm.CDSitens.Close;
    dm.dataSetItens.Close;
    dm.dataSetItens.CommandText := 'delete from item where (id = ' +
      FloatToStr((getId('id', 'item') - 1)) + ') and (fkVenda = ' +
      dm.CDSvendasid.Text + ');';
    try
      dm.dataSetItens.Open;
      dm.CDSitens.Open;
    except
      on E: Exception do
    end;

    dm.CDSitens.Close;
    dm.dataSetItens.Close;
    dm.dataSetItens.CommandText := 'select * from item where fkVenda = ' +
      dm.CDSvendasid.Text + ' order by id asc;';
    dm.dataSetItens.Open;
    dm.CDSitens.Open;
    frmCadastrarVenda.DBGridItensDaVenda.DataSource := dm.DSitens;

    frmAdicionarItemAVenda.Close;
  end;
end;

procedure TfrmAdicionarItemAVenda.FormShow(Sender: TObject);
begin
  if frmCadastrarVenda.Tag = 4 then
  begin
    DBEdtNome.Clear;
    DBEdtPreco.Text := '0';
    DBEdtDescricao.Clear;
    DBEdtEstoque.Text := '0';

    dm.CDSitens.Open;
    dm.CDSitens.Append;
    dm.CDSitensid.AsInteger := getId('id', 'item');
    dm.CDSitensfkVenda.AsInteger := StrToInt(dm.CDSvendasid.Text);
    try
      dm.CDSitens.Post;
      dm.CDSitens.ApplyUpdates(0);
    except
      on E: Exception do
    end;
  end
  else if frmCadastrarVenda.Tag = 2 then
  begin
    dm.CDSitens.Open;
    edtBuscar.Enabled := false;
    btnConfirmar.Enabled := true;
    edtValorTotal.Text :=
      FloatToStr((StrToFloat(dm.CDSitenspreco.Text) *
      StrToInt(dm.CDSitensquantidade.Text)));
    edtQuantidade.Text := dm.CDSitensquantidade.Text;
  end
  else
  begin

  end;
end;

end.
