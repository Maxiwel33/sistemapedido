unit U_localcliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls;

type
  Tfrm_localclie = class(TForm)
    pnl1: TPanel;
    dbgrd1: TDBGrid;
    edt1: TEdit;
    lbl1: TLabel;
    Ds1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edt1Change(Sender: TObject);
    procedure edt1KeyPress(Sender: TObject; var Key: Char);
    procedure dbgrd1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_localclie: Tfrm_localclie;

implementation

uses
  UDM, U_VendaInterna;

{$R *.dfm}

procedure Tfrm_localclie.dbgrd1KeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13then
    begin
      frm_vendainterna.edt_codcli.Text:=dm.QRY_cliente.FieldByName('codigo').AsString;
      frm_vendainterna.edt_cliente.Text:=DM.QRY_cliente.FieldByName('nome').AsString;
      Close;
    end;
end;

procedure Tfrm_localclie.edt1Change(Sender: TObject);
begin
   with dm.QRY_cliente do
   begin
     Close;
     SQL.Clear;
     sql.Add('select * from tb_cliente where nome like '+QuotedStr(edt1.Text+'%'));
     Open;
   end;
end;

procedure Tfrm_localclie.edt1KeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then
     dbgrd1.SetFocus;
end;

procedure Tfrm_localclie.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key=VK_F3 then
   begin
   with DM.QRY_cliente do
   begin
     Close;
     sql.Clear;
     sql.Add('select * from tb_cliente');
     open;
   end;
    frm_localclie.Close;
   end;
end;

procedure Tfrm_localclie.FormShow(Sender: TObject);
begin
   dm.QRY_cliente.Active:=True;
   edt1.SetFocus;
end;

end.
