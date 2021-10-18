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

  if edtBuscar.Text = '' then
  begin
    dm.CDSprodutos.Close;
    dm.dataSetProdutos.Close;
    dm.dataSetProdutos.CommandText :=
      ('select * from produto limit 0');
    dm.dataSetProdutos.Open;
    dm.CDSprodutos.Open;
    DBGrid.DataSource := dm.DSprodutos;
  end
  else
  begin
    dm.CDSprodutos.Close;
    dm.dataSetProdutos.Close;
    dm.dataSetProdutos.CommandText :=
      ('select * from produto where nome LIKE "%' +
      LowerCase(Trim(edtBuscar.Text)) + '%" order by id asc;');
    dm.dataSetProdutos.Open;
    dm.CDSprodutos.Open;
    DBGrid.DataSource := dm.DSprodutos;
  end;
end;

procedure TfrmCadastrarProduto.btnNovoClick(Sender: TObject);
begin
  dm.SQLConnection.Close;
  dm.SQLConnection.Open;

  btnEnableProduto(false);
  edtsEnableProduto(true);
  edtBuscar.Enabled := false;
  DBGrid.Enabled := false;

  dm.CDSprodutos.Append;
  DBEdtNome.setfocus;
end;

procedure TfrmCadastrarProduto.btnSalvarClick(Sender: TObject);
begin
  dm.SQLConnection.Close;
  dm.SQLConnection.Open;

  if dm.CDSprodutos.State in [dsInsert] then
  begin

    dm.CDSprodutosid.AsInteger := getId('id', 'produto');
    dm.CDSprodutos.Post;

    try
      dm.CDSprodutos.ApplyUpdates(0);
      btnEnableProduto(true);
      edtsEnableProduto(false);
      ShowMessage('Sucesso ao inserir registro');
      DBGrid.Enabled := true;
      edtBuscar.Enabled := true;
    except
      on E: Exception do
        ShowMessage('Erro ao inserir registro-  ' + E.ToString);
    end;
  end
  else if dm.CDSprodutos.State in [dsEdit] then
  begin

    dm.CDSprodutos.Post;
    try
      dm.CDSprodutos.ApplyUpdates(0);
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
  dm.SQLConnection.Close;
  dm.SQLConnection.Open;

  if Application.MessageBox('Deseja realmente excluir?', 'Atenção',
    MB_YESNO + MB_ICONQUESTION) = mrYes then
  begin
    dm.CDSprodutos.Delete;
    try
      dm.CDSprodutos.ApplyUpdates(0);
      ShowMessage('Registro excluído com sucesso! ');
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
  dm.CDSprodutos.Cancel;
  edtsEnableProduto(false);
  btnEnableProduto(true);
end;

procedure TfrmCadastrarProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dm.CDSprodutos.State in [dsEdit, dsInsert] then
  begin
    ShowMessage('Existe uma alteração pendente. Conclua-a primeiro!');
    Abort;
  end
  else
  begin
    if Application.MessageBox('Deseja realmente fechar?', 'Atenção',
      MB_YESNO + MB_ICONQUESTION) = mrYes then
    begin
      dm.CDSprodutos.Close;
      frmCadastrarProduto.Close;
    end
    else
      Abort;
  end;

end;

end.
