object DM: TDM
  OldCreateOrder = False
  Height = 430
  Width = 338
  object SQLConnection: TSQLConnection
    DriverName = 'MySQL'
    GetDriverFunc = 'getSQLDriverMYSQL'
    KeepConnection = False
    LibraryName = 'dbxmys.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXMySQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver160.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=16.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMySqlMetaDataCommandFactory,DbxMySQLDr' +
        'iver160.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMySqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMySQLDriver,Version=16.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverMYSQL'
      'LibraryName=dbxmys.dll'
      'LibraryNameOsx=libsqlmys.dylib'
      'VendorLib=LIBMYSQL.dll'
      'VendorLibWin64=libmysql.dll'
      'VendorLibOsx=libmysqlclient.dylib'
      'HostName=gustavo_reblin.mysql.dbaas.com.br'
      'Database=gustavo_reblin'
      'User_Name=gustavo_reblin'
      'Password=otsgt.3.47Jea'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'BlobSize=-1'
      'ErrorResourceFile=')
    VendorLib = 'LIBMYSQL.dll'
    Connected = True
    Left = 48
    Top = 16
  end
  object queryClientes: TSQLQuery
    Active = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from cliente;')
    SQLConnection = SQLConnection
    Left = 48
    Top = 88
    object queryClientesid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object queryClientesnome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 60
    end
    object queryClientescpf: TStringField
      FieldName = 'cpf'
      Required = True
      Size = 16
    end
    object queryClientestelefone: TStringField
      FieldName = 'telefone'
      Required = True
      Size = 15
    end
    object queryClientesemail: TStringField
      FieldName = 'email'
      Required = True
      Size = 30
    end
    object queryClientesdataNascimento: TStringField
      FieldName = 'dataNascimento'
      Required = True
      Size = 10
    end
    object queryClientesendereco: TStringField
      FieldName = 'endereco'
      Required = True
      Size = 60
    end
  end
  object queryProdutos: TSQLQuery
    Active = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from produto;')
    SQLConnection = SQLConnection
    Left = 48
    Top = 160
    object queryProdutosid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object queryProdutosnome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object queryProdutospreco: TFMTBCDField
      FieldName = 'preco'
      Precision = 12
      Size = 2
    end
    object queryProdutosdescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object queryProdutosquantidadeNoEstoque: TIntegerField
      FieldName = 'quantidadeNoEstoque'
    end
  end
  object queryVendas: TSQLQuery
    Active = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from venda;')
    SQLConnection = SQLConnection
    Left = 48
    Top = 240
    object queryVendasid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object queryVendasfkCliente: TIntegerField
      FieldName = 'fkCliente'
      Required = True
    end
    object queryVendastotal: TFMTBCDField
      FieldName = 'total'
      Precision = 12
      Size = 2
    end
    object queryVendasdata: TStringField
      FieldName = 'data'
      Size = 10
    end
  end
  object queryItens: TSQLQuery
    Active = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from item;')
    SQLConnection = SQLConnection
    Left = 48
    Top = 320
    object queryItensid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object queryItensfkVenda: TIntegerField
      FieldName = 'fkVenda'
      Required = True
    end
    object queryItensfkproduto: TIntegerField
      FieldName = 'fkproduto'
      Required = True
    end
    object queryItensnome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object queryItenspreco: TFMTBCDField
      FieldName = 'preco'
      Precision = 12
      Size = 2
    end
    object queryItensdescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object queryItensquantidade: TIntegerField
      FieldName = 'quantidade'
    end
  end
  object DSPclientes: TDataSetProvider
    DataSet = queryClientes
    Left = 152
    Top = 88
  end
  object DSPprodutos: TDataSetProvider
    DataSet = queryProdutos
    Left = 152
    Top = 160
  end
  object DSPvendas: TDataSetProvider
    DataSet = queryVendas
    Left = 152
    Top = 240
  end
  object DSPitens: TDataSetProvider
    DataSet = queryItens
    Left = 152
    Top = 320
  end
  object CDSclientes: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPclientes'
    Left = 256
    Top = 88
    object CDSclientesid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object CDSclientesnome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 60
    end
    object CDSclientescpf: TStringField
      FieldName = 'cpf'
      Required = True
      Size = 16
    end
    object CDSclientestelefone: TStringField
      FieldName = 'telefone'
      Required = True
      Size = 15
    end
    object CDSclientesemail: TStringField
      FieldName = 'email'
      Required = True
      Size = 30
    end
    object CDSclientesdataNascimento: TStringField
      FieldName = 'dataNascimento'
      Required = True
      Size = 10
    end
    object CDSclientesendereco: TStringField
      FieldName = 'endereco'
      Required = True
      Size = 60
    end
  end
  object CDSprodutos: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPprodutos'
    Left = 256
    Top = 160
    object CDSprodutosid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object CDSprodutosnome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object CDSprodutospreco: TFMTBCDField
      FieldName = 'preco'
      Precision = 12
      Size = 2
    end
    object CDSprodutosdescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object CDSprodutosquantidadeNoEstoque: TIntegerField
      FieldName = 'quantidadeNoEstoque'
    end
  end
  object CDSvendas: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPvendas'
    Left = 256
    Top = 240
    object CDSvendasid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object CDSvendasfkCliente: TIntegerField
      FieldName = 'fkCliente'
      Required = True
    end
    object CDSvendastotal: TFMTBCDField
      FieldName = 'total'
      Precision = 12
      Size = 2
    end
    object CDSvendasdata: TStringField
      FieldName = 'data'
      Size = 10
    end
  end
  object CDSitens: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPitens'
    Left = 256
    Top = 320
    object CDSitensid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object CDSitensfkVenda: TIntegerField
      FieldName = 'fkVenda'
      Required = True
    end
    object CDSitensfkproduto: TIntegerField
      FieldName = 'fkproduto'
      Required = True
    end
    object CDSitensnome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object CDSitenspreco: TFMTBCDField
      FieldName = 'preco'
      Precision = 12
      Size = 2
    end
    object CDSitensdescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object CDSitensquantidade: TIntegerField
      FieldName = 'quantidade'
    end
  end
end
