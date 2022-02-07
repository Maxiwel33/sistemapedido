unit U_BuscaProd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  Tfrm_buscaprod = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    edt1: TEdit;
    pnl3: TPanel;
    dbgrd1: TDBGrid;
    ds1: TDataSource;
    lbl1: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edt1Change(Sender: TObject);
    procedure edt1KeyPress(Sender: TObject; var Key: Char);
    procedure dbgrd1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_buscaprod: Tfrm_buscaprod;

implementation

uses
  UDM, U_PDV;

{$R *.dfm}

procedure Tfrm_buscaprod.dbgrd1KeyPress(Sender: TObject; var Key: Char);
begin
   Close;
  // Frm_pdv.edt_CODIGO.Text:=DM.DWSQL_PRODUTO.FieldByName('codigo_barra').AsString;
  // Frm_pdv.edt_vlrunit.Text:=DM.DWSQL_PRODUTO.FieldByName('valor_venda').AsString;
  // Frm_pdv.pnl_descricao.Caption:=DM.DWSQL_PRODUTO.FieldByName('descricao').AsString;
 //  Frm_pdv.edt_quant.Text:='1';
  // Frm_pdv.edt_quant.SetFocus;


end;

procedure Tfrm_buscaprod.edt1Change(Sender: TObject);
begin
      DM.QRY_produto.Filtered:=False;
      DM.QRY_produto.Filter:='codigo LIKE'+(QuotedStr(edt1.Text+'%'));
      dm.QRY_produto.Filtered:=True;
end;

procedure Tfrm_buscaprod.edt1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  dbgrd1.SetFocus;
end;

procedure Tfrm_buscaprod.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // dm.QRY_produto.Active:=false;
end;

procedure Tfrm_buscaprod.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key= vk_f3 then
  Close;
end;

procedure Tfrm_buscaprod.FormShow(Sender: TObject);
begin
   dm.QRY_produto.Active:=True;
end;

end.
