unit UBuscaProdPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls;

type
  Tfrm_buscaProdpedido = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    dbgrd1: TDBGrid;
    Ds1: TDataSource;
    pnl4: TPanel;
    edt_busca: TEdit;
    dbtxtdescricao: TDBText;
    dbtxtcodigo: TDBText;
    lbl1: TLabel;
    procedure edt_buscaChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edt_buscaKeyPress(Sender: TObject; var Key: Char);
    procedure dbgrd1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_buscaProdpedido: Tfrm_buscaProdpedido;

implementation

uses
  UDM, U_VendaInterna;

{$R *.dfm}

procedure Tfrm_buscaProdpedido.dbgrd1KeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
    begin
        if (frm_vendainterna.edt_codcli.Text = '') then
     begin
     ShowMessage('primeiro acrescente um cliente') ;
     exit
     end else
     frm_vendainterna.edt_codprod.Text:=dm.QRY_produto.FieldByName('codigo').AsString;
     frm_vendainterna.edt_desc.Text:=DM.QRY_produto.FieldByName('descricao').AsString;
     frm_vendainterna.edt_vlr_unit.Text:=DM.QRY_produto.FieldByName('preco_venda').AsString;
     frm_vendainterna.edt_qtd.SetFocus;
     Close;
end;
end;

procedure Tfrm_buscaProdpedido.edt_buscaChange(Sender: TObject);
begin
   with dm.QRY_produto do
    begin

     Close;
     sql.Clear;
     sql.Add('select * from tb_produto where codigo like'+QuotedStr(edt_busca.Text+'%'));
     Open();
   end;


 end;



procedure Tfrm_buscaProdpedido.edt_buscaKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key=#13 then
    begin
      dbgrd1.SetFocus;
    end;
end;

procedure Tfrm_buscaProdpedido.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key=VK_F4 then
   Close;
end;

procedure Tfrm_buscaProdpedido.FormShow(Sender: TObject);
begin
     edt_busca.SetFocus;
end;

end.
