unit TUnit;

interface

uses
  Controls, Graphics, SysUtils, Classes;

type
  TLehrgang = record
    Aktiv : Boolean;
    LGvon  : TDate;
    LGbis  : TDate;
    LGname : String[32];
  End;
  TSoldat = record
    PK1     : String[6];
    PK2     : String[1];
    PK3     : string[5];
    Name    : String[64];
    Vorname : String[64];
    DG      : String[5];
    Zug     : String[3];
    WBV     : Byte;
    Weiblich : Boolean;
    Zusatz   : String[2];


    TrANr  : String[7];

    Status : Byte;
    DZE    : TDate;
    LG     : Array[1..4] of TLehrgang;

    Adresse1 : String[64];
    Adresse2 : String[64];
    PLZ      : String[5];
    Ort      : String[64];
    Tel1, Tel2,
    Tel3     : String[16];

    Mark : Boolean;
    MarkCol : TColor;

    Bemerk : String[255];

    Archiv  : Boolean;

    Geburtstag : TDate;
    AutoKZ  : String[16];
    AutoArt : String[32];
  end;


  TMyFilter = record
    Text  : String;
    FOn   : Boolean;
  End;  
  TMyTimeFilter = record
    Date  : TDate;
    Date2 : TDate;
    Compare : Byte;   {0 aus; 1 davor; 2 am; 3 danach; 4 zwischen}
  End;
  TMyAnyFilter = record
    FOn : Boolean;
  End;
  TMyTable = record
    Text  : String[32];
    Order : Integer;
    TOn   : Boolean;
  End;
          
const
  FILENAME = 'Soldiers.dat';
  TABLEMAX = 25;
  SETINIFILE = 'settings.ini';
  COLFILE = 'ColMark.dat';
  States   : Array[0..3] of String = ('GWDL', 'FWDL', 'SaZ', 'BS');

Var
  ALLTABLENAME  : TStringList;
{    ('Name', 'Vorname', 'Dienstgrad', 'Zug', 'PK', 'DZE', 'Geschlecht',
    'Ort', 'PLZ', 'Adresse 1', 'Adresse 2',
    'Status', 'Truppenausweis', 'Dienstgrad Zusatz','Archiv',
    'Telefon 1', 'Telefon 2', 'Telefon 3', 'Bemerkungen',
    'Lehrgang Anfang', 'Lehrgang Ende', 'Lehrgang', 'WBV',
    'Geburtstag', 'KFZ-Kennzeichen', 'KFZ-Typ');
 }
Var
  Soldaten  : Array of TSoldat;
  AllFilter : record
    Name, Vorname, PK1, PK2, PK3, DG, Zug, Ort, Status, LG, Mark, DZ : TMyFilter;
    LGa, LGb, DZE, Geb : TMyTimeFilter;
    AnyLG : TMyAnyFilter;
  End;

  AllTable : Array[0..TABLEMAX] of TMyTable;

              
Function FindStat(Status : String): Byte;

implementation


Function FindStat(Status : String): Byte;
Var
  I : Integer;
Begin
  Result := 0;
  For I:= 0 to 3 do
   If Trim(Status) = UpperCase(States[I]) then Result := I;
End;

end.
 