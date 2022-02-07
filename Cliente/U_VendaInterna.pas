unit U_VendaInterna;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  Tfrm_vendainterna = class(TForm)
    pnl1: TPanel;
    ds1: TDataSource;
    lbl1: TLabel;
    dbedtID: TDBEdit;
    lbl2: TLabel;
    lbl4: TLabel;
    dbedtdata: TDBEdit;
    pnl2: TPanel;
    ds2: TDataSource;
    pnl3: TPanel;
    pnl4: TPanel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    edt_cliente: TEdit;
    edt_codcli: TEdit;
    btn3: TSpeedButton;
    btn_Salva: TBitBtn;
    btn5: TBitBtn;
    edt_codprod: TEdit;
    edt_desc: TEdit;
    edt_qtd: TEdit;
    edt_vlr_unit: TEdit;
    lbl3: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    dbgrd1: TDBGrid;
    btn_busca: TBitBtn;
    dbedttotal: TDBEdit;
    dbtxtcontagem: TDBText;
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure edt_codcliKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btn_SalvaClick(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure edt_codprodKeyPress(Sender: TObject; var Key: Char);
    procedure edt_qtdKeyPress(Sender: TObject; var Key: Char);
    procedure btn_buscaClick(Sender: TObject);
  private
    { Private declarations }
  public

  procedure limparedits;
    { Public declarations }
  end;

var
  frm_vendainterna: Tfrm_vendainterna;

implementation

uses
  UDM, U_localcliente, U_BuscaProd, UBuscaProdPedido;

{$R *.dfm}

procedure Tfrm_vendainterna.btn1Click(Sender: TObject);
begin
dm.QRY_pedido.Insert;
btn_Salva.Enabled:=True;
dbedtdata.Text:=DateToStr(now);
edt_codcli.SetFocus;
end;

procedure Tfrm_vendainterna.btn_buscaClick(Sender: TObject);
begin
Application.CreateForm(Tfrm_buscaProdpedido,frm_buscaProdpedido);
try
  frm_buscaProdpedido.ShowModal;
finally
FreeAndNil(frm_buscaProdpedido);

end;
end;

procedure Tfrm_vendainterna.btn_SalvaClick(Sender: TObject);
begin
    dm.QRY_pedidoItem.Active:=True;

    dm.QRY_pedido.FieldByName('id_cliente').AsInteger:=StrToInt(edt_codcli.Text);
    dm.QRY_pedido.FieldByName('nome').AsString:=edt_cliente.Text;
    DM.QRY_pedido.FieldByName('total').AsString:='0,00';
    DM.QRY_pedido.Post;


end;

procedure Tfrm_vendainterna.btn5Click(Sender: TObject);
begin
Close;
end;

procedure Tfrm_vendainterna.edt_codcliKeyPress(Sender: TObject; var Key: Char);
begin
if key =#13 then

    if not DM.QRY_cliente.Locate('codigo',edt_codcli.Text,[]) then
    begin
    ShowMessage('cliente nao cadastrado');
    edt_cliente.Clear;
    edt_codcli.Clear;
    edt_codcli.SetFocus;
    exit
   end else
      edt_cliente.Text:=dm.QRY_cliente.FieldByName('nome').AsString;
    end;



procedure Tfrm_vendainterna.edt_codprodKeyPress(Sender: TObject; var Key: Char);
begin
if key =#13 then
begin

    if not DM.QRY_produto.Locate('codigo',edt_codprod.Text,[]) then
    begin
    ShowMessage('Produto não cadastrado');
    edt_codprod.Clear;
    edt_desc.Clear;
    edt_vlr_unit.Clear;
    edt_codprod.SetFocus ;
    exit
   end else
      edt_desc.Text:=dm.QRY_produto.FieldByName('descricao').AsString;
      edt_vlr_unit.Text:=dm.QRY_produto.FieldByName('preco_venda').AsString;
      edt_qtd.SetFocus;


    end;

end;


procedure Tfrm_vendainterna.edt_qtdKeyPress(Sender: TObject; var Key: Char);
begin
   if Key=#13 then
   begin
    // dm.QRY_pedidoItem.Edit;
     dm.QRY_pedidoItem.insert;
     dm.QRY_pedidoItem.FieldByName('id_produto').AsInteger:=DM.QRY_produto.FieldByName('codigo').AsInteger;
     dm.QRY_pedidoItem.FieldByName('codigo').AsString:=edt_codprod.Text;
     dm.QRY_pedidoItem.FieldByName('descricao').AsString:=edt_desc.Text;
     dm.QRY_pedidoItem.FieldByName('quant').AsString:=edt_qtd.Text;
     dm.QRY_pedidoItem.FieldByName('precounit').AsFloat:=StrToFloat(edt_vlr_unit.Text);
     DM.QRY_pedidoItem.Next;
     limparedits;
     edt_codprod.SetFocus;
   end;

end;

procedure Tfrm_vendainterna.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
       if Key=vk_f4 then
    begin
      Application.CreateForm(Tfrm_buscaProdpedido, frm_buscaProdpedido);
      try
      frm_buscaProdpedido.ShowModal;
      finally
        FreeAndNil(frm_buscaProdpedido);
      end;
    end;
end;

procedure Tfrm_vendainterna.FormShow(Sender: TObject);
begin
      dm.QRY_cliente.Close;
      dm.QRY_cliente.Open;

      dm.QRY_pedido.Active:=True;
      dm.QRY_produto.Active:=True;


end;

procedure Tfrm_vendainterna.limparedits;
begin
   edt_codprod.Clear;
   edt_desc.Clear;
   edt_vlr_unit.Clear;
   edt_qtd.Clear;
end;

end.
