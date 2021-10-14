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
    queryVendas: TSQLQuery;
    queryItens: TSQLQuery;
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
    queryClientesid: TIntegerField;
    queryClientesnome: TStringField;
    queryClientescpf: TStringField;
    queryClientestelefone: TStringField;
    queryClientesemail: TStringField;
    queryClientesdataNascimento: TStringField;
    queryClientesendereco: TStringField;
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
    queryVendasid: TIntegerField;
    queryVendasfkCliente: TIntegerField;
    queryVendastotal: TFMTBCDField;
    queryVendasdata: TStringField;
    CDSitensid: TIntegerField;
    CDSitensfkVenda: TIntegerField;
    CDSitensfkproduto: TIntegerField;
    CDSitensnome: TStringField;
    CDSitenspreco: TFMTBCDField;
    CDSitensdescricao: TStringField;
    CDSitensquantidade: TIntegerField;
    queryItensid: TIntegerField;
    queryItensfkVenda: TIntegerField;
    queryItensfkproduto: TIntegerField;
    queryItensnome: TStringField;
    queryItenspreco: TFMTBCDField;
    queryItensdescricao: TStringField;
    queryItensquantidade: TIntegerField;
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
