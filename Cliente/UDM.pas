unit UDM;

interface

uses
  System.SysUtils, System.Classes, uDWAbout, uRESTDWPoolerDB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uDWConstsData, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.DApt, FireDAC.Comp.UI;

type
  TDM = class(TDataModule)
    Conn1: TFDConnection;
    Wait1: TFDGUIxWaitCursor;
    Mysql1: TFDPhysMySQLDriverLink;
    QRY_cliente: TFDQuery;
    QRY_produto: TFDQuery;
    QRY_pedido: TFDQuery;
    QRY_pedidoid_pedido: TFDAutoIncField;
    QRY_pedidoId_cliente: TIntegerField;
    dtfldQRY_pedidodata: TDateField;
    QRY_pedidototal: TFloatField;
    strngfldQRY_pedidonome: TStringField;
    QRY_pedidoItem: TFDQuery;
    DsDetalhe: TDataSource;
    QRY_pedidoItemcontagem: TAggregateField;
    QRY_pedidoItemSoma: TAggregateField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
