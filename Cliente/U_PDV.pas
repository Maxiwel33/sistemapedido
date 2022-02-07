unit U_PDV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.DBCtrls, Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  dxGDIPlusClasses;

type
  TFrm_pdv = class(TForm)
    pnl1: TPanel;
    shp1: TShape;
    pnl_valores: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    shp2: TShape;
    shp3: TShape;
    shp4: TShape;
    shp5: TShape;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    pnl5: TPanel;
    pnl6: TPanel;
    shp6: TShape;
    btn1: TSpeedButton;
    pnl7: TPanel;
    img1: TImage;
    lbl6: TLabel;
    edt_vlrunit: TEdit;
    edt_quant: TEdit;
    edt_CODIGO: TEdit;
    ds2: TDataSource;
    dbgrd1: TDBGrid;
    pnl_descricao: TPanel;
    btn2: TSpeedButton;
    edt_subtotal: TEdit;
    cdsproduto: TClientDataSet;
    strngfld_produtocodigo: TStringField;
    strngfld_produtodescricao: TStringField;
    cdsprodutoQuant: TIntegerField;
    cdsprodutovlr_unit: TFloatField;
    cdsprodutosoma: TFloatField;
    cdsprodutototal: TAggregateField;
    dbedt_total: TDBEdit;
    dsvenda: TDataSource;
    procedure btn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
   // procedure edt_quantKeyPress(Sender: TObject; var Key: Char);
    procedure btn2Click(Sender: TObject);
    procedure cdsprodutoCalcFields(DataSet: TDataSet);
    procedure edt_CODIGOKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
  procedure calculasubtotal;
  procedure limpadados;
  procedure calculalinha;
    { Public declarations }
  end;

var
  Frm_pdv: TFrm_pdv;


implementation

uses
  UDM, U_BuscaProd, U_AbrirPDV;

{$R *.dfm}

procedure TFrm_pdv.btn1Click(Sender: TObject);
begin
Close;
end;

procedure TFrm_pdv.btn2Click(Sender: TObject);
begin
    Application.CreateForm(Tfrm_buscaprod,frm_buscaprod);
    try
      frm_buscaprod.ShowModal;
    finally
      FreeAndNil(frm_buscaprod);
    end;
end;

procedure TFrm_pdv.calculalinha;

begin

end;


procedure TFrm_pdv.calculasubtotal;
var
n1,n2,soma:Double;
begin
      n1:=StrToFloat(edt_vlrunit.Text);
      n2:=StrToInt(edt_quant.Text);
      soma:=(n1*n2);
      edt_subtotal.Text:=FloatToStr(soma);

end;

procedure TFrm_pdv.cdsprodutoCalcFields(DataSet: TDataSet);
begin
    cdsprodutosoma.AsFloat:=cdsprodutoQuant.AsInteger * cdsprodutovlr_unit.AsFloat;
end;

procedure TFrm_pdv.edt_CODIGOKeyPress(Sender: TObject; var Key: Char);
  begin
{    if Key=#13 then
    begin
    if dm.DWSQL_PRODUTO.Locate('codigo_barra',edt_CODIGO.Text,[loCaseInsensitive,loPartialKey])then;
      begin

        pnl_descricao.Caption :=dm.DWSQL_PRODUTO.FieldByName('descricao').AsString;
        edt_vlrunit.Text      :=dm.DWSQL_PRODUTO.FieldByName('valor_venda').AsString;
        edt_quant.Text        :='1';


      end;
    end;
end;

procedure TFrm_pdv.edt_quantKeyPress(Sender: TObject; var Key: Char);
 var
 i:Integer;
begin
    if Key=#13 then
    begin

      cdsProduto.Open;
      cdsProduto.Insert;
      cdsProduto.FieldByName('codigo').AsString:=edt_CODIGO.Text;
      cdsProduto.FieldByName('descricao').AsString:=pnl_descricao.Caption;
      cdsProduto.FieldByName('vlr_unit').AsString:=edt_vlrunit.Text;
      cdsProduto.FieldByName('quant').AsString:=edt_quant.Text;
      cdsProduto.FieldByName('soma').AsString:=cdsprodutosoma.AsString;
      cdsproduto.Next;
    end;
     // cdsProduto.Post;
      if Key=#13 then
      begin
       limpadados;



    end;}

end;

procedure TFrm_pdv.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key=vk_f4 then
   begin
     Application.CreateForm(Tfrm_pdvcaixa,frm_pdvcaixa);
     try
       frm_pdvcaixa.ShowModal;
     finally
      FreeAndNil(frm_pdvcaixa);
     end;
   end;
   if Key=vk_f3 then
   begin
     Application.CreateForm(Tfrm_buscaprod,frm_buscaprod);
     try
     frm_buscaprod.ShowModal;
     finally
       FreeAndNil(frm_buscaprod);
     end;
   end;
end;

procedure TFrm_pdv.FormShow(Sender: TObject);
begin
  //  dm.DWSQL_PRODUTO.Active:=False;
    pnl_valores.Enabled:=False;
    cdsproduto.EmptyDataSet;
end;

procedure TFrm_pdv.limpadados;
begin
   edt_vlrunit.Clear;
   edt_quant.Clear;
   edt_CODIGO.Clear;
   edt_subtotal.Clear;
   edt_CODIGO.SetFocus;
end;

end.
