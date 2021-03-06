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
    btnImprimir: TSpeedButton;
    Panel1: TPanel;
    Panel2: TPanel;
    btnSair: TSpeedButton;
    edtCPF: TEdit;
    edtNome: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBGridProdutos: TDBGrid;
    procedure edtBuscarChange(Sender: TObject);
    procedure DBGridVendasCellClick(Column: TColumn);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure TfrmPedidosDeVenda.btnEditarClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadastrarVenda, frmCadastrarVenda);
  Tag := 0;
  try
    frmCadastrarVenda.ShowModal;
  finally
    FreeAndNil(frmCadastrarVenda);
  end;
end;

procedure TfrmPedidosDeVenda.btnNovoClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadastrarVenda, frmCadastrarVenda);
  try
    frmCadastrarVenda.ShowModal;
  finally
    FreeAndNil(frmCadastrarVenda);
  end;
end;

procedure TfrmPedidosDeVenda.btnSairClick(Sender: TObject);
begin
  frmPedidosDeVenda.Close;
end;

procedure TfrmPedidosDeVenda.DBGridVendasCellClick(Column: TColumn);
begin
  Tag := 1;
  selectItemFromVenda;
  DBGridProdutos.DataSource := DM.DSitens;
end;

procedure TfrmPedidosDeVenda.edtBuscarChange(Sender: TObject);
begin

  DM.CDSclientes.Close;
  DM.dataSetClientes.Close;
  DM.dataSetClientes.CommandText :=
    ('select * from cliente where nome LIKE "%' + LowerCase(Trim(edtBuscar.Text)
    ) + '%";');
  DM.dataSetClientes.Open;
  DM.CDSclientes.Open;

  if DM.CDSclientesnome.Text <> '' then
  begin
    edtCPF.Text := DM.CDSclientescpf.Text;
    edtNome.Text := DM.CDSclientesnome.Text;

    if edtBuscar.Text = '' then
    begin

      DM.CDSvendas.Close;
      DM.dataSetVendas.Close;
      DM.dataSetVendas.CommandText := 'select * from venda order by id asc;';
      DM.CDSvendas.Open;
      DM.dataSetVendas.Open;

      DBGridVendas.DataSource := DM.DSvendas;
      edtCPF.Clear;
      edtNome.Clear;

      selectItemFromVenda;
      DBGridProdutos.DataSource := DM.DSitens;
    end
    else
    begin

      DM.CDSvendas.Close;
      DM.dataSetVendas.Close;
      DM.dataSetVendas.CommandText :=
        ('select * from venda where fkCliente = ' + DM.CDSclientesid.Text +
        ' order by id asc;');
      DM.dataSetVendas.Open;
      DM.CDSvendas.Open;

      DBGridVendas.DataSource := DM.DSvendas;
      selectItemFromVenda;
      DBGridProdutos.DataSource := DM.DSitens;
    end;

  end
  else
  begin
    selectItemFromVenda;
    DBGridProdutos.DataSource := DM.DSitens;
    edtCPF.Clear;
    edtNome.Clear;
  end;
end;

procedure TfrmPedidosDeVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Application.MessageBox('Deseja realmente fechar?', 'Aten??o',
    MB_YESNO + MB_ICONQUESTION) = mrYes then
  begin
    DM.CDSvendas.Close;
    dm.CDSitens.Close;
    frmPedidosDeVenda.Close;
  end
  else
    Abort;
end;

procedure TfrmPedidosDeVenda.FormShow(Sender: TObject);

begin
  DM.CDSvendas.Close;
  DM.dataSetVendas.Close;
  DM.dataSetVendas.CommandText := 'select * from venda order by id asc;';
  DM.CDSvendas.Open;
  DM.dataSetVendas.Open;

  DBGridVendas.DataSource := DM.DSvendas;
  selectItemFromVenda;
  DBGridProdutos.DataSource := DM.DSitens;
end;

end.
