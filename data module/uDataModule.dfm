object DM: TDM
  OldCreateOrder = False
  Height = 394
  Width = 412
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
  object DSPclientes: TDataSetProvider
    DataSet = dataSetClientes
    Left = 152
    Top = 88
  end
  object DSPprodutos: TDataSetProvider
    DataSet = dataSetProdutos
    Left = 152
    Top = 160
  end
  object DSPvendas: TDataSetProvider
    DataSet = dataSetVendas
    Left = 152
    Top = 240
  end
  object DSPitens: TDataSetProvider
    DataSet = dataSetItens
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
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CDSclientesnome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object CDSclientescpf: TStringField
      FieldName = 'cpf'
      Size = 16
    end
    object CDSclientestelefone: TStringField
      FieldName = 'telefone'
      Size = 15
    end
    object CDSclientesemail: TStringField
      FieldName = 'email'
      Size = 30
    end
    object CDSclientesdataNascimento: TStringField
      FieldName = 'dataNascimento'
      Size = 10
    end
    object CDSclientesendereco: TStringField
      FieldName = 'endereco'
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
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
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
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CDSvendasfkCliente: TIntegerField
      FieldName = 'fkCliente'
    end
    object CDSvendastotal: TFMTBCDField
      FieldName = 'total'
      DisplayFormat = '#,0.000'
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
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CDSitensfkVenda: TIntegerField
      FieldName = 'fkVenda'
    end
    object CDSitensfkproduto: TIntegerField
      FieldName = 'fkproduto'
    end
    object CDSitensnome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object CDSitenspreco: TFMTBCDField
      FieldName = 'preco'
      DisplayFormat = '#,0.000'
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
  object DSvendas: TDataSource
    DataSet = CDSvendas
    Left = 344
    Top = 240
  end
  object DSitens: TDataSource
    DataSet = CDSitens
    Left = 344
    Top = 320
  end
  object DSclientes: TDataSource
    DataSet = CDSclientes
    Left = 344
    Top = 88
  end
  object DSprodutos: TDataSource
    DataSet = CDSprodutos
    Left = 344
    Top = 160
  end
  object dataSetItens: TSQLDataSet
    SchemaName = 'gustavo_reblin'
    Active = True
    CommandText = 'select * from item'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 48
    Top = 320
  end
  object dataSetVendas: TSQLDataSet
    SchemaName = 'gustavo_reblin'
    Active = True
    CommandText = 'select * from venda order by id asc;'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 48
    Top = 240
  end
  object dataSetProdutos: TSQLDataSet
    SchemaName = 'gustavo_reblin'
    Active = True
    CommandText = 'select * from produto limit 0;'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 48
    Top = 160
  end
  object dataSetClientes: TSQLDataSet
    SchemaName = 'gustavo_reblin'
    Active = True
    CommandText = 'select * from cliente limit 0;'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 48
    Top = 88
  end
end
