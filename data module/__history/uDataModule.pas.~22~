unit uDataModule;

interface

uses
  System.SysUtils, System.Classes, Data.DBXMySQL, Data.DB, Data.SqlExpr,
  Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider;

type
  TDM = class(TDataModule)
    SQLConnection: TSQLConnection;
    queryClientes: TSQLQuery;
    queryProdutos: TSQLQuery;
    DSPclientes: TDataSetProvider;
    DSPprodutos: TDataSetProvider;
    DSPvendas: TDataSetProvider;
    DSPitens: TDataSetProvider;
    CDSclientes: TClientDataSet;
    CDSprodutos: TClientDataSet;
    CDSvendas: TClientDataSet;
    CDSitens: TClientDataSet;
    CDSclientesid: TIntegerField;
    CDSclientesnome: TStringField;
    CDSclientescpf: TStringField;
    CDSclientestelefone: TStringField;
    CDSclientesemail: TStringField;
    CDSclientesdataNascimento: TStringField;
    CDSclientesendereco: TStringField;
    CDSprodutosid: TIntegerField;
    CDSprodutosnome: TStringField;
    CDSprodutospreco: TFMTBCDField;
    CDSprodutosdescricao: TStringField;
    CDSprodutosquantidadeNoEstoque: TIntegerField;
    queryProdutosid: TIntegerField;
    queryProdutosnome: TStringField;
    queryProdutospreco: TFMTBCDField;
    queryProdutosdescricao: TStringField;
    queryProdutosquantidadeNoEstoque: TIntegerField;
    CDSvendasid: TIntegerField;
    CDSvendasfkCliente: TIntegerField;
    CDSvendastotal: TFMTBCDField;
    CDSvendasdata: TStringField;
    DSvendas: TDataSource;
    DSitens: TDataSource;
    DSclientes: TDataSource;
    DSprodutos: TDataSource;
    dataSetItens: TSQLDataSet;
    dataSetVendas: TSQLDataSet;
    CDSitensid: TIntegerField;
    CDSitensfkVenda: TIntegerField;
    CDSitensfkproduto: TIntegerField;
    CDSitensnome: TStringField;
    CDSitenspreco: TFMTBCDField;
    CDSitensdescricao: TStringField;
    CDSitensquantidade: TIntegerField;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}



end.
