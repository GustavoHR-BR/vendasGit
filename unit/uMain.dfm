object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Sistema de vendas'
  ClientHeight = 411
  ClientWidth = 673
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = Menu
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Menu: TMainMenu
    Left = 40
    Top = 328
    object CadastrarMenu: TMenuItem
      Caption = 'Cadastrar'
      object ClienteCadastrarMenu: TMenuItem
        Caption = 'Cliente'
        OnClick = ClienteCadastrarMenuClick
      end
      object ProdutoCadastrarMenu: TMenuItem
        Caption = 'Produto'
        OnClick = ProdutoCadastrarMenuClick
      end
    end
    object Pedidos1: TMenuItem
      Caption = 'Pedidos'
      object Pedidosdevenda1: TMenuItem
        Caption = 'Pedidos de venda'
        OnClick = Pedidosdevenda1Click
      end
    end
  end
end
