unit U_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls,
   Vcl.StdCtrls, dxGDIPlusClasses;

type
  Tfrm_principal = class(TForm)
    pnl3: TPanel;
    stat1: TStatusBar;
    pnl1: TPanel;
    tmr1: TTimer;
    img1: TImage;
    pnlcentral: TPanel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    btn3: TBitBtn;
    btn4: TBitBtn;
    btn5: TBitBtn;
    btn6: TBitBtn;
    btn7: TBitBtn;
    btn8: TBitBtn;
    pnl2: TPanel;
    pnl4: TPanel;
    lbl1: TLabel;
    img2: TImage;
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_principal: Tfrm_principal;

implementation

uses

 U_clientes, U_PDV, U_produtos, U_VendaInterna, U_BuscaProd;

{$R *.dfm}

procedure Tfrm_principal.btn1Click(Sender: TObject);
begin
Close;
end;

procedure Tfrm_principal.btn2Click(Sender: TObject);
begin
    Application.CreateForm(TFrm_pessoa,frm_pessoa);
    try
    Frm_pessoa.ShowModal;
    finally
      FreeAndNil(Frm_pessoa);
    end;
end;

procedure Tfrm_principal.btn3Click(Sender: TObject);
begin
    Application.CreateForm(Tfrm_produto,frm_produto);
    try
      frm_produto.ShowModal;
    finally
    FreeAndNil(frm_produto);

    end;
end;

procedure Tfrm_principal.btn5Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_buscaprod,frm_buscaprod);
  try
    frm_buscaprod.ShowModal;
  finally
  FreeAndNil(frm_buscaprod);

  end;
end;

procedure Tfrm_principal.btn6Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_vendainterna,frm_vendainterna);
  try
    frm_vendainterna.ShowModal;
  finally
   FreeAndNil(frm_vendainterna);

  end;
end;

procedure Tfrm_principal.btn7Click(Sender: TObject);
begin
   Application.CreateForm(TFrm_pdv,Frm_pdv);
   try
     Frm_pdv.ShowModal;
   finally
   FreeAndNil(Frm_pdv);

   end;
end;

procedure Tfrm_principal.btn8Click(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente sair do Sistema?',
    'Sair do Sistema', MB_OKCANCEL + MB_ICONQUESTION) = IDOK then
  begin
    Application.Terminate;
  end;

end;

procedure Tfrm_principal.FormCreate(Sender: TObject);
begin
    WindowState:=wsMaximized;
    tmr1.Enabled:=True;
    lbl1.Caption:=FormatDateTime('dddddd',date);
end;

procedure Tfrm_principal.FormResize(Sender: TObject);
begin
   pnlcentral.left := trunc((frm_principal.width - pnlcentral.width) / 2); pnlcentral.top := trunc((frm_principal.height - pnlcentral.height) / 2);

end;

end.
