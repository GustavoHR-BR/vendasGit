unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfrmMain = class(TForm)
    Menu: TMainMenu;
    CadastrarMenu: TMenuItem;
    ClienteCadastrarMenu: TMenuItem;
    ProdutoCadastrarMenu: TMenuItem;
    Pedidos1: TMenuItem;
    Pedidosdevenda1: TMenuItem;
    procedure ClienteCadastrarMenuClick(Sender: TObject);
    procedure ProdutoCadastrarMenuClick(Sender: TObject);
    procedure Pedidosdevenda1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses uCadastrarCliente, uDataModule, uFunctions, uCadastrarProduto,
  uPedidosDeVenda;

procedure TfrmMain.ClienteCadastrarMenuClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadastrarCliente, frmCadastrarCliente);
  DM.CDSclientescpf.EditMask := '000.000.000-00;1;_';
  DM.CDSclientestelefone.EditMask := '(00)00000-0000;1;_';
  DM.CDSclientesdataNascimento.EditMask := '00/00/0000;1;_';
  DM.CDSclientes.Open;
  try
    frmCadastrarCliente.ShowModal;
  finally
    FreeAndNil(frmCadastrarCliente);
  end;
end;

procedure TfrmMain.Pedidosdevenda1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmPedidosDeVenda, frmPedidosDeVenda);
  try
    frmPedidosDeVenda.ShowModal;
  finally
    FreeAndNil(frmPedidosDeVenda);
  end;
end;

procedure TfrmMain.ProdutoCadastrarMenuClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadastrarProduto, frmCadastrarProduto);
  DM.CDSprodutos.Open;
  try
    frmCadastrarProduto.ShowModal;
  finally
    FreeAndNil(frmCadastrarProduto);
  end;
end;

end.
