unit uCadastrarVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastrarVenda: TfrmCadastrarVenda;

implementation

{$R *.dfm}

end.
