program project;

uses
  Vcl.Forms,
  uMain in 'unit\uMain.pas' {frmMain},
  uDataModule in 'data module\uDataModule.pas' {DM: TDataModule},
  uCadastrarCliente in 'unit\uCadastrarCliente.pas' {frmCadastrarCliente},
  uFunctions in 'function\uFunctions.pas',
  uCadastrarProduto in 'unit\uCadastrarProduto.pas' {frmCadastrarProduto},
  uPedidosDeVenda in 'unit\uPedidosDeVenda.pas' {frmPedidosDeVenda},
  uCadastrarVenda in 'unit\uCadastrarVenda.pas' {frmCadastrarVenda};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmCadastrarCliente, frmCadastrarCliente);
  Application.CreateForm(TfrmCadastrarProduto, frmCadastrarProduto);
  Application.CreateForm(TfrmPedidosDeVenda, frmPedidosDeVenda);
  Application.CreateForm(TfrmCadastrarVenda, frmCadastrarVenda);
  Application.Run;
end.
