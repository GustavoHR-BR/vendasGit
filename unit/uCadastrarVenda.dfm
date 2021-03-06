object frmCadastrarVenda: TfrmCadastrarVenda
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de venda'
  ClientHeight = 450
  ClientWidth = 817
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
  object lbl: TLabel
    Left = 24
    Top = 32
    Width = 92
    Height = 13
    Caption = 'Selecione o cliente:'
  end
  object Label3: TLabel
    Left = 484
    Top = 32
    Width = 23
    Height = 13
    Caption = 'CPF:'
    FocusControl = DBEdtCPF
  end
  object Label4: TLabel
    Left = 630
    Top = 32
    Width = 46
    Height = 13
    Caption = 'Telefone:'
    FocusControl = DBEdtTelefone
  end
  object Label5: TLabel
    Left = 28
    Top = 78
    Width = 32
    Height = 13
    Caption = 'E-mail:'
    FocusControl = DBEdtEmail
  end
  object Label6: TLabel
    Left = 253
    Top = 78
    Width = 99
    Height = 13
    Caption = 'Data de nascimento:'
    FocusControl = DBEdtDataNascimento
  end
  object Label7: TLabel
    Left = 461
    Top = 78
    Width = 49
    Height = 13
    Caption = 'Endere'#231'o:'
    FocusControl = DBEdtEndereco
  end
  object Label1: TLabel
    Left = 8
    Top = 120
    Width = 840
    Height = 23
    Caption = 
      '----------------------------------------------------------------' +
      '--------------------------------------------------------'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnAddItem: TSpeedButton
    Left = 24
    Top = 141
    Width = 92
    Height = 28
    Caption = 'Adicionar item'
    Enabled = False
    OnClick = btnAddItemClick
  end
  object btnEditarItem: TSpeedButton
    Left = 133
    Top = 141
    Width = 92
    Height = 28
    Caption = 'Editar item'
    Enabled = False
    OnClick = btnEditarItemClick
  end
  object btnRemoverItem: TSpeedButton
    Left = 244
    Top = 141
    Width = 92
    Height = 28
    Caption = 'Remover item'
    Enabled = False
    OnClick = btnRemoverItemClick
  end
  object Label2: TLabel
    Left = 24
    Top = 339
    Width = 48
    Height = 13
    Caption = 'Sub-total:'
  end
  object Label8: TLabel
    Left = 160
    Top = 339
    Width = 68
    Height = 13
    Caption = 'Desconto(%):'
  end
  object Label9: TLabel
    Left = 296
    Top = 339
    Width = 30
    Height = 13
    Caption = 'Frete:'
  end
  object Label10: TLabel
    Left = 676
    Top = 339
    Width = 53
    Height = 13
    Caption = 'Valor total:'
  end
  object edtBuscar: TEdit
    Left = 122
    Top = 29
    Width = 175
    Height = 21
    TabOrder = 0
    OnChange = edtBuscarChange
  end
  object DBEdtCPF: TDBEdit
    Left = 516
    Top = 29
    Width = 105
    Height = 21
    DataField = 'cpf'
    DataSource = DM.DSclientes
    Enabled = False
    TabOrder = 1
  end
  object DBEdtTelefone: TDBEdit
    Left = 682
    Top = 29
    Width = 105
    Height = 21
    DataField = 'telefone'
    DataSource = DM.DSclientes
    Enabled = False
    TabOrder = 2
  end
  object DBEdtEmail: TDBEdit
    Left = 66
    Top = 75
    Width = 159
    Height = 21
    DataField = 'email'
    DataSource = DM.DSclientes
    Enabled = False
    TabOrder = 3
  end
  object DBEdtDataNascimento: TDBEdit
    Left = 358
    Top = 75
    Width = 81
    Height = 21
    DataField = 'dataNascimento'
    DataSource = DM.DSclientes
    Enabled = False
    TabOrder = 4
  end
  object DBEdtEndereco: TDBEdit
    Left = 516
    Top = 75
    Width = 273
    Height = 21
    DataField = 'endereco'
    DataSource = DM.DSclientes
    Enabled = False
    TabOrder = 5
  end
  object DBGridItensDaVenda: TDBGrid
    Left = 8
    Top = 175
    Width = 789
    Height = 146
    DataSource = DM.DSitens
    TabOrder = 6
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
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Nome'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'preco'
        Title.Caption = 'Pre'#231'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantidade'
        Title.Caption = 'Quantidade'
        Visible = True
      end>
  end
  object edtSubTotal: TEdit
    Left = 24
    Top = 358
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 7
    Text = '0'
  end
  object edtDesconto: TEdit
    Left = 160
    Top = 358
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 8
    Text = '0'
    OnChange = edtDescontoChange
  end
  object edtFrete: TEdit
    Left = 296
    Top = 358
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 9
    Text = '0'
    OnChange = edtFreteChange
  end
  object edtValorTotal: TEdit
    Left = 676
    Top = 358
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 10
    Text = '0'
  end
  object Panel1: TPanel
    Left = 0
    Top = 400
    Width = 817
    Height = 55
    TabOrder = 11
    object btnSair: TSpeedButton
      Left = 704
      Top = 5
      Width = 85
      Height = 28
      Caption = 'Sair'
      OnClick = btnSairClick
    end
    object btnConfirmarVenda: TSpeedButton
      Left = 591
      Top = 5
      Width = 99
      Height = 28
      Caption = 'Confrimar venda'
      Enabled = False
      OnClick = btnConfirmarVendaClick
    end
    object edtAuxiliar: TEdit
      Left = 24
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 0
      Visible = False
    end
  end
  object btnSelecionar: TButton
    Left = 311
    Top = 27
    Width = 66
    Height = 25
    Caption = 'Selecionar'
    TabOrder = 12
    OnClick = btnSelecionarClick
  end
  object btnCancelar: TButton
    Left = 392
    Top = 27
    Width = 66
    Height = 25
    Caption = 'Cancelar'
    Enabled = False
    TabOrder = 13
    OnClick = btnCancelarClick
  end
end
