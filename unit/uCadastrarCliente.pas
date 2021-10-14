unit uCadastrarCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, Vcl.ImgList;

type
  TfrmCadastrarCliente = class(TForm)
    DSclientes: TDataSource;
    DBGridClientes: TDBGrid;
    Label2: TLabel;
    DBEdtNome: TDBEdit;
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
    edtBuscar: TEdit;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    ImageList: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastrarCliente: TfrmCadastrarCliente;

implementation

{$R *.dfm}

uses uDataModule, uMain;

end.
