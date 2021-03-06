object frmPedidosDeVenda: TfrmPedidosDeVenda
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pedidos de venda'
  ClientHeight = 449
  ClientWidth = 774
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridVendas: TDBGrid
    Left = 0
    Top = 64
    Width = 777
    Height = 193
    DataSource = DM.DSvendas
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGridVendasCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Title.Caption = 'C'#243'digo da venda'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fkCliente'
        Title.Caption = 'C'#243'digo do cliente'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total'
        Title.Caption = 'Total'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data'
        Title.Caption = 'Data'
        Width = 100
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 392
    Width = 777
    Height = 58
    TabOrder = 1
    object btnNovo: TSpeedButton
      Left = 40
      Top = 8
      Width = 80
      Height = 33
      Caption = 'Nova'
      OnClick = btnNovoClick
    end
    object btnImprimir: TSpeedButton
      Left = 136
      Top = 8
      Width = 80
      Height = 33
      Caption = 'Imprimir'
    end
    object btnSair: TSpeedButton
      Left = 672
      Top = 8
      Width = 81
      Height = 33
      Caption = 'Sair'
      OnClick = btnSairClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 777
    Height = 65
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 34
      Width = 70
      Height = 13
      Caption = 'Buscar cliente:'
    end
    object Label2: TLabel
      Left = 446
      Top = 10
      Width = 23
      Height = 13
      Caption = 'CPF:'
    end
    object Label3: TLabel
      Left = 573
      Top = 10
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object edtBuscar: TEdit
      Left = 92
      Top = 29
      Width = 229
      Height = 21
      TabOrder = 0
      OnChange = edtBuscarChange
    end
    object edtCPF: TEdit
      Left = 446
      Top = 29
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object edtNome: TEdit
      Left = 573
      Top = 29
      Width = 162
      Height = 21
      Enabled = False
      TabOrder = 2
    end
  end
  object DBGridProdutos: TDBGrid
    Left = 0
    Top = 256
    Width = 777
    Height = 130
    DataSource = DM.DSitens
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgTitleClick, dgTitleHotTrack]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Title.Caption = 'C'#243'digo do item'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fkVenda'
        Title.Caption = 'C'#243'digo da venda'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fkproduto'
        Title.Caption = 'C'#243'digo do produto'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Nome'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'preco'
        Title.Caption = 'Pre'#231'o'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantidade'
        Title.Caption = 'Quantidade'
        Width = 70
        Visible = True
      end>
  end
end
