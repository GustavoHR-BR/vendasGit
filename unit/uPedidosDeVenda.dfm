object frmPedidosDeVenda: TfrmPedidosDeVenda
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pedidos de venda'
  ClientHeight = 449
  ClientWidth = 679
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridVendas: TDBGrid
    Left = 0
    Top = 64
    Width = 681
    Height = 193
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 392
    Width = 689
    Height = 58
    TabOrder = 1
    object btnNovo: TSpeedButton
      Left = 40
      Top = 8
      Width = 81
      Height = 33
    end
    object btnEditar: TSpeedButton
      Left = 152
      Top = 8
      Width = 81
      Height = 33
    end
    object btnImprimir: TSpeedButton
      Left = 256
      Top = 8
      Width = 97
      Height = 33
    end
    object btnSair: TSpeedButton
      Left = 584
      Top = 8
      Width = 81
      Height = 33
    end
  end
  object DBGridProdutos: TDBGrid
    Left = 0
    Top = 256
    Width = 681
    Height = 130
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 681
    Height = 65
    TabOrder = 3
    object Label1: TLabel
      Left = 24
      Top = 28
      Width = 70
      Height = 13
      Caption = 'Buscar cliente:'
    end
    object edtBuscar: TEdit
      Left = 100
      Top = 23
      Width = 229
      Height = 21
      TabOrder = 0
    end
  end
end
