program KpListe;

uses
  Forms,
  Main in 'Main.pas' {01 Hauptfenster},
  New in 'New.pas' {03 Neu},
  Edit in 'Edit.pas' {04 Editieren},
  Import in 'Import.pas' {02 Import},
  TUnit in 'TUnit.pas',
  Filter in 'Filter.pas' {05 Filter},
  Tabelle in 'Tabelle.pas' {06 Tabelle},
  Statistik in 'Statistik.pas' {09 Statistik},
  Adr in 'Adr.pas' {Adr_Form},
  Info in 'Info.pas' {Info_Frm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmMainList, FrmMainList);
  Application.CreateForm(TFrmNew, FrmNew);
  Application.CreateForm(TFrmEdit, FrmEdit);
  Application.CreateForm(TFrmImport, FrmImport);
  Application.CreateForm(TFrm_Filter, Frm_Filter);
  Application.CreateForm(TFrm_Table, Frm_Table);
  Application.CreateForm(TFrm_Stat, Frm_Stat);
  Application.CreateForm(TAdr_Form, Adr_Form);
  Application.CreateForm(TInfo_Frm, Info_Frm);
  Application.Run;
end.
