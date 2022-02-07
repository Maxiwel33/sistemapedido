program ClienteDW;

uses
  Vcl.Forms,
  U_Principal in 'U_Principal.pas' {frm_principal},
  UDM in 'UDM.pas' {DM: TDataModule},
  U_clientes in 'U_clientes.pas' {Frm_pessoa},
  U_PDV in 'U_PDV.pas' {Frm_pdv},
  U_BuscaProd in 'U_BuscaProd.pas' {frm_buscaprod},
  U_produtos in 'U_produtos.pas' {frm_produto},
  funformatartexto in 'funformatartexto.pas',
  U_AbrirPDV in 'U_AbrirPDV.pas' {frm_pdvcaixa},
  U_VendaInterna in 'U_VendaInterna.pas' {frm_vendainterna},
  Classe.cliente in 'Classes\Classe.cliente.pas',
  U_localcliente in 'U_localcliente.pas' {frm_localclie},
  UBuscaProdPedido in 'UBuscaProdPedido.pas' {frm_buscaProdpedido};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_principal, frm_principal);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
