object frmCadastrarProduto: TfrmCadastrarProduto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de produtos'
  ClientHeight = 530
  ClientWidth = 795
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 31
    Top = 51
    Width = 50
    Height = 13
    Caption = 'Pesquisar:'
  end
  object btnNovo: TSpeedButton
    Left = 121
    Top = 448
    Width = 65
    Height = 43
    Caption = 'Novo'
    OnClick = btnNovoClick
  end
  object btnSalvar: TSpeedButton
    Left = 234
    Top = 448
    Width = 65
    Height = 43
    Caption = 'Salvar'
    Enabled = False
    OnClick = btnSalvarClick
  end
  object btnEditar: TSpeedButton
    Left = 347
    Top = 448
    Width = 65
    Height = 43
    Caption = 'Editar'
    OnClick = btnEditarClick
  end
  object btnExcluir: TSpeedButton
    Left = 463
    Top = 448
    Width = 65
    Height = 43
    Caption = 'Excluir'
    OnClick = btnExcluirClick
  end
  object btnCancelar: TSpeedButton
    Left = 585
    Top = 448
    Width = 65
    Height = 43
    Caption = 'Cancelar'
    Enabled = False
    OnClick = btnCancelarClick
  end
  object Label3: TLabel
    Left = 50
    Top = 323
    Width = 31
    Height = 13
    Caption = 'Nome:'
    FocusControl = DBEdtNome
  end
  object Label4: TLabel
    Left = 50
    Top = 365
    Width = 31
    Height = 13
    Caption = 'Pre'#231'o:'
    FocusControl = DBEdtPreco
  end
  object Label5: TLabel
    Left = 401
    Top = 323
    Width = 50
    Height = 13
    Caption = 'Descri'#231#227'o:'
    FocusControl = DBEdtDescricao
  end
  object Label6: TLabel
    Left = 340
    Top = 365
    Width = 117
    Height = 13
    Caption = 'Quantidade no estoque:'
    FocusControl = DBEdtQtdEstoque
  end
  object edtBuscar: TEdit
    Left = 87
    Top = 48
    Width = 354
    Height = 21
    TabOrder = 0
    OnChange = edtBuscarChange
  end
  object DBGrid: TDBGrid
    Left = 87
    Top = 88
    Width = 665
    Height = 185
    DataSource = DM.DSprodutos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Title.Caption = 'C'#243'digo'
        Width = 50
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
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 245
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantidadeNoEstoque'
        Title.Caption = 'Quantidade no estoque'
        Width = 130
        Visible = True
      end>
  end
  object DBEdtNome: TDBEdit
    Left = 87
    Top = 320
    Width = 212
    Height = 21
    DataField = 'nome'
    DataSource = DM.DSprodutos
    Enabled = False
    TabOrder = 2
  end
  object DBEdtPreco: TDBEdit
    Left = 87
    Top = 362
    Width = 212
    Height = 21
    DataField = 'preco'
    DataSource = DM.DSprodutos
    Enabled = False
    TabOrder = 3
  end
  object DBEdtDescricao: TDBEdit
    Left = 463
    Top = 320
    Width = 212
    Height = 21
    DataField = 'descricao'
    DataSource = DM.DSprodutos
    Enabled = False
    TabOrder = 4
  end
  object DBEdtQtdEstoque: TDBEdit
    Left = 463
    Top = 362
    Width = 212
    Height = 21
    DataField = 'quantidadeNoEstoque'
    DataSource = DM.DSprodutos
    Enabled = False
    TabOrder = 5
  end
end
