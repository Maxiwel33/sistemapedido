object frm_pdvcaixa: Tfrm_pdvcaixa
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'AbrirPDV'
  ClientHeight = 70
  ClientWidth = 638
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
  object pnl1: TPanel
    Left = 0
    Top = 73
    Width = 638
    Height = 0
    Align = alClient
    Caption = 'pnl1'
    TabOrder = 0
    object pnl3: TPanel
      Left = 1
      Top = 1
      Width = 636
      Height = 40
      Align = alTop
      Caption = 'pnl3'
      TabOrder = 0
      object edt1: TEdit
        Left = 48
        Top = 8
        Width = 521
        Height = 21
        TabOrder = 0
        OnChange = edt1Change
      end
    end
    object dbgrd1: TDBGrid
      Left = 1
      Top = 41
      Width = 636
      Height = 0
      Align = alClient
      DataSource = dspassoa
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NOME'
          Width = 378
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CPF_CNPJ'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CELULAR'
          Visible = True
        end>
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 0
    Width = 638
    Height = 73
    Align = alTop
    TabOrder = 1
    object btn1: TSpeedButton
      Left = 71
      Top = 32
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = btn1Click
    end
    object lbl1: TLabel
      Left = 8
      Top = 16
      Width = 41
      Height = 13
      Caption = 'CLIENTE'
    end
    object lbl2: TLabel
      Left = 328
      Top = 16
      Width = 55
      Height = 13
      Caption = 'Funcionario'
    end
    object edtcodcliente: TEdit
      Left = 8
      Top = 32
      Width = 57
      Height = 21
      TabOrder = 0
      Text = '1'
      OnKeyPress = edtcodclienteKeyPress
    end
    object edtcliente: TEdit
      Left = 100
      Top = 32
      Width = 222
      Height = 21
      TabOrder = 1
    end
    object edtcaixa: TEdit
      Left = 328
      Top = 32
      Width = 41
      Height = 21
      TabOrder = 2
      Text = '002'
    end
    object edt_funciona: TEdit
      Left = 384
      Top = 32
      Width = 209
      Height = 21
      TabOrder = 3
      Text = 'LUIS CARLOS'
    end
  end
  object dspassoa: TDataSource
    Left = 408
    Top = 169
  end
end
