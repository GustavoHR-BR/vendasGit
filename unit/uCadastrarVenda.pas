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
    DSclientes: TDataSource;
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
    DBGrid1: TDBGrid;
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
    dsItens: TDataSource;
    procedure edtBuscarChange(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAddItemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastrarVenda: TfrmCadastrarVenda;

implementation

{$R *.dfm}

uses uCadastrarCliente, uCadastrarProduto, uDataModule, uFunctions, uMain,
  uPedidosDeVenda;

procedure TfrmCadastrarVenda.btnAddItemClick(Sender: TObject);
begin
  //
end;

procedure TfrmCadastrarVenda.btnSelecionarClick(Sender: TObject);
begin
  edtBuscar.Text := dm.CDSclientesnome.Text;
  btnAddItem.Enabled := true;
end;

procedure TfrmCadastrarVenda.edtBuscarChange(Sender: TObject);
begin
  dm.CDSclientes.Close;
  dm.queryClientes.Close;
  dm.queryClientes.SQL.Clear;
  dm.queryClientes.SQL.Add('select * from cliente where nome LIKE "%' +
    LowerCase(Trim(edtBuscar.Text)) + '%";');
  dm.CDSclientes.Open;

  if edtBuscar.Text <> dm.CDSclientesnome.Text then
    btnAddItem.Enabled := false;
end;

procedure TfrmCadastrarVenda.FormCreate(Sender: TObject);
begin

  DBEdtCPF.Clear;
  DBEdtTelefone.Clear;
  DBEdtEmail.Clear;
  DBEdtDataNascimento.Clear;
  DBEdtEndereco.Clear;
end;

end.
