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
  OnCreate = FormCreate
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
    Left = 456
    Top = 32
    Width = 23
    Height = 13
    Caption = 'CPF:'
    FocusControl = DBEdtCPF
  end
  object Label4: TLabel
    Left = 626
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
    Left = 457
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
  end
  object btnRemoverItem: TSpeedButton
    Left = 244
    Top = 141
    Width = 92
    Height = 28
    Caption = 'Remover item'
    Enabled = False
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
    Width = 49
    Height = 13
    Caption = 'Desconto:'
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
    Width = 230
    Height = 21
    TabOrder = 0
    OnChange = edtBuscarChange
  end
  object DBEdtCPF: TDBEdit
    Left = 488
    Top = 29
    Width = 105
    Height = 21
    DataField = 'cpf'
    DataSource = DSclientes
    Enabled = False
    TabOrder = 1
  end
  object DBEdtTelefone: TDBEdit
    Left = 678
    Top = 29
    Width = 105
    Height = 21
    DataField = 'telefone'
    DataSource = DSclientes
    Enabled = False
    TabOrder = 2
  end
  object DBEdtEmail: TDBEdit
    Left = 66
    Top = 75
    Width = 159
    Height = 21
    DataField = 'email'
    DataSource = DSclientes
    Enabled = False
    TabOrder = 3
  end
  object DBEdtDataNascimento: TDBEdit
    Left = 358
    Top = 75
    Width = 81
    Height = 21
    DataField = 'dataNascimento'
    DataSource = DSclientes
    Enabled = False
    TabOrder = 4
  end
  object DBEdtEndereco: TDBEdit
    Left = 512
    Top = 75
    Width = 273
    Height = 21
    DataField = 'endereco'
    DataSource = DSclientes
    Enabled = False
    TabOrder = 5
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 175
    Width = 789
    Height = 146
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object edtSubTotal: TEdit
    Left = 24
    Top = 358
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 7
  end
  object edtDesconto: TEdit
    Left = 160
    Top = 358
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 8
  end
  object edtFrete: TEdit
    Left = 296
    Top = 358
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 9
  end
  object edtValorTotal: TEdit
    Left = 676
    Top = 358
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 10
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
    end
    object btnConfirmarVenda: TSpeedButton
      Left = 591
      Top = 5
      Width = 99
      Height = 28
      Caption = 'Confrimar venda'
    end
  end
  object btnSelecionar: TButton
    Left = 358
    Top = 27
    Width = 75
    Height = 25
    Caption = 'Selecionar'
    TabOrder = 12
    OnClick = btnSelecionarClick
  end
  object DSclientes: TDataSource
    DataSet = DM.CDSclientes
    Left = 24
    Top = 400
  end
  object dsItens: TDataSource
    DataSet = DM.CDSitens
    Left = 88
    Top = 400
  end
end
