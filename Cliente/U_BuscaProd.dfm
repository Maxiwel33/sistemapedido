object frm_buscaprod: Tfrm_buscaprod
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frm_buscaprod'
  ClientHeight = 496
  ClientWidth = 728
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 728
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'ESTOQUE ** PRODUTOS '
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 660
    object lbl1: TLabel
      Left = 626
      Top = 22
      Width = 62
      Height = 16
      Caption = 'Fechar -F3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 41
    Width = 728
    Height = 42
    Align = alTop
    BevelOuter = bvNone
    Caption = 'pnl2'
    Color = clSilver
    Padding.Left = 40
    Padding.Top = 3
    Padding.Right = 40
    Padding.Bottom = 3
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 660
    object edt1: TEdit
      Left = 40
      Top = 3
      Width = 648
      Height = 36
      Align = alClient
      Alignment = taCenter
      BorderStyle = bsNone
      Color = 8454143
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = edt1Change
      OnKeyPress = edt1KeyPress
      ExplicitWidth = 625
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 440
    Width = 728
    Height = 56
    Align = alBottom
    Color = 599796
    ParentBackground = False
    TabOrder = 2
  end
  object dbgrd1: TDBGrid
    Left = 0
    Top = 83
    Width = 728
    Height = 357
    Align = alClient
    DataSource = ds1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyPress = dbgrd1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'codigo'
        Title.Caption = 'Cod'
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descricao'
        Width = 393
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'preco_venda'
        Title.Caption = 'Valor'
        Visible = True
      end>
  end
  object ds1: TDataSource
    DataSet = DM.QRY_produto
    Left = 152
    Top = 168
  end
end
