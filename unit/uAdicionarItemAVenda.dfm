object frmAdicionarItemAVenda: TfrmAdicionarItemAVenda
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Adicionar Item'
  ClientHeight = 322
  ClientWidth = 533
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
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 91
    Height = 13
    Caption = 'Pesquisar produto:'
  end
  object Label2: TLabel
    Left = 239
    Top = 46
    Width = 31
    Height = 13
    Caption = 'Nome:'
    FocusControl = DBEdtNome
  end
  object Label3: TLabel
    Left = 239
    Top = 78
    Width = 31
    Height = 13
    Caption = 'Pre'#231'o:'
    FocusControl = DBEdtPreco
  end
  object Label4: TLabel
    Left = 25
    Top = 81
    Width = 50
    Height = 13
    Caption = 'Descri'#231#227'o:'
    FocusControl = DBEdtDescricao
  end
  object Label5: TLabel
    Left = 360
    Top = 78
    Width = 59
    Height = 13
    Caption = 'No estoque:'
    FocusControl = DBEdtEstoque
  end
  object Label6: TLabel
    Left = 25
    Top = 135
    Width = 60
    Height = 13
    Caption = 'Quantidade:'
  end
  object Label7: TLabel
    Left = 25
    Top = 205
    Width = 74
    Height = 13
    Caption = 'Acr'#233'scimo (%):'
  end
  object Label8: TLabel
    Left = 216
    Top = 135
    Width = 71
    Height = 13
    Caption = 'Desconto (%):'
  end
  object Label9: TLabel
    Left = 216
    Top = 205
    Width = 53
    Height = 13
    Caption = 'Valor total:'
  end
  object Label10: TLabel
    Left = -3
    Top = 102
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
  object edtBuscar: TEdit
    Left = 24
    Top = 43
    Width = 177
    Height = 21
    TabOrder = 0
    OnChange = edtBuscarChange
  end
  object Panel1: TPanel
    Left = -8
    Top = 267
    Width = 561
    Height = 57
    TabOrder = 1
    object btnConfirmar: TSpeedButton
      Left = 268
      Top = 13
      Width = 99
      Height = 28
      Caption = 'Confirmar'
      Enabled = False
      OnClick = btnConfirmarClick
    end
    object btnCancelar: TSpeedButton
      Left = 380
      Top = 13
      Width = 99
      Height = 28
      Caption = 'Cancelar'
      OnClick = btnCancelarClick
    end
  end
  object DBEdtNome: TDBEdit
    Left = 276
    Top = 43
    Width = 195
    Height = 21
    DataField = 'nome'
    DataSource = DM.DSprodutos
    Enabled = False
    TabOrder = 2
  end
  object DBEdtPreco: TDBEdit
    Left = 276
    Top = 75
    Width = 61
    Height = 21
    DataField = 'preco'
    DataSource = DM.DSprodutos
    Enabled = False
    TabOrder = 3
  end
  object DBEdtDescricao: TDBEdit
    Left = 81
    Top = 78
    Width = 120
    Height = 21
    DataField = 'descricao'
    DataSource = DM.DSprodutos
    Enabled = False
    TabOrder = 4
  end
  object DBEdtEstoque: TDBEdit
    Left = 425
    Top = 75
    Width = 46
    Height = 21
    DataField = 'quantidadeNoEstoque'
    DataSource = DM.DSprodutos
    Enabled = False
    TabOrder = 5
  end
  object edtQuantidade: TEdit
    Left = 25
    Top = 154
    Width = 121
    Height = 21
    TabOrder = 6
    Text = '1'
    OnChange = edtQuantidadeChange
  end
  object edtAcrescimo: TEdit
    Left = 25
    Top = 224
    Width = 121
    Height = 21
    TabOrder = 7
    Text = '0'
    OnChange = edtAcrescimoChange
  end
  object edtDesconto: TEdit
    Left = 216
    Top = 154
    Width = 121
    Height = 21
    TabOrder = 8
    Text = '0'
    OnChange = edtDescontoChange
  end
  object edtValorTotal: TEdit
    Left = 216
    Top = 224
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 9
    Text = '0'
  end
end
