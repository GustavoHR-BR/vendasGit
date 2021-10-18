unit uCadastrarCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, Vcl.ImgList;

type
  TfrmCadastrarCliente = class(TForm)
    DBGrid: TDBGrid;
    Label2: TLabel;
    DBEdtNome: TDBEdit;
    Label4: TLabel;
    DBEdtTelefone: TDBEdit;
    Label5: TLabel;
    DBEdtEmail: TDBEdit;
    Label7: TLabel;
    DBEdtEndereco: TDBEdit;
    edtBuscar: TEdit;
    Label1: TLabel;
    btnNovo: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnCancelar: TSpeedButton;
    Label3: TLabel;
    DBEdtCPF: TDBEdit;
    Label6: TLabel;
    DBEdtDataNascimento: TDBEdit;
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
  frmCadastrarCliente: TfrmCadastrarCliente;

implementation

{$R *.dfm}

uses uDataModule, uMain, uFunctions;

procedure TfrmCadastrarCliente.edtBuscarChange(Sender: TObject);
begin

  if edtBuscar.Text = '' then
  begin
    dm.CDSclientes.Close;
    dm.dataSetClientes.Close;
    dm.dataSetClientes.CommandText :=
      ('select * from cliente limit 0;');
    dm.dataSetClientes.Open;
    dm.CDSclientes.Open;
    DBGrid.DataSource := dm.DSclientes;
  end
  else
  begin
    dm.CDSclientes.Close;
    dm.dataSetClientes.Close;
    dm.dataSetClientes.CommandText :=
      ('select * from cliente where nome LIKE "%' +
      LowerCase(Trim(edtBuscar.Text)) + '%" order by id asc;');
    dm.dataSetClientes.Open;
    dm.CDSclientes.Open;
    DBGrid.DataSource := dm.DSclientes;
  end;
end;

procedure TfrmCadastrarCliente.btnNovoClick(Sender: TObject);
begin
  dm.SQLConnection.Close;
  dm.SQLConnection.Open;

  btnEnableCliente(false);
  edtsEnableCliente(true);
  edtBuscar.Enabled := false;
  DBGrid.Enabled := false;

  dm.CDSclientes.Append;
  DBEdtNome.setfocus;
end;

procedure TfrmCadastrarCliente.btnSalvarClick(Sender: TObject);
begin

  dm.SQLConnection.Close;
  dm.SQLConnection.Open;

  if dm.CDSclientes.State in [dsInsert] then
  begin

    dm.CDSclientesid.AsInteger := getId('id', 'cliente');
    dm.CDSclientes.Post;

    try
      dm.CDSclientes.ApplyUpdates(0);
      btnEnableCliente(true);
      edtsEnableCliente(false);
      ShowMessage('Sucesso ao inserir registro');
      DBGrid.Enabled := true;
      edtBuscar.Enabled := true;
    except
      on E: Exception do
        ShowMessage('Erro ao inserir registro-  ' + E.ToString);
    end;
  end
  else if dm.CDSclientes.State in [dsEdit] then
  begin

    dm.CDSclientes.Post;
    try
      dm.CDSclientes.ApplyUpdates(0);
      btnEnableCliente(true);
      edtsEnableCliente(false);
      ShowMessage('Sucesso ao editar registro');
    except
      on E: Exception do
        ShowMessage('Erro ao editar registro-  ' + E.ToString);
    end;
  end;

end;

procedure TfrmCadastrarCliente.btnEditarClick(Sender: TObject);
begin
  btnEnableCliente(false);
  edtsEnableCliente(true);
end;

procedure TfrmCadastrarCliente.btnExcluirClick(Sender: TObject);
begin
  dm.SQLConnection.Close;
  dm.SQLConnection.Open;

  if Application.MessageBox('Deseja realmente excluir?', 'Atenção',
    MB_YESNO + MB_ICONQUESTION) = mrYes then
  begin
    dm.CDSclientes.Delete;
    try
      dm.CDSclientes.ApplyUpdates(0);
      ShowMessage('Registro excluído com sucesso! ');
    except
      on E: Exception do
      begin
        ShowMessage('Erro ao deletar registro! ' + E.ToString);
      end;
    end;
  end;
end;

procedure TfrmCadastrarCliente.btnCancelarClick(Sender: TObject);
begin
  dm.CDSclientes.Cancel;
  edtsEnableCliente(false);
  btnEnableCliente(true);
end;

procedure TfrmCadastrarCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dm.CDSclientes.State in [dsEdit, dsInsert] then
  begin
    ShowMessage('Existe uma alteração pendente. Conclua-a primeiro!');
    Abort;
  end
  else
  begin
    if Application.MessageBox('Deseja realmente fechar?', 'Atenção',
      MB_YESNO + MB_ICONQUESTION) = mrYes then
    begin
      dm.CDSclientes.Close;
      frmCadastrarCliente.Close;
    end
    else
      Abort;
  end;

end;

end.
