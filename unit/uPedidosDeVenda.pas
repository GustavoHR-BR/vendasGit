unit uPedidosDeVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Data.DB;

type
  TfrmPedidosDeVenda = class(TForm)
    edtBuscar: TEdit;
    Label1: TLabel;
    DBGridVendas: TDBGrid;
    btnNovo: TSpeedButton;
    btnEditar: TSpeedButton;
    btnImprimir: TSpeedButton;
    Panel1: TPanel;
    Panel2: TPanel;
    btnSair: TSpeedButton;
    DSvendas: TDataSource;
    DSclientes: TDataSource;
    DSprodutos: TDataSource;
    edtCPF: TEdit;
    edtNome: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    DSitem: TDataSource;
    DBGridProdutos: TDBGrid;
    procedure edtBuscarChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGridVendasCellClick(Column: TColumn);
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidosDeVenda: TfrmPedidosDeVenda;

implementation

{$R *.dfm}

uses uCadastrarCliente, uCadastrarProduto, uCadastrarVenda, uDataModule,
  uFunctions, uMain;

procedure TfrmPedidosDeVenda.btnNovoClick(Sender: TObject);
begin
  //

end;

procedure TfrmPedidosDeVenda.DBGridVendasCellClick(Column: TColumn);
begin
  selectItemFromVenda;
  DBGridProdutos.DataSource := DSitem;
end;

procedure TfrmPedidosDeVenda.edtBuscarChange(Sender: TObject);
begin
  DM.CDSclientes.Close;
  DM.queryClientes.Close;
  DM.queryClientes.SQL.Clear;
  DM.queryClientes.SQL.Add('select * from cliente where nome LIKE "%' +
    LowerCase(Trim(edtBuscar.Text)) + '%";');
  DM.CDSclientes.Open;

  if DM.CDSclientesnome.Text <> '' then
  begin
    edtCPF.Text := DM.CDSclientescpf.Text;
    edtNome.Text := DM.CDSclientesnome.Text;

    if edtBuscar.Text = '' then
    begin
      DM.CDSvendas.Close;
      DM.queryVendas.Close;
      DM.queryVendas.SQL.Clear;
      DM.queryVendas.SQL.Add('select * from venda;');
      DM.CDSvendas.Open;
      DBGridVendas.DataSource := DSvendas;
      edtCPF.Clear;
      edtNome.Clear;
      selectItemFromVenda;
      DBGridProdutos.DataSource := DSitem;
    end
    else
    begin
      DM.CDSvendas.Close;
      DM.queryVendas.Close;
      DM.queryVendas.SQL.Clear;
      DM.queryVendas.SQL.Add('select * from venda where fkCliente = ' +
        DM.CDSclientesid.Text + ';');
      DM.CDSvendas.Open;
      DBGridVendas.DataSource := DSvendas;
      selectItemFromVenda;
      DBGridProdutos.DataSource := DSitem;
    end;

  end
  else
  begin
    selectItemFromVenda;
    DBGridProdutos.DataSource := DSitem;
    edtCPF.Clear;
    edtNome.Clear;
  end;
end;

procedure TfrmPedidosDeVenda.FormCreate(Sender: TObject);
begin
  selectItemFromVenda;
  DBGridProdutos.DataSource := DSitem;
end;

end.
