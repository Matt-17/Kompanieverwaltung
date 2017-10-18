unit Import;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ValEdit, DB, ADODB, DateUtils;

type
  TFrmImport = class(TForm)
    DGListe: TValueListEditor;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    SdtData: TADODataSet;
    XLSCon: TADOConnection;
    Edit1: TEdit;
    Button2: TButton;
    ZugListe: TValueListEditor;
    SdtLGs: TADODataSet;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure OpenDialog1SelectionChange(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

Const
  XCText1  = 'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;'+
             'Data Source=';
  XCText2  = ';Mode=Share Deny None;Extended'+
             ' Properties=Excel 8.0;Persist Security Info=False;'+
             'Jet OLEDB:System database="";Jet OLEDB:Registry '+
             'Path="";Jet OLEDB:Database Password="";Jet OLEDB:Engine '+
             'Type=35;Jet OLEDB:Database Locking Mode=0;Jet '+
             'OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global '+
             'Bulk Transactions=1;Jet OLEDB:New Database Password="";'+
             'Jet OLEDB:Create System Database=False;'+
             'Jet OLEDB:Encrypt Database=False;Jet OLEDB:'+
             'Don''t Copy Locale on Compact=False;Jet OLEDB:'+
             'Compact Without Replica Repair=False;Jet OLEDB:SFP=False';

var
  FrmImport: TFrmImport;

implementation

{$R *.dfm}

uses Main, TUnit;


procedure TFrmImport.Button1Click(Sender: TObject);
Var
  TempPK, TempName, TempDG : string;
  I, SdtPos : Integer;
begin
  If (Length(Soldaten)=0) or (MessageDlg('Möchten Sie wirklich alle alten Datensätze überschreiben?',
                mtConfirmation, [mbYes, mbNo], 0)=mrYes) then
  Begin
    SetLength(Soldaten, 0);
    XLSCon.Close;
    XLSCon.ConnectionString := XCText1 + OpenDialog1.FileName + XCText2;
    XLSCon.Open;
    SdtData.Open;
    While not SdtData.Eof do
    Begin
      If Trim(SdtData.FieldByName('Vorname').AsString) <> '' then
      Begin
        SetLength(Soldaten, Length(Soldaten)+1);
        SdtPos := Length(Soldaten)-1;
        With Soldaten[SdtPos] do
        Begin
          Name    := Trim(SdtData.FieldByName('Vorname').AsString);
          TempPK := Trim(SdtData.FieldByName('PK').AsString);
          PK1     := Copy(TempPK, 0, Pos('-', TempPK));
          Delete(TempPK, 1, Pos('-', TempPK));
          PK2     := Copy(TempPK, 0, Pos('-', TempPK));
          Delete(TempPK, 1, Pos('-', TempPK));
          PK3     := TempPK;
          TrANr := SdtData.FieldByName('TrANr').AsString;
          DG := DGListe.Values[Trim(SdtData.FieldByName('Dienstgrad').AsString)];
          Zug := ZugListe.Values[Trim(SdtData.FieldByName('TE').AsString)];
          WBV := 7;
          Mark := True;
          MarkCol := clOlive;

          Tel1 := SdtData.FieldByName('Telefon1').AsString;
          Tel2 := SdtData.FieldByName('Telefon2').AsString;
          Tel3 := SdtData.FieldByName('Telefon3').AsString;
          Adresse1 := SdtData.FieldByName('Straße').AsString;
          PLZ := SdtData.FieldByName('PLZ').AsString;
          Ort := SdtData.FieldByName('Ort').AsString;  
          AutoKZ := SdtData.FieldByName('Kennzeichen').AsString;
          AutoArt := SdtData.FieldByName('Kfz (Farbe)').AsString;
          Geburtstag := SdtData.FieldByName('Geburtstag').AsDateTime;
          For I := 1 to 4 do With LG[I] do Begin
            Aktiv := False;
            LGvon := RecodeYear(2, YearOf(now));
            LGbis := RecodeYear(2, YearOf(now));
            LGname := '';
          End;
          Archiv  := False;
        End;
      End;
      SdtData.Next;
    end;
    XLSCon.Close;
    SdtData.Close;

    XLSCon.Open;
    SdtLGs.Open;
    SdtLGs.First;
    While not SdtLGs.Eof do
    Begin
      If Trim(SdtLGs.FieldByName('Name').AsString) <> '' then
      Begin
        TempName := Trim(SdtLGs.FieldByName('Name').AsString);
        TempDG   := DGListe.Values[Trim(SdtLGs.FieldByName('DstGrad').AsString)];
        For I := 0 to Length(Soldaten)-1 do
         If (Soldaten[I].Name=TempName) and (Soldaten[I].DG = TempDG) then
         Begin
           SdtPos := I;
           Break;
         End;
        If not ((Soldaten[I].Name=TempName) and (Soldaten[I].DG = TempDG)) then
         If (Trim(SdtLGs.FieldByName('Name').AsString) <> '') and
            (Trim(SdtLGs.FieldByName('DstGrad').AsString) <> '') then
        Begin
          SetLength(Soldaten, Length(Soldaten)+1);
          SdtPos := Length(Soldaten)-1;
          With Soldaten[SdtPos] do
          Begin
            Name := Trim(SdtLGs.FieldByName('Name').AsString);
            DG   := DGListe.Values[Trim(SdtLGs.FieldByName('DstGrad').AsString)];
            Zug  := ZugListe.Values[Trim(SdtLGs.FieldByName('TE').AsString)];
            If Trim(SdtLGs.FieldByName('F3').AsString)='(w)' then Weiblich := True else
              Bemerk := Trim(SdtLGs.FieldByName('F3').AsString);
            Zusatz := Trim(SdtLGs.FieldByName('F5').AsString);
            WBV := 7;
            Mark := True;
            MarkCol := clOlive;

            Archiv  := False;
          end;
        End;

        With Soldaten[SdtPos] do
        Begin
          Status  := FindStat(SdtLGs.FieldByName('Status').AsString);
          DZE     := SdtLGs.FieldByName('DZE').AsDateTime;    
          If Trim(SdtLGs.FieldByName('F3').AsString)='(w)' then Weiblich := True else
            Bemerk := Trim(SdtLGs.FieldByName('F3').AsString);
          Zusatz := Trim(SdtLGs.FieldByName('F5').AsString);
          If Trim(SdtLGs.FieldByName('Grund').AsString) <> '' then
          Begin
            LG[1].LGvon := SdtLGs.FieldByName('von').AsDateTime;
            LG[1].LGbis := SdtLGs.FieldByName('bis').AsDateTime;
            LG[1].LGname := Trim(SdtLGs.FieldByName('Grund').AsString);
            LG[1].Aktiv := True;
          End;
        End;
      End else
      Begin
        With Soldaten[SdtPos] do
        Begin
          I := 1;
          While LG[I].Aktiv do Inc(I);
          If Trim(SdtLGs.FieldByName('Grund').AsString) <> '' then
          Begin
            LG[I].LGvon := SdtLGs.FieldByName('von').AsDateTime;
            LG[I].LGbis := SdtLGs.FieldByName('bis').AsDateTime;
            LG[I].LGname := Trim(SdtLGs.FieldByName('Grund').AsString);
            LG[I].Aktiv := True;
          End;

        End;
      End;
      SdtLGs.Next;
    end;
    XLSCon.Close;
    SdtLGs.Close;

    Close;
  End;
end;

procedure TFrmImport.Button2Click(Sender: TObject);
begin
  If OpenDialog1.Execute then Edit1.Text := OpenDialog1.FileName;
end;

procedure TFrmImport.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmImport.OpenDialog1SelectionChange(Sender: TObject);
begin
  Button1.Enabled := FileExists(OpenDialog1.FileName);
end;

end.
