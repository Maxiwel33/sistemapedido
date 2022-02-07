object DM: TDM
  OldCreateOrder = False
  Height = 328
  Width = 499
  object Conn1: TFDConnection
    Params.Strings = (
      'Database=wkdados'
      'User_Name=root'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 72
    Top = 40
  end
  object Wait1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 160
    Top = 40
  end
  object Mysql1: TFDPhysMySQLDriverLink
    Left = 264
    Top = 48
  end
  object QRY_cliente: TFDQuery
    Connection = Conn1
    UpdateOptions.UpdateTableName = 'wkdados.tb_cliente'
    UpdateOptions.AutoIncFields = 'codigo'
    SQL.Strings = (
      'Select * from tb_cliente')
    Left = 72
    Top = 128
  end
  object QRY_produto: TFDQuery
    Connection = Conn1
    SQL.Strings = (
      'select * from tb_produto')
    Left = 168
    Top = 128
  end
  object QRY_pedido: TFDQuery
    Connection = Conn1
    UpdateOptions.AutoIncFields = 'id_pedido'
    SQL.Strings = (
      'select * from tb_pedido')
    Left = 264
    Top = 128
    object QRY_pedidoid_pedido: TFDAutoIncField
      FieldName = 'id_pedido'
      Origin = 'id_pedido'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QRY_pedidoId_cliente: TIntegerField
      FieldName = 'Id_cliente'
      Origin = 'Id_cliente'
      Required = True
    end
    object dtfldQRY_pedidodata: TDateField
      FieldName = 'data'
      Origin = '`data`'
      Required = True
    end
    object QRY_pedidototal: TFloatField
      FieldName = 'total'
      Origin = 'total'
      Required = True
    end
    object strngfldQRY_pedidonome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 50
    end
  end
  object QRY_pedidoItem: TFDQuery
    IndexFieldNames = 'id_pedido'
    AggregatesActive = True
    MasterSource = DsDetalhe
    MasterFields = 'id_pedido'
    DetailFields = 'id_pedido'
    Connection = Conn1
    SQL.Strings = (
      'select * from tb_pedidoitem, tb_pedido'
      'where tb_pedidoitem.id_pedido = tb_pedido.id_pedido')
    Left = 304
    Top = 216
    object QRY_pedidoItemcontagem: TAggregateField
      FieldName = 'contagem'
      Active = True
      DisplayName = ''
      Expression = 'count()'
    end
    object QRY_pedidoItemSoma: TAggregateField
      FieldName = 'Soma'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(precounit)'
    end
  end
  object DsDetalhe: TDataSource
    DataSet = QRY_pedido
    Left = 360
    Top = 152
  end
end
