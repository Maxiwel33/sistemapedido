unit U_AbrirPDV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  Tfrm_pdvcaixa = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    edtcodcliente: TEdit;
    edtcliente: TEdit;
    edtcaixa: TEdit;
    edt_funciona: TEdit;
    btn1: TSpeedButton;
    lbl1: TLabel;
    lbl2: TLabel;
    pnl3: TPanel;
    dbgrd1: TDBGrid;
    dspassoa: TDataSource;
    edt1: TEdit;
    procedure edtcodclienteKeyPress(Sender: TObject; var Key: Char);
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edt1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_pdvcaixa: Tfrm_pdvcaixa;

implementation

uses
  UDM, U_PDV;

{$R *.dfm}

procedure Tfrm_pdvcaixa.btn1Click(Sender: TObject);
begin
   frm_pdvcaixa.Height:=460;
end;

procedure Tfrm_pdvcaixa.edt1Change(Sender: TObject);
begin
  //  DM.DWSQL_PESSOA.Filtered:=False;
  //  DM.DWSQL_PESSOA.Filter:='NOME LIKE'+QuotedStr(edt1.Text+'%');
  //  DM.DWSQL_PESSOA.Filtered:=True;
end;

procedure Tfrm_pdvcaixa.edtcodclienteKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then
begin
if not dm.QRY_cliente.Locate('ID',edtcodcliente.Text,[]) then
begin
ShowMessage('cliente nao localizado') ;
edtcodcliente.SetFocus;
exit
end else
edtcliente.Text:=dm.QRY_cliente.FieldByName('nome').AsString;
edtcaixa.SetFocus;
end;
end;

procedure Tfrm_pdvcaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 dm.QRY_cliente.Active:=false;
end;

procedure Tfrm_pdvcaixa.FormShow(Sender: TObject);
begin
    dm.QRY_pedido.Active:=True;
   dm.QRY_cliente.Active:=True;
    edtcodcliente.SetFocus;
end;

end.
