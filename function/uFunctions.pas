unit uFunctions;

interface

function getId(id, tabela: string): Integer;
procedure btnEnableCliente(status: Boolean);
procedure edtsEnableCliente(status: Boolean);

implementation

uses uCadastrarCliente, uDataModule, uMain, System.SysUtils, System.Classes,
  Data.DBXMySQL, Data.DB, Data.SqlExpr, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider;

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

end.
