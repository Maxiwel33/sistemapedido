unit U_clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls, Data.DB, Vcl.Buttons, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids,funformatartexto;

type
  TFrm_pessoa = class(TForm)
    pnl1: TPanel;
    pgc1: TPageControl;
    ts_cadastro: TTabSheet;
    ts_busca: TTabSheet;
    pnl2: TPanel;
    btnnovo: TSpeedButton;
    btnaltera: TSpeedButton;
    btnapaga: TSpeedButton;
    btncancela: TSpeedButton;
    btnsalva: TSpeedButton;
    btnsair: TSpeedButton;
    ds1: TDataSource;
    lbl1: TLabel;
    dbedtID: TDBEdit;
    lbl2: TLabel;
    dbedtNOME: TDBEdit;
    lbl9: TLabel;
    dbedtCIDADE: TDBEdit;
    lbl10: TLabel;
    dbedtCEP: TDBEdit;
    pnl3: TPanel;
    btn7: TSpeedButton;
    edt1: TEdit;
    lbl14: TLabel;
    dbgrd1: TDBGrid;
    btn2: TSpeedButton;
    procedure btnsairClick(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure ds1StateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btncancelaClick(Sender: TObject);
    procedure btnalteraClick(Sender: TObject);
    procedure btnnovoClick(Sender: TObject);
    procedure btnsalvaClick(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure edt1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public


    { Public declarations }
  end;

var
  Frm_pessoa: TFrm_pessoa;

implementation

uses
   UDM, Classe.cliente;

{$R *.dfm}

procedure TFrm_pessoa.btnalteraClick(Sender: TObject);
begin
DM.QRY_cliente.Edit;
end;

procedure TFrm_pessoa.btncancelaClick(Sender: TObject);
begin
DM.QRY_cliente.Cancel;
end;

procedure TFrm_pessoa.btnnovoClick(Sender: TObject);
begin
DM.QRY_cliente.Insert;
end;

procedure TFrm_pessoa.btnsairClick(Sender: TObject);
begin
Close;
end;

procedure TFrm_pessoa.btnsalvaClick(Sender: TObject);
begin
DM.QRY_cliente.Post;

end;

procedure TFrm_pessoa.btn3Click(Sender: TObject);
begin
   dm.QRY_cliente.Insert;
   dbedtNOME.SetFocus;
end;

procedure TFrm_pessoa.btn7Click(Sender: TObject);
begin
     if pgc1.ActivePage =ts_busca then
     pgc1.ActivePage:=ts_cadastro
     else
     pgc1.ActivePage:=ts_busca;

end;

procedure TFrm_pessoa.ds1StateChange(Sender: TObject);
begin
btnnovo.Enabled:=ds1.State in [dsBrowse];
btnsalva.Enabled:=ds1.State in [dsinsert,dsedit];
btnapaga.Enabled:=ds1.State in [dsbrowse];
btncancela.Enabled:=ds1.State in [dsinsert,dsedit];
btnaltera.Enabled:=ds1.State in [dsbrowse];

btnsair.Enabled:=ds1.State in [dsBrowse];

end;

procedure TFrm_pessoa.edt1Change(Sender: TObject);
begin
    with dm.QRY_cliente do
    begin
      close;
      sql.Clear;
      sql.Add('select * from tb_cliente where nome like'+ QuotedStr(edt1.Text+'%'));
      Open;

    end;
end;

procedure TFrm_pessoa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.QRY_cliente.Close;
end;

procedure TFrm_pessoa.FormShow(Sender: TObject);
begin
DM.QRY_cliente.Active:=True;
pgc1.ActivePage:=ts_cadastro;
end;

end.
