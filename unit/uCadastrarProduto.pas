unit uCadastrarProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;

type
  TfrmCadastrarProduto = class(TForm)
    Label1: TLabel;
    btnNovo: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnCancelar: TSpeedButton;
    edtBuscar: TEdit;
    DSprodutos: TDataSource;
    DBGrid: TDBGrid;
    Label3: TLabel;
    DBEdtNome: TDBEdit;
    Label4: TLabel;
    DBEdtPreco: TDBEdit;
    Label5: TLabel;
    DBEdtDescricao: TDBEdit;
    Label6: TLabel;
    DBEdtQtdEstoque: TDBEdit;
    procedure edtBuscarChange(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastrarProduto: TfrmCadastrarProduto;

implementation

{$R *.dfm}

uses uCadastrarCliente, uDataModule, uFunctions, uMain;

procedure TfrmCadastrarProduto.edtBuscarChange(Sender: TObject);
begin

  DM.CDSprodutos.Close;
  DM.queryProdutos.Close;
  DM.queryProdutos.SQL.Clear;
  DM.queryProdutos.SQL.Add('select * from produto where nome LIKE "%' +
    LowerCase(Trim(edtBuscar.Text)) + '%";');
  DM.CDSprodutos.Open;
  DBGrid.DataSource := DSprodutos;
end;

procedure TfrmCadastrarProduto.btnNovoClick(Sender: TObject);
begin
  DM.SQLConnection.Close;
  DM.SQLConnection.Open;

  btnEnableProduto(false);
  edtsEnableProduto(true);
  edtBuscar.Enabled := false;
  DBGrid.Enabled := false;

  DM.CDSprodutos.Append;
  DBEdtNome.setfocus;
end;

procedure TfrmCadastrarProduto.btnSalvarClick(Sender: TObject);
begin
  DM.SQLConnection.Close;
  DM.SQLConnection.Open;

  if DM.CDSprodutos.State in [dsInsert] then
  begin

    DM.CDSprodutosid.AsInteger := getId('id', 'produto');
    DM.CDSprodutos.Post;

    try
      DM.CDSprodutos.ApplyUpdates(0);
      btnEnableProduto(true);
      edtsEnableProduto(false);
      ShowMessage('Sucesso ao inserir registro');
    except
      on E: Exception do
        ShowMessage('Erro ao inserir registro-  ' + E.ToString);
    end;
  end
  else if DM.CDSprodutos.State in [dsEdit] then
  begin

    DM.CDSprodutos.Post;
    try
      DM.CDSprodutos.ApplyUpdates(0);
      btnEnableProduto(true);
      edtsEnableProduto(false);
      ShowMessage('Sucesso ao editar registro');
    except
      on E: Exception do
        ShowMessage('Erro ao editar registro-  ' + E.ToString);
    end;
  end;
end;

procedure TfrmCadastrarProduto.btnEditarClick(Sender: TObject);
begin
  btnEnableProduto(false);
  edtsEnableProduto(true);
end;

procedure TfrmCadastrarProduto.btnExcluirClick(Sender: TObject);
begin
  DM.SQLConnection.Close;
  DM.SQLConnection.Open;

  if Application.MessageBox('Deseja realmente excluir?', 'Aten��o',
    MB_YESNO + MB_ICONQUESTION) = mrYes then
  begin
    DM.CDSprodutos.Delete;
    try
      DM.CDSprodutos.ApplyUpdates(0);
      ShowMessage('Registro exclu�do com sucesso! ');
    except
      on E: Exception do
      begin
        ShowMessage('Erro ao deletar registro! ' + E.ToString);
      end;
    end;
  end;

end;

procedure TfrmCadastrarProduto.btnCancelarClick(Sender: TObject);
begin
  DM.CDSprodutos.Cancel;
  edtsEnableProduto(false);
  btnEnableProduto(true);
end;

procedure TfrmCadastrarProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DM.CDSprodutos.State in [dsEdit, dsInsert] then
  begin
    ShowMessage('Existe uma altera��o pendente. Conclua-a primeiro!');
  end
  else
  begin
    if Application.MessageBox('Deseja realmente fechar?', 'Aten��o',
      MB_YESNO + MB_ICONQUESTION) = mrYes then
    begin
      DM.CDSprodutos.Close;
      frmCadastrarProduto.Close;
    end
    else
      Abort;
  end;

end;

end.