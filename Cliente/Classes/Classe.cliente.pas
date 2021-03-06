unit Classe.cliente;

interface

uses
System.DateUtils;

type
  Tcliente =class
    private
    Fcodigo :Integer;
    Fnome:string;
    Fcidade:string;
    Fuf:string;
    function getnome: string;
    procedure setnome(const Value: string);

    procedure salvardados;

       public
       property codigo: Integer read Fcodigo write Fcodigo;
       property nome: string read getnome write setnome;
       property cidade :string read Fcidade write Fcidade;
       property uf: string read Fuf write Fuf;

       constructor create;
       destructor destroy; override;
  end;

implementation

uses
  Vcl.Dialogs;

{ Tclieente }

constructor Tcliente.create;
begin
   inherited create;
end;

destructor Tcliente.destroy;
begin

  inherited;
end;

function Tcliente.getnome: string;
begin
    Result:= Fnome;
end;

procedure Tcliente.salvardados;
begin
   //
end;

procedure Tcliente.setnome(const Value: string);
begin
   if Value ='' then
   showmessage('opcao nao pode ser vazio');
    Fnome:=Value;
end;

end.
