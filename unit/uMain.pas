unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfrmMain = class(TForm)
    Menu: TMainMenu;
    CadastrarMenu: TMenuItem;
    ClienteCadastrarMenu: TMenuItem;
    ProdutoCadastrarMenu: TMenuItem;
    procedure ClienteCadastrarMenuClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses uCadastrarCliente, uDataModule;

procedure TfrmMain.ClienteCadastrarMenuClick(Sender: TObject);
begin
//
  Application.CreateForm(TfrmCadastrarCliente, frmCadastrarCliente);
  try
    frmCadastrarCliente.ShowModal;
  finally
    FreeAndNil(frmCadastrarCliente);
  end;
end;

end.
