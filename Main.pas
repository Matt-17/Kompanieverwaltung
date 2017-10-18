unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Mask, ComCtrls, DB, ADODB, ExtCtrls, DBGrids,
  Buttons, Menus, Printers, IniFiles;

type
  TFrmMainList = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    LblName: TLabel;
    LblPK: TLabel;
    LblTA: TLabel;
    LblWBV: TLabel;
    LblDG: TLabel;
    LblShowName: TLabel;
    LblShowDG: TLabel;
    LblShowPK: TLabel;
    LblShowTA: TLabel;
    LblShowWBV: TLabel;
    MainMenu1: TMainMenu;
    Datei1: TMenuItem;
    Info1: TMenuItem;
    Info2: TMenuItem;
    Bearbeiten1: TMenuItem;
    N1: TMenuItem;
    Beenden1: TMenuItem;
    Hinzufgen1: TMenuItem;
    Lschen1: TMenuItem;
    Bearbeiten2: TMenuItem;
    Extras1: TMenuItem;
    StatBar: TStatusBar;
    N3: TMenuItem;
    Filter1: TMenuItem;
    abelleanpassen1: TMenuItem;
    Filteraufheben1: TMenuItem;
    N4: TMenuItem;
    Statistik1: TMenuItem;
    EditSrch: TEdit;
    PopupMenu1: TPopupMenu;
    Alterextrahieren1: TMenuItem;
    VergangeneLehrgngelschen1: TMenuItem;
    Listeausdrucken1: TMenuItem;
    TabCtrl: TTabControl;
    SdtList: TStringGrid;
    PrintDialog1: TPrintDialog;
    CountLbl: TLabel;
    N7: TMenuItem;
    Adressekopieren1: TMenuItem;
    N9: TMenuItem;
    Adressekopieren2: TMenuItem;
    WerhatheuteGeburtstag1: TMenuItem;
    Timer1: TTimer;
    Speichern1: TMenuItem;
    N2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SdtListMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SdtListSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SdtListDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SdtListDblClick(Sender: TObject);
    procedure Umschlge1Click(Sender: TObject);
    procedure Bearbeiten2Click(Sender: TObject);
    procedure Hinzufgen1Click(Sender: TObject);
    procedure Beenden1Click(Sender: TObject);
    procedure Lschen1Click(Sender: TObject);
    procedure Filter1Click(Sender: TObject);
    procedure Filteraufheben1Click(Sender: TObject);
    procedure Statistik1Click(Sender: TObject);
    procedure EditSrchChange(Sender: TObject);
    procedure EditSrchEnter(Sender: TObject);
    procedure EditSrchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure abelleanpassen1Click(Sender: TObject);
    procedure Alterextrahieren1Click(Sender: TObject);
    procedure VergangeneLehrgngelschen1Click(Sender: TObject);
    procedure Listeausdrucken1Click(Sender: TObject);
    procedure TabCtrlChange(Sender: TObject);
    procedure Adressekopieren1Click(Sender: TObject);
    procedure WerhatheuteGeburtstag1Click(Sender: TObject);
    procedure Info2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Speichern1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    Procedure ShowListe;
    Procedure OpenListe;
    Procedure SortListe(Selection : Integer);
    Procedure ShowShort(SdtPosS : String);
    Procedure EditSoldat;

    Procedure LoadSet;
    Procedure SaveSet;
  end;


var
  FrmMainList   : TFrmMainList;
  DStGrd, ZugSL, DZL : TStringList;
  AX, AY        : Integer;
  OldSelection  : Integer;
  DirSelection  : Boolean;

implementation

uses New, Edit, Import, Umschlag, TUnit, Filter, Statistik, Math, Tabelle,
  StrUtils, DateUtils, ClipBrd, Info;

{$R *.dfm}

Procedure TFrmMainList.EditSoldat;
Begin
  If SdtList.Cells[0, SdtList.Selection.Top] <> '' then
  Begin
    FrmEdit.LoadSoldat(StrToInt(SdtList.Cells[0, SdtList.Selection.Top]));
    If FrmEdit.ShowModal = mrOk then
    Begin
      ShowListe;
      ShowShort(SdtList.Cells[0, SdtList.Selection.Top]);
    End;
  End;
End;


Procedure TFrmMainList.LoadSet;
var
  I : Integer;
Begin
  With TIniFile.Create(ExtractFilePath(Application.ExeName)+SETINIFILE) do
  Begin
    Top := ReadInteger('VISUAL', 'Top', Top);
    Left := ReadInteger('VISUAL', 'Left', Left);
    Width := ReadInteger('VISUAL', 'Width', Width);
    Height := ReadInteger('VISUAL', 'Height', Height);
    WindowState := TWindowState(ReadInteger('VISUAL', 'State', Integer(WindowState)));

    For I := 0 to TABLEMAX do
    Begin
      AllTable[I].TOn := ReadBool('TABLES', 'TB'+IntToStr(I), False);
      AllTable[I].Order := ReadInteger('TABLES', 'TI'+IntToStr(I), 0);
    End;
  End;
End;

Procedure TFrmMainList.SaveSet;
var
  TWS : TWindowState;
  I : Integer;
Begin
  With TIniFile.Create(ExtractFilePath(Application.ExeName)+SETINIFILE) do
  Begin
    TWS := WindowState;
    WindowState := wsNormal;
    WriteInteger('VISUAL', 'Top', Top);
    WriteInteger('VISUAL', 'Left', Left);
    WriteInteger('VISUAL', 'Width', Width);
    WriteInteger('VISUAL', 'Height', Height);
    WindowState := TWS;
    WriteInteger('VISUAL', 'State', Integer(WindowState));

    For I := 0 to TABLEMAX do
    Begin
      WriteBool('TABLES', 'TB'+IntToStr(I), AllTable[I].TOn);
      WriteInteger('TABLES', 'TI'+IntToStr(I), AllTable[I].Order);
    End;
  End;
End;

Procedure TFrmMainList.ShowShort(SdtPosS : String);
Var
  SdtPos : Integer;
Begin
  Try
    SdtPos := StrToInt(SdtPosS);  
    LblShowName.Caption := Soldaten[SdtPos].Name+', '+Soldaten[SdtPos].Vorname;
    StatBar.Panels[0].Text := ZugSL.Values[Soldaten[SdtPos].Zug];
    LblShowDG.Caption := DstGrd.Values[Soldaten[SdtPos].DG];
    LblShowPK.Caption := Soldaten[SdtPos].PK1+'-'+
                       Soldaten[SdtPos].PK2+'-'+
                       Soldaten[SdtPos].PK3;
    LblShowTA.Caption := Soldaten[SdtPos].TrANr;
    LblShowWBV.Caption := WBVList[Soldaten[SdtPos].WBV];
    LblShowWBV.Hint := WBVList[Soldaten[SdtPos].WBV];

    If Soldaten[SdtPos].LG[1].LGname <> '' then
    StatBar.Panels[1].Text := DateToStr(Soldaten[SdtPos].LG[1].LGvon)+' - '+
                      DateToStr(Soldaten[SdtPos].LG[1].LGbis) else
    StatBar.Panels[1].Text := '';
    StatBar.Panels[2].Text := Soldaten[SdtPos].LG[1].LGname;
  Except 
    LblShowName.Caption := '';
    StatBar.Panels[0].Text := '';
    LblShowDG.Caption := '';
    LblShowPK.Caption := '';
    LblShowTA.Caption := '';
    LblShowWBV.Caption := '';
    LblShowWBV.Hint := '';

    StatBar.Panels[1].Text := '';
    StatBar.Panels[2].Text := '';
  End;
End;


Function InList(Nr : Integer) : Boolean;
Var
  CheckLGaTime, 
  CheckLGbTime,
  CheckDZETime,
  CheckGebTime : Boolean;
Function CheckTime(ChKind : Integer; B : Boolean; DC1, DC2, D1 : TDate) : Boolean;
Begin
  Result := False; 
  Case ChKind of
    0 : Result := True;
    1 : If (B and (D1 < DC1))then Result := True;
    2 : If (B and (DaysBetween(D1, DC1)=0)) then Result := True;
    3 : If (B and (D1 > DC1)) then Result := True;
    4 : If (B and ((D1 > DC1) and (D1 < DC2)))then Result := True;
  End;
End;
Begin
  CheckLGaTime := CheckTime(AllFilter.LGa.Compare, Soldaten[Nr].LG[1].Aktiv, AllFilter.LGa.Date,
                            AllFilter.LGa.Date2, Soldaten[Nr].LG[1].LGvon) or
                  CheckTime(AllFilter.LGa.Compare, Soldaten[Nr].LG[2].Aktiv, AllFilter.LGa.Date,
                            AllFilter.LGa.Date2, Soldaten[Nr].LG[2].LGvon) or
                  CheckTime(AllFilter.LGa.Compare, Soldaten[Nr].LG[3].Aktiv, AllFilter.LGa.Date,
                            AllFilter.LGa.Date2, Soldaten[Nr].LG[3].LGvon) or
                  CheckTime(AllFilter.LGa.Compare, Soldaten[Nr].LG[4].Aktiv, AllFilter.LGa.Date,
                            AllFilter.LGa.Date2, Soldaten[Nr].LG[4].LGvon);

  CheckLGbTime := CheckTime(AllFilter.LGb.Compare, Soldaten[Nr].LG[1].Aktiv, AllFilter.LGb.Date,
                            AllFilter.LGb.Date2, Soldaten[Nr].LG[1].LGbis) or
                  CheckTime(AllFilter.LGb.Compare, Soldaten[Nr].LG[2].Aktiv, AllFilter.LGb.Date,
                            AllFilter.LGb.Date2, Soldaten[Nr].LG[2].LGbis) or
                  CheckTime(AllFilter.LGb.Compare, Soldaten[Nr].LG[3].Aktiv, AllFilter.LGb.Date,
                            AllFilter.LGb.Date2, Soldaten[Nr].LG[3].LGbis) or
                  CheckTime(AllFilter.LGb.Compare, Soldaten[Nr].LG[4].Aktiv, AllFilter.LGb.Date,
                            AllFilter.LGb.Date2, Soldaten[Nr].LG[4].LGbis);

  CheckDZETime := CheckTime(AllFilter.DZE.Compare, True, AllFilter.DZE.Date,
                            AllFilter.DZE.Date2, Soldaten[Nr].DZE);
  CheckGebTime := CheckTime(AllFilter.Geb.Compare, True, AllFilter.Geb.Date,
                            AllFilter.Geb.Date2, Soldaten[Nr].Geburtstag);


  Result := False;
  If ((Pos(AllFilter.Name.Text, UpperCase(Soldaten[Nr].Name)) > 0) or not AllFilter.Name.FOn) and      
     ((Pos(AllFilter.Vorname.Text, UpperCase(Soldaten[Nr].Vorname)) > 0) or not AllFilter.Vorname.FOn) and
     ((Pos(AllFilter.PK1.Text, UpperCase(Soldaten[Nr].PK1)) > 0) or not AllFilter.PK1.FOn) and
     ((Pos(AllFilter.PK2.Text, UpperCase(Soldaten[Nr].PK2)) > 0) or not AllFilter.PK2.FOn) and
     ((Pos(AllFilter.PK3.Text, UpperCase(Soldaten[Nr].PK3)) > 0) or not AllFilter.PK3.FOn) and
     ((Pos(AllFilter.DG.Text, UpperCase(Soldaten[Nr].DG)) > 0) or not AllFilter.DG.FOn) and
     ((Pos(AllFilter.Zug.Text, UpperCase(Soldaten[Nr].Zug)) > 0) or not AllFilter.Zug.FOn) and
     (((Trim(AllFilter.DZ.Text) = '-') and (Trim(Soldaten[Nr].Zusatz)='')) or
     (Pos(AllFilter.DZ.Text, UpperCase(Soldaten[Nr].Zusatz)) > 0) or not AllFilter.DZ.FOn) and
     ((FindStat(AllFilter.Status.Text) = Soldaten[Nr].Status) or not AllFilter.Status.FOn) and
     (((AllFilter.Mark.Text = IntToStr(Soldaten[Nr].MarkCol)) and Soldaten[Nr].Mark) or not AllFilter.Mark.FOn) and
     (((Pos(AllFilter.LG.Text, UpperCase(Soldaten[Nr].LG[1].LGname)) > 0) or not AllFilter.LG.FOn) or
     ((Pos(AllFilter.LG.Text, UpperCase(Soldaten[Nr].LG[2].LGname)) > 0) or not AllFilter.LG.FOn) or
     ((Pos(AllFilter.LG.Text, UpperCase(Soldaten[Nr].LG[3].LGname)) > 0) or not AllFilter.LG.FOn) or
     ((Pos(AllFilter.LG.Text, UpperCase(Soldaten[Nr].LG[4].LGname)) > 0) or not AllFilter.LG.FOn)) and
     ((AllFilter.AnyLG.FOn and (Soldaten[Nr].LG[1].Aktiv or Soldaten[Nr].LG[2].Aktiv or
                           Soldaten[Nr].LG[3].Aktiv or Soldaten[Nr].LG[4].Aktiv))
                           or not AllFilter.AnyLG.FOn) and
     (((Soldaten[Nr].Archiv = False) and (FrmMainList.TabCtrl.TabIndex=0)) or
      ((Soldaten[Nr].Archiv = True) and (FrmMainList.TabCtrl.TabIndex=1))) and
      CheckLGaTime and CheckLGbTime and CheckDZETime and CheckGebTime
    then Result := True;
End;

Procedure TFrmMainList.ShowListe;
Var
  I, J, K, Zeilen : Integer;
  S : TGridRect;
  T : Integer;

begin
  S := SdtList.Selection;
  T := SdtList.TopRow;
  I := 1;
  Begin
    For J := 0 to TABLEMAX do If AllTable[J].TOn then Inc(I);
    SdtList.ColCount := I;       
    For J := 0 to TABLEMAX do If AllTable[J].TOn then
      SdtList.Cells[AllTable[J].Order, 0] := AllTable[J].Text;
  End;

  Zeilen := 1;
  For I := 0 to Length(Soldaten)-1 do
  If InList(I) then
   Inc(Zeilen);

  SdtList.RowCount := Zeilen;
  CountLbl.Caption := 'Anzahl: '+IntToStr(Zeilen-1);
  If SdtList.RowCount = 1 then SdtList.RowCount := 2;
  SdtList.Rows[Zeilen].Clear;
  K := 1;
  For I := 0 to Length(Soldaten)-1 do
  With SdtList do
  If InList(I) then
  begin
    SdtList.Rows[K].Clear;
    Cells[0, K] := IntToStr(I);
                                                                                    
    If AllTable[0].TOn then Cells[AllTable[0].Order, K] := Soldaten[I].Name;
    If AllTable[1].TOn then Cells[AllTable[1].Order, K] := Soldaten[I].Vorname;
    If AllTable[2].TOn then Cells[AllTable[2].Order, K] := DstGrd.Values[Soldaten[I].DG];
    If AllTable[3].TOn then Cells[AllTable[3].Order, K] := ZugSL.Values[Soldaten[I].Zug];
    If AllTable[4].TOn then Cells[AllTable[4].Order, K] := Soldaten[I].PK1+'-'+
                                                           Soldaten[I].PK2+'-'+
                                                           Soldaten[I].PK3;
    If AllTable[5].TOn then Cells[AllTable[5].Order, K] := DateToStr(Soldaten[I].DZE);
    If AllTable[6].TOn then Cells[AllTable[6].Order, K] := IfThen(Soldaten[I].Weiblich, 'W', 'M');
    If AllTable[7].TOn then Cells[AllTable[7].Order, K] := Soldaten[I].Ort;
    If AllTable[8].TOn then Cells[AllTable[8].Order, K] := Soldaten[I].PLZ;
    If AllTable[9].TOn then Cells[AllTable[9].Order, K] := Soldaten[I].Adresse1;
    If AllTable[10].TOn then Cells[AllTable[10].Order, K] := Soldaten[I].Adresse2;
    If AllTable[11].TOn then Cells[AllTable[11].Order, K] := States[Soldaten[I].Status];
    If AllTable[12].TOn then Cells[AllTable[12].Order, K] := Soldaten[I].TrANr;
    If AllTable[13].TOn then Cells[AllTable[13].Order, K] := Soldaten[I].Zusatz;
    If AllTable[14].TOn then Cells[AllTable[14].Order, K] := IfThen(Soldaten[I].Archiv, 'O', 'X');
    If AllTable[15].TOn then Cells[AllTable[15].Order, K] := Soldaten[I].Tel1;
    If AllTable[16].TOn then Cells[AllTable[16].Order, K] := Soldaten[I].Tel2;
    If AllTable[17].TOn then Cells[AllTable[17].Order, K] := Soldaten[I].Tel3;
    If AllTable[18].TOn then Cells[AllTable[18].Order, K] := Soldaten[I].Bemerk;

    If AllTable[19].TOn then Begin
      If not Soldaten[I].LG[1].Aktiv then Cells[AllTable[19].Order, K] := '' else
        Cells[AllTable[19].Order, K] := DateToStr(Soldaten[I].LG[1].LGvon);
    End;
    If AllTable[20].TOn then Begin
      If not Soldaten[I].LG[1].Aktiv then Cells[AllTable[20].Order, K] := '' else
        Cells[AllTable[20].Order, K] := DateToStr(Soldaten[I].LG[1].LGbis);
    End;
    If AllTable[21].TOn then Cells[AllTable[21].Order, K] := Soldaten[I].LG[1].LGname;
    If AllTable[22].TOn then Cells[AllTable[22].Order, K] := Copy(WBVList[Soldaten[I].WBV], 0, Pos(Chr(13), WBVList[Soldaten[I].WBV])-1);
    If AllTable[23].TOn then Cells[AllTable[23].Order, K] := DateToStr(Soldaten[I].Geburtstag);
    If AllTable[24].TOn then Cells[AllTable[24].Order, K] := Soldaten[I].AutoKZ;
    If AllTable[25].TOn then Cells[AllTable[25].Order, K] := Soldaten[I].AutoArt;
    Inc(K);
  End;
  SdtList.FixedRows := 1;
  If T > SdtList.RowCount-1 then T := 1;
  SdtList.TopRow := T;
  If S.Top > SdtList.RowCount-1 then Begin S.Top := 1; S.Bottom := 1; end;
  S.Left := 0; S.Right := SdtList.ColCount-1;
  SdtList.Selection := S;
End;

Procedure TFrmMainList.OpenListe;
Var
  TempSdt : TSoldat;
  I : Integer;
  SdtFile       : File of TSoldat;
begin
  AssignFile(SdtFile, ExtractFilePath(Application.ExeName)+FILENAME);
  Reset(SdtFile);
  SetLength(Soldaten, 0);

  While not EOF(SdtFile) do
  Begin
    Read(SdtFile, TempSdt);
    SetLength(Soldaten, Length(Soldaten)+1);
    Soldaten[Length(Soldaten)-1] := TempSdt;
  End;
  CloseFile(SdtFile);

  If Length(Soldaten) > 0 then
  Begin
    AssignFile(SdtFile, ExtractFilePath(Application.ExeName)+'Soldiers.old');
    Rewrite(SdtFile);
    For I := 0 to Length(Soldaten)-1 do Write(SdtFile, Soldaten[I]);
    CloseFile(SdtFile);
  End;
End;

Procedure TFrmMainList.SortListe(Selection : Integer);
Var
  I, J : Integer;
Procedure Switch(A, B : Integer);
Var
  TempSdt : TSoldat;
Begin
  TempSdt := Soldaten[A];
  Soldaten[A] := Soldaten[B];
  Soldaten[B] := TempSdt;
End;
Function ChkDir(Chk : Boolean) : Boolean;
Begin
  If OldSelection <> Selection then Result := Chk else
   If DirSelection then Result := Chk else Result := not Chk;
End;
Begin
  For I := 0 to Length(Soldaten) do
   For J := I to Length(Soldaten)-1 do
   Begin
     Case Selection of                                 
       0 : If ChkDir(Soldaten[I].Name > Soldaten[J].Name) then Switch(I, J);
       1 : If ChkDir(Soldaten[I].Vorname > Soldaten[J].Vorname) then Switch(I, J);
       2 : If ChkDir(Soldaten[I].DG < Soldaten[J].DG) then Switch(I, J);
       3 : If ChkDir(Soldaten[I].Zug > Soldaten[J].Zug) then Switch(I, J);
       4 : If ChkDir(Soldaten[I].PK1 > Soldaten[J].PK1) then Switch(I, J);
       5 : If ChkDir(Soldaten[I].DZE > Soldaten[J].DZE) then Switch(I, J);
       6 : If ChkDir(Soldaten[I].Weiblich > Soldaten[J].Weiblich) then Switch(I, J);
       7 : If ChkDir(Soldaten[I].Ort > Soldaten[J].Ort) then Switch(I, J);
       8 : If ChkDir(Soldaten[I].PLZ > Soldaten[J].PLZ) then Switch(I, J);
       9 : If ChkDir(Soldaten[I].Adresse1 > Soldaten[J].Adresse1) then Switch(I, J);
       10 : If ChkDir(Soldaten[I].Adresse2 > Soldaten[J].Adresse2) then Switch(I, J);
       11 : If ChkDir(Soldaten[I].Status > Soldaten[J].Status) then Switch(I, J);
       12 : If ChkDir(Soldaten[I].TrANr > Soldaten[J].TrANr) then Switch(I, J);
       13 : If ChkDir(Soldaten[I].Zusatz > Soldaten[J].Zusatz) then Switch(I, J);
       14 : If ChkDir(Soldaten[I].Archiv > Soldaten[J].Archiv) then Switch(I, J);
       15 : If ChkDir(Soldaten[I].Tel1 > Soldaten[J].Tel1) then Switch(I, J);
       16 : If ChkDir(Soldaten[I].Tel2 > Soldaten[J].Tel2) then Switch(I, J);
       17 : If ChkDir(Soldaten[I].Tel3 > Soldaten[J].Tel3) then Switch(I, J);
       18 : If ChkDir(Soldaten[I].Bemerk > Soldaten[J].Bemerk) then Switch(I, J);
       19 : If ChkDir(Soldaten[I].LG[1].LGvon > Soldaten[J].LG[1].LGvon) then Switch(I, J);
       20 : If ChkDir(Soldaten[I].LG[1].LGbis > Soldaten[J].LG[1].LGbis) then Switch(I, J);
       21 : If ChkDir(Soldaten[I].LG[1].LGname > Soldaten[J].LG[1].LGname) then Switch(I, J);
       22 : If ChkDir(Soldaten[I].WBV > Soldaten[J].WBV) then Switch(I, J);                
       23 : If ChkDir(Soldaten[I].Geburtstag > Soldaten[J].Geburtstag) then Switch(I, J);
       24 : If ChkDir(Soldaten[I].AutoKZ > Soldaten[J].AutoKZ) then Switch(I, J);
       25 : If ChkDir(Soldaten[I].AutoArt > Soldaten[J].AutoArt) then Switch(I, J);
     End;
   End;
   If Selection = OldSelection then DirSelection := not DirSelection else DirSelection := False;
   OldSelection := Selection;
End;


procedure TFrmMainList.FormCreate(Sender: TObject);
Var
  J : Integer;
begin
  DstGrd := TStringList.Create;
  ZugSL := TStringList.Create;   
  DZL := TStringList.Create;
  ALLTABLENAME := TStringList.Create;
  DstGrd.LoadFromFile('DGR.dat');
  ZugSL.LoadFromFile('Zug.dat');   
  DZL.LoadFromFile('DGRZ.dat');
  ALLTABLENAME.LoadFromFile('Tables.dat');
  SetLength(Soldaten, 0);
  SdtList.ColWidths[0] := 10;
  OldSelection := 3;
  For J := 0 to TABLEMAX do
  Begin
    AllTable[J].Text := ALLTABLENAME[J];
    AllTable[J].TOn := False;
  End;
  AllTable[0].TOn := True;
  AllTable[0].Order := 3;
  AllTable[2].TOn := True;
  AllTable[2].Order := 2;
  AllTable[3].TOn := True;
  AllTable[3].Order := 1;
  AllTable[4].TOn := True;
  AllTable[4].Order := 4;
  AllTable[5].TOn := True;
  AllTable[5].Order := 5;
  LoadSet;
end;

procedure TFrmMainList.FormShow(Sender: TObject);
begin
  If FileExists(ExtractFilePath(Application.ExeName)+FILENAME) then
   OpenListe
  else
   FrmImport.ShowModal;
  ShowListe;
  ShowShort('0');
end;

procedure TFrmMainList.SdtListMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Var
  ARow, ACol, J : integer;
  G : TGridRect;
begin
  SdtList.MouseToCell(X, Y, ACol, ARow);
  AX := ACol;
  AY := ARow;
  If (ARow > 0) and (Button = mbRight) then Begin
    G := SdtList.Selection;
    G.Top := ARow;
    G.Bottom := ARow;
    SdtList.Selection := G;
  End;
  If (ARow = 0) and (Button = mbLeft) then Begin
    For J := 0 to TABLEMAX do If (ACol = AllTable[J].Order) and AllTable[J].TOn then
      Begin ACol := J; Break; End;
    SortListe(ACol);
    ShowListe;    
    ShowShort(SdtList.Cells[0, SdtList.Selection.Top]);
  End;
end;

procedure TFrmMainList.FormDestroy(Sender: TObject);
begin
  DstGrd.Free;
  ZugSL.Free;   
  DZL.Free;
  ALLTABLENAME.Free;
end;

procedure TFrmMainList.FormClose(Sender: TObject;
  var Action: TCloseAction);
Var
  I : Integer;
  SdtFile       : File of TSoldat;
begin
  If Length(Soldaten) > 0 then
  Begin
    OldSelection := 0;
    SortListe(2);
    SortListe(3);

    AssignFile(SdtFile, ExtractFilePath(Application.ExeName)+FILENAME);
    Rewrite(SdtFile);

    For I := 0 to Length(Soldaten)-1 do
    Begin
      Write(SdtFile, Soldaten[I]);
    End;

    CloseFile(SdtFile);
  End;
  SaveSet;
end;

procedure TFrmMainList.SdtListSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  If SdtList.Cells[0, ARow] <> '' then
    ShowShort(SdtList.Cells[0, ARow]);
end;

procedure TFrmMainList.SdtListDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
Var
  I : Integer;
begin
  With SdtList.Canvas do
  Begin
    Brush.Color := clWhite;
    Font.Color := clBlack;
    Font.Style := [];
    Font.Size := 8;
    If (ARow>0) Then
    Begin
      If not Odd(ARow) and (ACol > 0) then Brush.Color := $00E8ECEC;
      If (SdtList.Cells[0, ARow] <> '') then
      Begin
        I := StrToInt(SdtList.Cells[0, ARow]);
        If Soldaten[I].Mark and (ACol=0) then
          Brush.Color := Soldaten[I].MarkCol;
        If Soldaten[I].LG[1].Aktiv then
        Begin
          If (Soldaten[I].LG[1].LGvon < now) and
             (Soldaten[I].LG[1].LGbis > now) then
                Font.Color := clBlue else
          If (Soldaten[I].LG[1].LGvon < now + 30) and
             (Soldaten[I].LG[1].LGvon > now ) then
                Font.Color := clGreen;
        End;
        If (Soldaten[I].DZE < now + 60) and not (Soldaten[I].Archiv) then
          Font.Color := clRed;
      End;
    End else
    Begin
      Brush.Color := clGray;
      Font.Color := clWhite;
    End;
    If gdSelected in State then
    Begin
      If ACol > 0 then
      Begin
        Font.Style := Font.Style + [fsBold];
        Brush.Color := $00C8CCCC;
      End;
    End;
    If ACol > 0 then
     TextRect(Rect, Rect.Left+2, Rect.Top+2, SdtList.Cells[ACol, ARow])
     else FillRect(Rect); 
  End;
end;

procedure TFrmMainList.SdtListDblClick(Sender: TObject);
begin
  If (AY <> 0) and (AX>-1) then EditSoldat;
end;

procedure TFrmMainList.Umschlge1Click(Sender: TObject);
begin
  Frm_Umschlag.Show;
end;

procedure TFrmMainList.Bearbeiten2Click(Sender: TObject);
begin
  EditSoldat;
end;

procedure TFrmMainList.Hinzufgen1Click(Sender: TObject);
begin
  If FrmNew.ShowModal = mrOK then ShowListe;
  ShowShort(SdtList.Cells[0, SdtList.Selection.Top]);
end;

procedure TFrmMainList.Beenden1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMainList.Lschen1Click(Sender: TObject);
begin     
  If SdtList.Cells[0, SdtList.Selection.Top] <> '' then
   If MessageDlg('Wollen Sie den Soldaten wirklich löschen?',
                 mtConfirmation, [mbYes, mbNo], 0)=mrYes then
  Begin
    Soldaten[StrToInt(SdtList.Cells[0, SdtList.Selection.Top])].Archiv := True;
    ShowListe;
    ShowShort(SdtList.Cells[0, SdtList.Selection.Top]);
  End;
end;

procedure TFrmMainList.Filter1Click(Sender: TObject);
begin
  If Frm_Filter.ShowModal=mrOk then ShowListe;
  If AllFilter.Name.FOn then EditSrch.Text := AllFilter.Name.Text else
    EditSrch.Text := '';
  SdtList.TopRow := 1; 
  ShowShort(SdtList.Cells[0, SdtList.Selection.Top]);
end;

procedure TFrmMainList.Filteraufheben1Click(Sender: TObject);
begin
  With AllFilter do
  Begin
    Name.FOn := False;
    Vorname.FOn := False;
    PK1.FOn := False;
    PK2.FOn := False;
    PK3.FOn := False;
    DG.FOn := False;
    Zug.FOn := False;
    DZ.FOn := False;
    Ort.FOn := False;
    Status.FOn := False;
    Mark.FOn := False;
    Name.Text := '';
    LG.FOn := False;
    AnyLG.FOn := False;

    LGa.Compare := 0;
    LGb.Compare := 0;
    DZE.Compare := 0;
    Geb.Compare := 0;
  End;
  EditSrch.Text := '';
  ShowListe;  
  ShowShort(SdtList.Cells[0, SdtList.Selection.Top]);
end;

procedure TFrmMainList.Statistik1Click(Sender: TObject);
begin
  Frm_Stat.Show;
end;


procedure TFrmMainList.EditSrchChange(Sender: TObject);
Var
  GR : TGridRect;
begin
  AllFilter.Name.Text := UpperCase(EditSrch.Text);
  AllFilter.Name.FOn := AllFilter.Name.Text <> '';

  SdtList.TopRow := 1;
  GR := SdtList.Selection;
  GR.Top := 1;
  GR.Bottom := 1;
  SdtList.Selection := GR;
  ShowListe;
  If SdtList.Cells[0, SdtList.Selection.Top] <> '' then
    ShowShort(SdtList.Cells[0, SdtList.Selection.Top]);
end;

procedure TFrmMainList.EditSrchEnter(Sender: TObject);
begin
  If EditSrch.Text <> '' then EditSrch.Clear;
end;

procedure TFrmMainList.EditSrchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = VK_DELETE then Begin EditSrch.Text := ''; Key := 0; End;
end;

procedure TFrmMainList.abelleanpassen1Click(Sender: TObject);
begin
  If Frm_Table.ShowModal = mrOk then ShowListe;
end;

procedure TFrmMainList.Alterextrahieren1Click(Sender: TObject);
Var
  I : Integer;
begin
  For I := 0 to Length(Soldaten)-1 do With Soldaten[I] do
    If (YearOf(Geburtstag) = 1899) and (PK1 <> '') then
    Try
      Geburtstag := EncodeDate(1900+StrToInt(Copy(PK1, 5, 2)),
                               StrToInt(Copy(PK1, 3, 2)),
                               StrToInt(Copy(PK1, 1, 2)));
    Except
      MessageDlg(Name+' hat keine gültige PK!', mtWarning, [mbOK], 0);
    End;
  ShowListe;
end;

procedure TFrmMainList.VergangeneLehrgngelschen1Click(Sender: TObject);
Var
  I, J : Integer;
begin
  If MessageDlg('Alle vergangenen Lehrgänge wirklich löschen?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  Begin
    For I := 0 to Length(Soldaten)-1 do With Soldaten[I] do
      If (LG[1].LGbis < now) and (LG[1].Aktiv) then
      Begin
        For J := 1 to 3 do LG[J] := LG[J+1];
        LG[4].Aktiv := False;
      End;
    ShowListe;
  End;
end;

procedure TFrmMainList.Listeausdrucken1Click(Sender: TObject);
Var
  I, K, Page : Integer;
Const
  TABHEIGHT = 95;
Function TabWide(Nr : Integer) : Integer;
Var
  Ctr, CWide : Integer;
Begin
  CWide := 0;
  For Ctr := 0 to TABLEMAX do
    If (AllTable[Ctr].Order < AllTable[Nr].Order) and (AllTable[Ctr].TOn) then Inc(CWide, SdtList.ColWidths[AllTable[Ctr].Order]);
  Result := CWide*6;
End;

Procedure DrawHeader(C : TCanvas; Var K : Integer);
Var
  J : Integer;
  S : string;
Begin
  C.Font.Style := C.Font.Style + [fsBold];
  C.TextOut(0, 0, 'Kompanieliste');
  S := 'VS - Nur für den Dienstgebrauch';
  C.TextOut((Printer.PageWidth - C.TextWidth(S))div 2, 0, S);
  S := DateToStr(Now);
  C.TextOut(Printer.PageWidth-C.TextWidth(S), 0, S);
 // C.Font.Size := C.Font.Size + 2;
  For J := 0 to TABLEMAX do If AllTable[J].TOn then
    C.TextOut(TabWide(J), 200, AllTable[J].Text);
  C.Font.Style := C.Font.Style - [fsBold];
 // C.Font.Size := C.Font.Size - 2;
  C.MoveTo(0,310);
  C.LineTo(Printer.PageWidth, 310);
  K := 330;
End;

begin
  If PrintDialog1.Execute then With Printer do
  Begin
    Title := 'Kompanieliste';
    BeginDoc;
    Page := 1;
    DrawHeader(Canvas, K);
    For I := 0 to Length(Soldaten)-1 do If InList(I) then
    Begin
      If K+TABHEIGHT+60 > PageHeight then
      Begin  
        Canvas.Font.Style := Canvas.Font.Style + [fsItalic];

        Canvas.TextOut((PageWidth-Canvas.TextWidth('Seite '+IntToStr(Page)))div 2,
                        PageHeight-60, 'Seite '+IntToStr(Page));
        Canvas.Font.Style := Canvas.Font.Style - [fsItalic];
        NewPage;
        Inc(Page);
        DrawHeader(Canvas, K);
      End;
      If AllTable[0].TOn then Canvas.TextOut(TabWide(0), K, Soldaten[I].Name);
      If AllTable[1].TOn then Canvas.TextOut(TabWide(1), K, Soldaten[I].Vorname);
      If AllTable[2].TOn then Canvas.TextOut(TabWide(2), K, DstGrd.Values[Soldaten[I].DG]);
      If AllTable[3].TOn then Canvas.TextOut(TabWide(3), K, ZugSL.Values[Soldaten[I].Zug]);
      If AllTable[4].TOn then Canvas.TextOut(TabWide(4), K, Soldaten[I].PK1+'-'+
                                                            Soldaten[I].PK2+'-'+
                                                            Soldaten[I].PK3);
      If AllTable[5].TOn then Canvas.TextOut(TabWide(5), K, DateToStr(Soldaten[I].DZE));
      If AllTable[6].TOn then Canvas.TextOut(TabWide(6), K, IfThen(Soldaten[I].Weiblich, 'W', 'M'));
      If AllTable[7].TOn then Canvas.TextOut(TabWide(7), K, Soldaten[I].Ort);
      If AllTable[8].TOn then Canvas.TextOut(TabWide(8), K, Soldaten[I].PLZ);
      If AllTable[9].TOn then Canvas.TextOut(TabWide(9), K, Soldaten[I].Adresse1);
      If AllTable[10].TOn then Canvas.TextOut(TabWide(10), K, Soldaten[I].Adresse2);
      If AllTable[11].TOn then Canvas.TextOut(TabWide(11), K, States[Soldaten[I].Status]);
      If AllTable[12].TOn then Canvas.TextOut(TabWide(12), K, Soldaten[I].TrANr);
      If AllTable[13].TOn then Canvas.TextOut(TabWide(13), K, Soldaten[I].Zusatz);
      If AllTable[14].TOn then Canvas.TextOut(TabWide(14), K, IfThen(Soldaten[I].Archiv, 'O', 'X'));
      If AllTable[15].TOn then Canvas.TextOut(TabWide(15), K, Soldaten[I].Tel1);
      If AllTable[16].TOn then Canvas.TextOut(TabWide(16), K, Soldaten[I].Tel2);
      If AllTable[17].TOn then Canvas.TextOut(TabWide(17), K, Soldaten[I].Tel3);
      If AllTable[18].TOn then Canvas.TextOut(TabWide(18), K, Soldaten[I].Bemerk);

      If AllTable[19].TOn then Begin
        If not Soldaten[I].LG[1].Aktiv then Canvas.TextOut(TabWide(19), K, '') else
          Canvas.TextOut(TabWide(19), K, DateToStr(Soldaten[I].LG[1].LGvon));
      End;
      If AllTable[20].TOn then Begin
        If not Soldaten[I].LG[1].Aktiv then Canvas.TextOut(TabWide(20), K, '') else
          Canvas.TextOut(TabWide(20), K, DateToStr(Soldaten[I].LG[1].LGbis));
      End;
      If AllTable[21].TOn then Canvas.TextOut(TabWide(21), K, Soldaten[I].LG[1].LGname);
      If AllTable[22].TOn then Canvas.TextOut(TabWide(22), K, Copy(WBVList[Soldaten[I].WBV], 0, Pos(Chr(13), WBVList[Soldaten[I].WBV])-1));
      If AllTable[23].TOn then Canvas.TextOut(TabWide(23), K, DateToStr(Soldaten[I].Geburtstag));
      If AllTable[24].TOn then Canvas.TextOut(TabWide(24), K, Soldaten[I].AutoKZ);
      If AllTable[25].TOn then Canvas.TextOut(TabWide(25), K, Soldaten[I].AutoArt);
      Inc(K, TABHEIGHT);
    End;     
    Canvas.TextOut((PageWidth-Canvas.TextWidth('Seite '+IntToStr(Page)))div 2,
                    PageHeight-60, 'Seite '+IntToStr(Page));
    EndDoc;
  End;
end;

procedure TFrmMainList.TabCtrlChange(Sender: TObject);
begin
  SdtList.TopRow := 1;
  ShowListe;    
  If SdtList.Cells[0, SdtList.Selection.Top] <> '' then
    ShowShort(SdtList.Cells[0, SdtList.Selection.Top]);
end;

procedure TFrmMainList.Adressekopieren1Click(Sender: TObject);
Var
  CopyString : String;
  SdtPos : Integer;
begin
  SdtPos := StrToInt(SdtList.Cells[0, SdtList.Selection.Top]);
  CopyString := DstGrd.Values[Soldaten[SdtPos].DG]+ ' '+
                Soldaten[SdtPos].Vorname+' '+
                Soldaten[SdtPos].Name+#13+
                Soldaten[SdtPos].Adresse1+#13+
                Soldaten[SdtPos].Adresse2+#13+#13+
                Soldaten[SdtPos].PLZ+' '+
                Soldaten[SdtPos].Ort;
  ClipBoard.AsText := CopyString;
end;

procedure TFrmMainList.WerhatheuteGeburtstag1Click(Sender: TObject);
Var
  S : String;
  I : Integer;
begin
  S := 'Heutige Geburtstage:'+#13+#13;
  For I := 0 to Length(Soldaten)-1 do
  Begin
    If (DayOf(Soldaten[I].Geburtstag) = DayOf(now)) and
    (MonthOf(Soldaten[I].Geburtstag) = MonthOf(now)) then
      S := S + '- '+DstGrd.Values[Soldaten[I].DG]+' '+Soldaten[I].Name+': '+
           IntToStr(YearOf(now)-YearOf(Soldaten[I].Geburtstag))+' Jahre'+#13;
  End;   
  S := S+#13+#13 + 'Morgige Geburtstage:'+#13+#13;  
  For I := 0 to Length(Soldaten)-1 do
  Begin
    If (DayOf(Soldaten[I].Geburtstag) = DayOf(now+1)) and
    (MonthOf(Soldaten[I].Geburtstag) = MonthOf(now+1)) then
      S := S + '- '+DstGrd.Values[Soldaten[I].DG]+' '+Soldaten[I].Name+': '+
           IntToStr(YearOf(now)-YearOf(Soldaten[I].Geburtstag))+' Jahre'+#13;
  End;
  MessageDlg(S, mtInformation, [mbOk], 0);
end;

procedure TFrmMainList.Info2Click(Sender: TObject);
begin
  Info_Frm.ShowModal;
end;

procedure TFrmMainList.Timer1Timer(Sender: TObject);
Var
  I : Integer;
  SdtFile : File of TSoldat;
begin
  If Length(Soldaten) > 0 then
  Begin
    OldSelection := 0;
    SortListe(2);
    SortListe(3);

    AssignFile(SdtFile, ExtractFilePath(Application.ExeName)+FILENAME);
    Rewrite(SdtFile);

    For I := 0 to Length(Soldaten)-1 do
    Begin
      Write(SdtFile, Soldaten[I]);
    End;

    CloseFile(SdtFile);
  End;
  SaveSet;
end;

procedure TFrmMainList.Speichern1Click(Sender: TObject);
Var
  I : Integer;
  SdtFile : File of TSoldat;
begin
  If Length(Soldaten) > 0 then
  Begin
    OldSelection := 0;
    SortListe(2);
    SortListe(3);

    AssignFile(SdtFile, ExtractFilePath(Application.ExeName)+FILENAME);
    Rewrite(SdtFile);

    For I := 0 to Length(Soldaten)-1 do
    Begin
      Write(SdtFile, Soldaten[I]);
    End;

    CloseFile(SdtFile);
  End;
  SaveSet;
end;

end.
