object frmCadastrarCliente: TfrmCadastrarCliente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de clientes'
  ClientHeight = 551
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
  object Label2: TLabel
    Left = 112
    Top = 304
    Width = 31
    Height = 13
    Caption = 'Nome:'
    FocusControl = DBEdtNome
  end
  object Label4: TLabel
    Left = 98
    Top = 352
    Width = 46
    Height = 13
    Caption = 'Telefone:'
    FocusControl = DBEdtTelefone
  end
  object Label5: TLabel
    Left = 451
    Top = 352
    Width = 32
    Height = 13
    Caption = 'E-mail:'
    FocusControl = DBEdtEmail
  end
  object Label7: TLabel
    Left = 430
    Top = 400
    Width = 49
    Height = 13
    Caption = 'Endere'#231'o:'
    FocusControl = DBEdtEndereco
  end
  object Label1: TLabel
    Left = 11
    Top = 51
    Width = 50
    Height = 13
    Caption = 'Pesquisar:'
  end
  object btnNovo: TSpeedButton
    Left = 119
    Top = 488
    Width = 65
    Height = 41
    Caption = 'Novo'
    OnClick = btnNovoClick
  end
  object btnSalvar: TSpeedButton
    Left = 231
    Top = 488
    Width = 65
    Height = 41
    Caption = 'Salvar'
    Enabled = False
    OnClick = btnSalvarClick
  end
  object btnEditar: TSpeedButton
    Left = 345
    Top = 488
    Width = 65
    Height = 41
    Caption = 'Editar'
    OnClick = btnEditarClick
  end
  object btnExcluir: TSpeedButton
    Left = 461
    Top = 488
    Width = 65
    Height = 41
    Caption = 'Excluir'
    OnClick = btnExcluirClick
  end
  object btnCancelar: TSpeedButton
    Left = 583
    Top = 488
    Width = 65
    Height = 41
    Caption = 'Cancelar'
    Enabled = False
    OnClick = btnCancelarClick
  end
  object Label3: TLabel
    Left = 460
    Top = 304
    Width = 23
    Height = 13
    Caption = 'CPF:'
    FocusControl = DBEdtCPF
  end
  object Label6: TLabel
    Left = 39
    Top = 400
    Width = 99
    Height = 13
    Caption = 'Data de nascimento:'
    FocusControl = DBEdtDataNascimento
  end
  object DBGrid: TDBGrid
    Left = 67
    Top = 88
    Width = 695
    Height = 185
    DataSource = DM.DSclientes
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
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
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Nome'
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cpf'
        Title.Caption = 'CPF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'telefone'
        Title.Caption = 'Telefone'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'email'
        Title.Caption = 'E-mail'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dataNascimento'
        Title.Caption = 'Nascimento'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'endereco'
        Title.Caption = 'Endere'#231'o'
        Width = 200
        Visible = True
      end>
  end
  object DBEdtNome: TDBEdit
    Left = 157
    Top = 301
    Width = 212
    Height = 21
    DataField = 'nome'
    DataSource = DM.DSclientes
    Enabled = False
    TabOrder = 1
  end
  object DBEdtTelefone: TDBEdit
    Left = 157
    Top = 349
    Width = 212
    Height = 21
    DataField = 'telefone'
    DataSource = DM.DSclientes
    Enabled = False
    TabOrder = 2
  end
  object DBEdtEmail: TDBEdit
    Left = 494
    Top = 349
    Width = 212
    Height = 21
    DataField = 'email'
    DataSource = DM.DSclientes
    Enabled = False
    TabOrder = 3
  end
  object DBEdtEndereco: TDBEdit
    Left = 494
    Top = 400
    Width = 212
    Height = 21
    DataField = 'endereco'
    DataSource = DM.DSclientes
    Enabled = False
    TabOrder = 4
  end
  object edtBuscar: TEdit
    Left = 67
    Top = 48
    Width = 354
    Height = 21
    TabOrder = 5
    OnChange = edtBuscarChange
  end
  object DBEdtCPF: TDBEdit
    Left = 494
    Top = 301
    Width = 212
    Height = 21
    DataField = 'cpf'
    DataSource = DM.DSclientes
    Enabled = False
    TabOrder = 6
  end
  object DBEdtDataNascimento: TDBEdit
    Left = 157
    Top = 397
    Width = 212
    Height = 21
    DataField = 'dataNascimento'
    DataSource = DM.DSclientes
    Enabled = False
    TabOrder = 7
  end
end
