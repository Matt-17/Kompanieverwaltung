unit Adr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TAdr_Form = class(TForm)
    EdAdr1: TEdit;
    EdAdr2: TEdit;
    EdPLZ: TEdit;
    EdOrt: TEdit;
    EdAdr3: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    AddrEd: TEdit;
    Label1: TLabel;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Adr_Form: TAdr_Form;

implementation

{$R *.dfm}

end.
