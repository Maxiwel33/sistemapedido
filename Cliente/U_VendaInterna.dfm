object frm_vendainterna: Tfrm_vendainterna
  Left = 0
  Top = 0
  Caption = 'Pedido'
  ClientHeight = 426
  ClientWidth = 721
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 721
    Height = 105
    Align = alTop
    TabOrder = 0
    object lbl1: TLabel
      Left = 8
      Top = 8
      Width = 11
      Height = 13
      Caption = 'ID'
      FocusControl = dbedtID
    end
    object lbl2: TLabel
      Left = 94
      Top = 5
      Width = 30
      Height = 13
      Caption = 'CodCli'
    end
    object lbl4: TLabel
      Left = 512
      Top = 8
      Width = 23
      Height = 13
      Caption = 'Data'
      FocusControl = dbedtdata
    end
    object btn3: TSpeedButton
      Left = 158
      Top = 23
      Width = 23
      Height = 22
      Caption = 'F3'
    end
    object dbedtID: TDBEdit
      Left = 8
      Top = 24
      Width = 80
      Height = 21
      DataField = 'id_pedido'
      DataSource = ds1
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object dbedtdata: TDBEdit
      Left = 512
      Top = 24
      Width = 78
      Height = 21
      DataField = 'data'
      DataSource = ds1
      TabOrder = 3
    end
    object btn1: TBitBtn
      Left = 9
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Insere'
      TabOrder = 4
      OnClick = btn1Click
    end
    object btn2: TBitBtn
      Left = 104
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Cancela'
      TabOrder = 5
    end
    object edt_cliente: TEdit
      Left = 184
      Top = 24
      Width = 322
      Height = 21
      TabOrder = 2
    end
    object edt_codcli: TEdit
      Left = 94
      Top = 24
      Width = 58
      Height = 21
      TabOrder = 1
      OnKeyPress = edt_codcliKeyPress
    end
    object btn_Salva: TBitBtn
      Left = 199
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Salva'
      Enabled = False
      TabOrder = 6
      OnClick = btn_SalvaClick
    end
    object btn5: TBitBtn
      Left = 294
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 7
      OnClick = btn5Click
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 105
    Width = 721
    Height = 104
    Align = alTop
    TabOrder = 1
    object lbl3: TLabel
      Left = 16
      Top = 24
      Width = 87
      Height = 16
      Caption = 'Codigo Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl5: TLabel
      Left = 60
      Top = 72
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object lbl6: TLabel
      Left = 504
      Top = 45
      Width = 30
      Height = 13
      Caption = 'Quant'
    end
    object lbl7: TLabel
      Left = 576
      Top = 45
      Width = 64
      Height = 13
      Caption = 'Valor Unit'#225'rio'
    end
    object edt_codprod: TEdit
      Left = 112
      Top = 21
      Width = 162
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyPress = edt_codprodKeyPress
    end
    object edt_desc: TEdit
      Left = 112
      Top = 64
      Width = 386
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edt_qtd: TEdit
      Left = 504
      Top = 64
      Width = 66
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnKeyPress = edt_qtdKeyPress
    end
    object edt_vlr_unit: TEdit
      Left = 576
      Top = 64
      Width = 121
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object btn_busca: TBitBtn
      Left = 280
      Top = 12
      Width = 75
      Height = 42
      Caption = 'F4 -Filtro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btn_buscaClick
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 209
    Width = 721
    Height = 165
    Align = alClient
    Caption = 'pnl3'
    TabOrder = 2
    object dbgrd1: TDBGrid
      Left = 1
      Top = 1
      Width = 719
      Height = 163
      Align = alClient
      DataSource = ds2
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'codigo'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Width = 400
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quant'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'precounit'
          Width = 100
          Visible = True
        end>
    end
  end
  object pnl4: TPanel
    Left = 0
    Top = 374
    Width = 721
    Height = 52
    Align = alBottom
    TabOrder = 3
    object dbtxtcontagem: TDBText
      Left = 32
      Top = 16
      Width = 65
      Height = 17
      DataField = 'contagem'
      DataSource = ds2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object dbedttotal: TDBEdit
      Left = 576
      Top = 16
      Width = 121
      Height = 27
      DataField = 'Soma'
      DataSource = ds2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object ds1: TDataSource
    DataSet = DM.QRY_pedido
    Left = 448
    Top = 64
  end
  object ds2: TDataSource
    DataSet = DM.QRY_pedidoItem
    Left = 600
    Top = 272
  end
end
