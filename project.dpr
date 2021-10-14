program project;

uses
  Vcl.Forms,
  uMain in 'unit\uMain.pas' {frmMain},
  uDataModule in 'data module\uDataModule.pas' {DM: TDataModule},
  uCadastrarCliente in 'unit\uCadastrarCliente.pas' {frmCadastrarCliente},
  uFunctions in 'function\uFunctions.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmCadastrarCliente, frmCadastrarCliente);
  Application.Run;
end.
