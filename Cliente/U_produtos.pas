unit U_produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Mask, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.ComCtrls;

type
  Tfrm_produto = class(TForm)
    pgc1: TPageControl;
    ts_cadastro: TTabSheet;
    btn7: TSpeedButton;
    pnl2: TPanel;
    btnnovo: TSpeedButton;
    btnaltera: TSpeedButton;
    btnapaga: TSpeedButton;
    btncancela: TSpeedButton;
    btnsalva: TSpeedButton;
    btnsair: TSpeedButton;
    ts_busca: TTabSheet;
    pnl3: TPanel;
    lbl14: TLabel;
    rg2: TRadioGroup;
    edt1: TEdit;
    dbgrd1: TDBGrid;
    pnl4: TPanel;
    btn2: TSpeedButton;
    pnl1: TPanel;
    ds1: TDataSource;
    lbl2: TLabel;
    dbedtcodigo: TDBEdit;
    lbl4: TLabel;
    dbedtdescricao: TDBEdit;
    lbl5: TLabel;
    dbedtpreco_venda: TDBEdit;
    pnl5: TPanel;
    img1: TImage;
    dbtxtdescricao: TDBText;
    procedure FormShow(Sender: TObject);
    procedure btnsairClick(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure dbedtCODIGO_BARRAExit(Sender: TObject);
    procedure btnnovoClick(Sender: TObject);
    procedure btnalteraClick(Sender: TObject);
    procedure edt1Change(Sender: TObject);
    procedure rg2Click(Sender: TObject);
    procedure btnapagaClick(Sender: TObject);
    procedure btncancelaClick(Sender: TObject);
    procedure btnsalvaClick(Sender: TObject);
    procedure ds1StateChange(Sender: TObject);
  private

  procedure CriaCodigo(Cod: String; Imagem: TCanvas);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_produto: Tfrm_produto;

implementation

uses
  UDM;

{$R *.dfm}

procedure Tfrm_produto.btn2Click(Sender: TObject);
begin
  pgc1.ActivePage:=ts_cadastro;
end;

procedure Tfrm_produto.btn7Click(Sender: TObject);
begin
    pgc1.ActivePage:=ts_busca;
end;

procedure Tfrm_produto.btnalteraClick(Sender: TObject);
begin
   DM.QRY_produto.Edit;
   dbedtcodigo.SetFocus;
end;

procedure Tfrm_produto.btnapagaClick(Sender: TObject);
begin

 if MessageDlg('Deseja realmente excluir o registro corrente?',
   mtConfirmation, mbOKCancel, 0) = mrOk then
 begin
    dm.QRY_produto.Delete;
 end;



end;

procedure Tfrm_produto.btncancelaClick(Sender: TObject);
begin
   DM.QRY_produto.Cancel;
end;

procedure Tfrm_produto.btnnovoClick(Sender: TObject);
begin
   DM.QRY_produto.Insert;
   dbedtcodigo.SetFocus;
end;

procedure Tfrm_produto.btnsairClick(Sender: TObject);
begin
Close;
end;

procedure Tfrm_produto.btnsalvaClick(Sender: TObject);
begin
  dm.QRY_produto.Post;

end;

procedure Tfrm_produto.CriaCodigo(Cod: String; Imagem: TCanvas);
Const
  digitos : array['0'..'9'] of string[5]= ('00110',
  '10001',
  '01001',
  '11000',
  '00101',
  '10100',
  '01100',
  '00011',
  '10010',
  '01010');
Var
  Numero : String;
  Cod1 : Array[1..1000] Of Char;
  Cod2 : Array[1..1000] Of Char;
  Codigo : Array[1..1000] Of Char;
  Digito : String;
  c1,c2 : Integer;
  x,y,z,h : LongInt;
  a,b,c,d : TPoint;
  I : Boolean;
Begin
  Numero := Cod;
  For x := 1 to 1000 Do
  Begin
    Cod1 [x] := #0;
    Cod2 [x] := #0;
    Codigo[x] := #0;
  End;
  c1 := 1;
  c2 := 1;
  x := 1;
  For y := 1 to Length(Numero) div 2 do
  Begin
    Digito := Digitos[Numero[x ]];
    For z := 1 to 5 do
    Begin
      Cod1[c1] := Digito[z];
      Inc(c1);
    End;
    Digito := Digitos[Numero[x+1]];
    For z := 1 to 5 do
    Begin
      Cod2[c2] := Digito[z];
      Inc(c2);
    End;
    Inc(x,2);
  End;
  y := 5;
  Codigo[1] := '0';
  Codigo[2] := '0';
  Codigo[3] := '0';
  Codigo[4] := '0'; { Inicio do Codigo }
  For x := 1 to c1-1 do
  begin
    Codigo[y] := Cod1[x]; Inc(y);
    Codigo[y] := Cod2[x]; Inc(y);
  end;
  Codigo[y] := '1'; Inc(y); { Final do Codigo }
  Codigo[y] := '0'; Inc(y);
  Codigo[y] := '0';
  Imagem.Pen .Width := 1;
  Imagem.Brush.Color := ClWhite;
  Imagem.Pen .Color := ClWhite;
  a.x := 1; a.y := 0;
  b.x := 1; b.y := 79;
  c.x := 2000; c.y := 79;
  d.x := 2000; d.y := 0;
  Imagem.Polygon([a,b,c,d]);
  Imagem.Brush.Color := ClBlack;
  Imagem.Pen .Color := ClBlack;
  x := 0;
  i := True;
  for y:=1 to 1000 do
  begin
    If Codigo[y] <> #0 Then
    Begin
      If Codigo[y] = '0' then
        h := 1
      Else
        h := 3;
      a.x := x; a.y := 0;
      b.x := x; b.y := 79;
      c.x := x+h-1; c.y := 79;
      d.x := x+h-1; d.y := 0;
      If i Then
        Imagem.Polygon([a,b,c,d]);
      i := Not(i);
      x := x + h;
    End;
  end;
end;


procedure Tfrm_produto.dbedtCODIGO_BARRAExit(Sender: TObject);
begin
 CriaCodigo(dbedtcodigo.text,img1.Canvas);
end;

procedure Tfrm_produto.ds1StateChange(Sender: TObject);
begin
btnnovo.Enabled:=ds1.State in [dsBrowse];
btnsalva.Enabled:=ds1.State in [dsinsert,dsedit];
btnapaga.Enabled:=ds1.State in [dsbrowse];
btncancela.Enabled:=ds1.State in [dsinsert,dsedit];
btnaltera.Enabled:=ds1.State in [dsbrowse];

btnsair.Enabled:=ds1.State in [dsBrowse];
end;

procedure Tfrm_produto.edt1Change(Sender: TObject);
begin
with dm.QRY_produto do
    begin
    if rg2.ItemIndex = 0 then
    begin
      dm.QRY_produto.Close;
      dm.QRY_produto.SQL.Clear;
      dm.QRY_produto.SQL.Add('select * from tb_produto');
      dm.QRY_produto.Open;
    end;
      if rg2.ItemIndex = 1 then
    begin
      dm.QRY_produto.Close;
      dm.QRY_produto.SQL.Clear;
      dm.QRY_produto.SQL.Add('select * from tb_produto where descricao LIKE '+QuotedStr(edt1.Text+'%'));
      dm.QRY_produto.Open;
    end;
      if rg2.ItemIndex = 2 then
    begin
      dm.QRY_produto.Close;
      dm.QRY_produto.SQL.Clear;
      dm.QRY_produto.SQL.Add('select * from tb_produto where CODIGO LIKE '+QuotedStr(edt1.Text+'%'));
      dm.QRY_produto.Open;

end;
    end;
end;

procedure Tfrm_produto.FormShow(Sender: TObject);
begin
  dm.QRY_produto.Active:=True;
  CriaCodigo(dbedtcodigo.text,img1.Canvas);



end;

procedure Tfrm_produto.rg2Click(Sender: TObject);
begin
   if rg2.ItemIndex = 0 then
   begin
   edt1.Clear;
   edt1.SetFocus;
   end;

   if rg2.ItemIndex = 1 then
   begin
   edt1.Clear;
   edt1.Width:=300;
   edt1.SetFocus;

   end;

   if rg2.ItemIndex = 2 then
   begin
   edt1.Clear;
   edt1.Width:=100;
   edt1.SetFocus;

   end;

end;

end.
