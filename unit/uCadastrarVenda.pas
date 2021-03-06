unit uCadastrarVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmCadastrarVenda = class(TForm)
    lbl: TLabel;
    edtBuscar: TEdit;
    Label3: TLabel;
    DBEdtCPF: TDBEdit;
    Label4: TLabel;
    DBEdtTelefone: TDBEdit;
    Label5: TLabel;
    DBEdtEmail: TDBEdit;
    Label6: TLabel;
    DBEdtDataNascimento: TDBEdit;
    Label7: TLabel;
    DBEdtEndereco: TDBEdit;
    Label1: TLabel;
    btnAddItem: TSpeedButton;
    btnEditarItem: TSpeedButton;
    btnRemoverItem: TSpeedButton;
    DBGridItensDaVenda: TDBGrid;
    edtSubTotal: TEdit;
    Label2: TLabel;
    edtDesconto: TEdit;
    Label8: TLabel;
    edtFrete: TEdit;
    Label9: TLabel;
    edtValorTotal: TEdit;
    Label10: TLabel;
    Panel1: TPanel;
    btnSair: TSpeedButton;
    btnConfirmarVenda: TSpeedButton;
    btnSelecionar: TButton;
    btnCancelar: TButton;
    edtAuxiliar: TEdit;
    procedure edtBuscarChange(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnAddItemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtDescontoChange(Sender: TObject);
    procedure edtFreteChange(Sender: TObject);
    procedure btnConfirmarVendaClick(Sender: TObject);
    procedure btnRemoverItemClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEditarItemClick(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  frmCadastrarVenda: TfrmCadastrarVenda;

implementation

{$R *.dfm}

uses uCadastrarCliente, uCadastrarProduto, uDataModule, uFunctions, uMain,
  uPedidosDeVenda, uAdicionarItemAVenda;

procedure TfrmCadastrarVenda.btnAddItemClick(Sender: TObject);
begin
  Application.CreateForm(TfrmAdicionarItemAVenda, frmAdicionarItemAVenda);
  Tag := 4;
  frmAdicionarItemAVenda.Tag := 0;
  try
    frmAdicionarItemAVenda.ShowModal;
  finally
    FreeAndNil(frmAdicionarItemAVenda);
  end;
end;

procedure TfrmCadastrarVenda.btnCancelarClick(Sender: TObject);
begin
  edtBuscar.Clear;
  btnCancelar.Enabled := false;
  btnAddItem.Enabled := false;
  btnSelecionar.Enabled := true;
  edtBuscar.Enabled := true;
  DBEdtCPF.Clear;
  DBEdtTelefone.Clear;
  DBEdtEmail.Clear;
  DBEdtDataNascimento.Clear;
  DBEdtEndereco.Clear;

  dm.CDSvendas.Close;
  dm.dataSetVendas.Close;
  dm.dataSetVendas.CommandText :=
    ('delete from venda where id = ' +
    IntToStr((getId('id', 'venda') - 1)) + ';');
  try
    dm.dataSetVendas.Open;
    dm.CDSvendas.Open;
  except
    on E: Exception do
  end;
end;

procedure TfrmCadastrarVenda.btnConfirmarVendaClick(Sender: TObject);
begin

  dm.SQLConnection.Close;
  dm.SQLConnection.Open;

  dm.CDSvendas.Edit;
  dm.CDSvendasfkCliente.Text := dm.CDSclientesid.Text;
  dm.CDSvendastotal.Text := edtValorTotal.Text;
  dm.CDSvendasdata.Text := DateToStr(Date);
  try
    dm.CDSvendas.ApplyUpdates(2);
    dm.CDSitens.ApplyUpdates(2);
    ShowMessage('Venda realizada com sucesso! ');
    frmCadastrarVenda.Close;
    Tag := 1;
  except
    on E: Exception do
      ShowMessage('Erro ao realizar a venda! ' + E.ToString);
  end;

end;

procedure TfrmCadastrarVenda.btnEditarItemClick(Sender: TObject);
begin
  Application.CreateForm(TfrmAdicionarItemAVenda, frmAdicionarItemAVenda);
  Tag := 2;
  try
    frmAdicionarItemAVenda.ShowModal;
  finally
    FreeAndNil(frmAdicionarItemAVenda);
  end;
end;

procedure TfrmCadastrarVenda.btnRemoverItemClick(Sender: TObject);
begin
  Tag := 3;
  dm.SQLConnection.Close;
  dm.SQLConnection.Open;

  if Application.MessageBox('Deseja realmente excluir?', 'Aten??o',
    MB_YESNO + MB_ICONQUESTION) = mrYes then
  begin
    dm.CDSitens.Delete;
    try
      dm.CDSitens.ApplyUpdates(0);
      ShowMessage('Item exclu?do com sucesso! ');
    except
      on E: Exception do
      begin
        ShowMessage('Erro ao deletar item! ' + E.ToString);
      end;
    end;
  end;
end;

procedure TfrmCadastrarVenda.btnSairClick(Sender: TObject);
begin
  frmCadastrarVenda.Close;
end;

procedure TfrmCadastrarVenda.btnSelecionarClick(Sender: TObject);
begin
  if dm.CDSclientesnome.Text <> '' then
  begin
    edtBuscar.Text := dm.CDSclientesnome.Text;
    btnAddItem.Enabled := true;
    btnSelecionar.Enabled := false;
    edtBuscar.Enabled := false;
    btnCancelar.Enabled := true;
  end
  else
    ShowMessage('Primeiro selecione um cliente! ');
end;

procedure TfrmCadastrarVenda.edtBuscarChange(Sender: TObject);
begin

  dm.CDSclientes.Close;
  dm.dataSetClientes.Close;
  dm.dataSetClientes.CommandText :=
    ('select * from cliente where nome LIKE "%' + LowerCase(Trim(edtBuscar.Text)
    ) + '%";');
  dm.dataSetClientes.Open;
  dm.CDSclientes.Open;

  if edtBuscar.Text <> dm.CDSclientesnome.Text then
    btnAddItem.Enabled := false;
end;

procedure TfrmCadastrarVenda.edtDescontoChange(Sender: TObject);
begin
  valorTotalDaVenda;
end;

procedure TfrmCadastrarVenda.edtFreteChange(Sender: TObject);
begin
  valorTotalDaVenda;
end;

procedure TfrmCadastrarVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  I, rows, lastId: Integer;
begin
  if (Tag <> 1) and (Tag <> 2) then
  begin

    rows := DBGridItensDaVenda.DataSource.DataSet.RecordCount;
    lastId := getId('id', 'item');

    if Application.MessageBox('Deseja realmente fechar? ' +
      'Todos os dados da venda ser?o perdidos!', 'Aten??o',
      MB_YESNO + MB_ICONQUESTION) = mrYes then
    begin
      for I := 1 to rows do
      begin
        dm.CDSitens.Close;
        dm.dataSetItens.Close;
        dm.dataSetItens.CommandText := 'delete from item where (id = ' +
          IntToStr(lastId - I) + ') and (fkVenda = ' +
          dm.CDSvendasid.Text + ');';
        try
          dm.dataSetItens.Open;
          dm.CDSitens.Open;
        except
          on E: Exception do
        end;
      end;

      dm.CDSvendas.Close;
      dm.dataSetItens.Close;
      dm.dataSetVendas.CommandText := 'delete from venda where id = ' +
        IntToStr((getId('id', 'venda') - 1));
      try
        dm.dataSetVendas.Open;
        dm.CDSvendas.Open;
      except
        on E: Exception do
      end;

      dm.CDSvendas.Close;
      dm.dataSetVendas.Close;
      dm.dataSetVendas.CommandText := 'select * from venda order by id asc;';
      dm.CDSvendas.Open;
      dm.dataSetVendas.Open;

      frmPedidosDeVenda.DBGridVendas.DataSource := dm.DSvendas;
      selectItemFromVenda;
    end
    else
      Abort;
  end
  else
  begin
    frmCadastrarVenda.Close;
  end;
end;

procedure TfrmCadastrarVenda.FormShow(Sender: TObject);
begin
  dm.CDSitens.Close;
  dm.dataSetItens.Close;
  dm.dataSetItens.CommandText := 'select * from item limit 0';
  dm.dataSetItens.Open;
  dm.CDSitens.Open;
  DBGridItensDaVenda.DataSource := dm.DSitens;

  dm.CDSvendas.Append;
  dm.CDSvendasid.AsInteger := getId('id', 'venda');
  try
    dm.CDSvendas.Post;
    dm.CDSvendas.ApplyUpdates(0);
  except
    on E: Exception do
  end;

  DBEdtCPF.Clear;
  DBEdtTelefone.Clear;
  DBEdtEmail.Clear;
  DBEdtDataNascimento.Clear;
  DBEdtEndereco.Clear;
end;

end.
