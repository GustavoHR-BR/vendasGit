unit uFunctions;

interface

function getId(id, tabela: string): Integer;
procedure btnEnableCliente(status: Boolean);
procedure edtsEnableCliente(status: Boolean);
procedure btnEnableProduto(status: Boolean);
procedure edtsEnableProduto(status: Boolean);
procedure selectItemFromVenda;
function valorTotalDoItem: Double;
function valorTotalDaVenda: Double;

implementation

uses uCadastrarCliente, uDataModule, uMain, System.SysUtils, System.Classes,
  Data.DBXMySQL, Data.DB, Data.SqlExpr, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, uCadastrarProduto, uAdicionarItemAVenda, uCadastrarVenda,
  uPedidosDeVenda;

function getId(id, tabela: string): Integer;
begin
  DM.SQLConnection.Close;
  DM.SQLConnection.Open;

  with TSQLQuery.Create(nil) do
    try
      SQLConnection := uDataModule.DM.SQLConnection;
      sql.Add('select ' + id + ' from ' + tabela + ' order by ' + id +
        ' desc limit 1');
      Open;
      Result := Fields[0].AsInteger + 1;
    finally
      Close;
      Free;
    end;
end;

procedure btnEnableCliente(status: Boolean);
begin
  frmCadastrarCliente.btnNovo.Enabled := status;
  frmCadastrarCliente.btnSalvar.Enabled := not status;
  frmCadastrarCliente.btnEditar.Enabled := status;
  frmCadastrarCliente.btnExcluir.Enabled := status;
  frmCadastrarCliente.btnCancelar.Enabled := not status;
end;

procedure edtsEnableCliente(status: Boolean);
begin
  frmCadastrarCliente.DBEdtNome.Enabled := status;
  frmCadastrarCliente.DBEdtCPF.Enabled := status;
  frmCadastrarCliente.DBEdtTelefone.Enabled := status;
  frmCadastrarCliente.DBEdtEmail.Enabled := status;
  frmCadastrarCliente.DBEdtDataNascimento.Enabled := status;
  frmCadastrarCliente.DBEdtEndereco.Enabled := status;
end;

procedure btnEnableProduto(status: Boolean);
begin
  frmCadastrarProduto.btnNovo.Enabled := status;
  frmCadastrarProduto.btnSalvar.Enabled := not status;
  frmCadastrarProduto.btnEditar.Enabled := status;
  frmCadastrarProduto.btnExcluir.Enabled := status;
  frmCadastrarProduto.btnCancelar.Enabled := not status;
end;

procedure edtsEnableProduto(status: Boolean);
begin
  frmCadastrarProduto.DBEdtNome.Enabled := status;
  frmCadastrarProduto.DBEdtPreco.Enabled := status;
  frmCadastrarProduto.DBEdtDescricao.Enabled := status;
  frmCadastrarProduto.DBEdtQtdEstoque.Enabled := status;
end;

procedure selectItemFromVenda;
begin
  if DM.CDSvendasid.Text <> '' then
  begin
    DM.CDSitens.Close;
    DM.dataSetItens.Close;
    DM.dataSetItens.CommandText :=
      ('select * from item where fkVenda = ' + DM.CDSvendasid.Text +
      ' order by id asc;');
    DM.dataSetItens.Open;
    DM.CDSitens.Open;
  end
  else
  begin
    DM.CDSitens.Close;
    DM.dataSetItens.Close;
    DM.dataSetItens.CommandText :=
      ('select * from item where fkVenda = 0 order by id asc');
    DM.dataSetItens.Open;
    DM.CDSitens.Open;

  end;
end;

function valorTotalDoItem: Double;
var
  preco, desconto, acrescimo: Double;
  qtd: Integer;
begin

  if frmAdicionarItemAVenda.edtQuantidade.Text = '' then
    frmAdicionarItemAVenda.edtQuantidade.Text := '0';

  if frmAdicionarItemAVenda.edtDesconto.Text = '' then
    frmAdicionarItemAVenda.edtDesconto.Text := '0';

  if frmAdicionarItemAVenda.edtAcrescimo.Text = '' then
    frmAdicionarItemAVenda.edtAcrescimo.Text := '0';

  preco := StrToFloat(frmAdicionarItemAVenda.DBEdtPreco.Text);
  qtd := StrToInt(frmAdicionarItemAVenda.edtQuantidade.Text);
  desconto := StrToFloat(frmAdicionarItemAVenda.edtDesconto.Text) / 100;
  acrescimo := StrToFloat(frmAdicionarItemAVenda.edtAcrescimo.Text) / 100;
  Result := (preco * qtd) - (preco * desconto) + (preco * acrescimo);
end;

function valorTotalDaVenda: Double;
var
  subTotal, desconto, frete: Double;
begin

  if frmCadastrarVenda.edtDesconto.Text = '' then
    frmCadastrarVenda.edtDesconto.Text := '0';

  if frmCadastrarVenda.edtFrete.Text = '' then
     frmCadastrarVenda.edtFrete.Text := '0';

  subTotal := StrToFloat(frmCadastrarVenda.edtSubTotal.Text);
  desconto := StrToFloat(frmCadastrarVenda.edtDesconto.Text);
  frete := StrToFloat(frmCadastrarVenda.edtFrete.Text);
  Result := (subTotal - ((desconto * subTotal) / 100) + frete);
end;

end.
