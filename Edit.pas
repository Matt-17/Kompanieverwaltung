unit Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, DateUtils, Grids, Mask;

type
  TFrmEdit = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DZE: TLabel;
    EditName: TEdit;
    EditVorname: TEdit;
    EditPK1: TEdit;
    EditPK2: TEdit;
    EditPK3: TEdit;
    Button1: TButton;
    BoxZug: TComboBox;
    BoxDG: TComboBox;
    EditDZE: TDateTimePicker;
    Button2: TButton;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    LGa: TDateTimePicker;
    LGb: TDateTimePicker;
    EdLG: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Button3: TButton;
    UpDown1: TUpDown;
    Label12: TPanel;
    MarkChck: TCheckBox;
    MarkColBox: TColorBox;
    BtnLGAdd: TButton;
    BtnLGChg: TButton;
    BtnLGDel: TButton;
    LGGrid: TStringGrid;
    EdBem: TMemo;
    EditStat: TComboBox;
    GeschlechtGrp: TRadioGroup;
    Label13: TLabel;
    TANEdit: TEdit;
    EditKZ: TEdit;
    EditKFZ: TEdit;
    EditBDay: TDateTimePicker;
    GebLbl: TLabel;
    KfzLbl: TLabel;
    Label16: TLabel;
    Button4: TButton;
    Button5: TButton;
    BoxDZ: TComboBox;
    procedure Edit1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnLGAddClick(Sender: TObject);
    procedure LGbChange(Sender: TObject);
    procedure LGGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure BtnLGDelClick(Sender: TObject);
    procedure BtnLGChgClick(Sender: TObject);
    procedure LGaChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    Procedure LoadSoldat(SoldNr : Integer);
    Procedure SaveSoldat(SoldNr : Integer);
    Procedure SelectCell(ARow : Integer);
  end;

var
  FrmEdit: TFrmEdit;

Const
  WBVList : Array[1..7]of String = (
    'WBV Nord ASt'+#13+'Außenstelle Kiel'+#13+'Feldstrasse 234'+#13+'24106 Kiel',
    'WBV Nord'+#13+'Hans-Böckler-Allee 16'+#13+'30173 Hanover',
    'WBV West'+#13+'Postfach 301054'+#13+'40410 Düsseldorf',
    'WBV West ASt'+#13+'Außenstelle Wiesbaden'+#13+'Moltkering 9'+#13+'65189 Wiesbaden',
    'WBV Süd'+#13+'Postfach 105261'+#13+'70045 Stuttgart',
    'WBV Süd ASt'+#13+'Außenstelle München'+#13+'80632 München',
    'WBV Ost'+#13+'Postfach 1149'+#13+'15331 Strausberg');


implementation

{$R *.dfm}

Uses Main, TUnit;

Var
  ActualSoldat : Integer;

Procedure TFrmEdit.SelectCell(ARow : Integer);
Begin
  If LGGrid.Cells[2, ARow] <> '' then
  Begin
    LGa.Date := StrToDate(LGGrid.Cells[0, ARow]);
    LGb.Date := StrToDate(LGGrid.Cells[1, ARow]);
    EdLG.Text := LGGrid.Cells[2, ARow];
  End else
  Begin
    LGa.DateTime := now;
    LGb.DateTime := now;
    EdLG.Text := '';
  End;
End;

Procedure TFrmEdit.LoadSoldat(SoldNr : Integer);
Var
  I :Integer;
Begin
  ActualSoldat := SoldNr;
  With Soldaten[SoldNr] do
  Begin
    EditName.Text := Name;
    EditVorname.Text := Vorname;
    EditPK1.Text := PK1;
    EditPK2.Text := PK2;
    EditPK3.Text := PK3;
    TANEdit.Text := TrANr;
    EditStat.ItemIndex := Status;
    Edit6.Text := Adresse1;
    Edit7.Text := Adresse2;
    Edit8.Text := PLZ;
    Edit9.Text := Ort;
    Edit10.Text := Tel1;
    Edit11.Text := Tel2;
    Edit12.Text := Tel3;
    UpDown1.Position := WBV;
    BoxDG.ItemIndex := DstGrd.IndexOfName(DG);
    BoxZug.ItemIndex := ZugSL.IndexOfName(Zug);
    BoxDZ.ItemIndex := DZL.IndexOf(Zusatz);
    EditDZE.Date := DZE;
    EdBem.Text := Bemerk;   
    EditBDay.Date := Geburtstag;
    EditKFZ.Text := AutoArt;
    EditKZ.Text := AutoKZ;
    Button4.Visible := Archiv;
    If Weiblich then GeschlechtGrp.ItemIndex := 1 else GeschlechtGrp.ItemIndex := 0;
    For I := 1 to 4 do
    If LG[I].Aktiv then
    Begin
      LGGrid.Cells[0, I-1] := DateToStr(LG[I].LGvon);
      LGGrid.Cells[1, I-1] := DateToStr(LG[I].LGbis);
      LGGrid.Cells[2, I-1] := LG[I].LGname;
    End else
    Begin 
      LGGrid.Cells[0, I-1] := '';
      LGGrid.Cells[1, I-1] := '';
      LGGrid.Cells[2, I-1] := '';
    End;

    MarkChck.Checked := Mark;
    MarkColBox.Selected := MarkCol;
  End;  
  LGa.DateTime := now;
  LGb.DateTime := now;
  EdLG.Text := '';  
  SelectCell(0);
End;

Procedure TFrmEdit.SaveSoldat(SoldNr : Integer);
Var
  I : Integer;
Begin
  With Soldaten[SoldNr] do
  Begin
    Name := EditName.Text;
    Vorname := EditVorname.Text;
    PK1 := EditPK1.Text;
    PK2 := EditPK2.Text;
    PK3 := EditPK3.Text;
    TrANr := TANEdit.Text;
    Status := EditStat.ItemIndex;
    Adresse1 := Edit6.Text;
    Adresse2 := Edit7.Text;
    PLZ := Edit8.Text;
    Ort := Edit9.Text;
    Tel1 := Edit10.Text;
    Tel2 := Edit11.Text;
    Tel3 := Edit12.Text;
    WBV := UpDown1.Position;
    DG      := DstGrd.Names[BoxDG.ItemIndex];
    Zug     := ZugSL.Names[BoxZug.ItemIndex];
    DZE := EditDZE.Date;
    Weiblich := GeschlechtGrp.ItemIndex = 1;
    Zusatz := BoxDZ.Text;

    Geburtstag := EditBDay.Date;
    AutoArt := EditKFZ.Text;
    AutoKZ := EditKZ.Text;

    For I := 1 to 4 do
    Begin
      LG[I].LGname := LGGrid.Cells[2, I-1];
      If Length(LG[I].LGname) > 0 then
      Begin
        LG[I].Aktiv := True;
        LG[I].LGvon := StrToDate(LGGrid.Cells[0, I-1]);
        LG[I].LGbis := StrToDate(LGGrid.Cells[1, I-1]);
      End else LG[I].Aktiv := False;
    End;
    Mark := MarkChck.Checked;
    MarkCol := MarkColBox.Selected;
    Bemerk := EdBem.Text;
  End;
End;

procedure TFrmEdit.Edit1Change(Sender: TObject);
begin
  Label12.Caption := WBVList[UpDown1.Position];
  Label12.Hint := Label12.Caption;
  Case UpDown1.Position of
    1 : Edit1.Text := 'I';
    2 : Edit1.Text := 'II';
    3 : Edit1.Text := 'III';
    4 : Edit1.Text := 'IV';
    5 : Edit1.Text := 'V';
    6 : Edit1.Text := 'VI';
    7 : Edit1.Text := 'VII';
  End;
end;

procedure TFrmEdit.Button2Click(Sender: TObject);
begin
  SaveSoldat(ActualSoldat);
end;

procedure TFrmEdit.FormCreate(Sender: TObject);
Var
  I : Integer; 
  TempIndex, ItemC : Integer;
  TempList : TStringList;
begin
  BoxDG.Items.Clear;
  BoxZug.Items.Clear;
  BoxDZ.Items.Clear;
  For I := 0 to DstGrd.Count-1 do BoxDG.Items.Add(DstGrd.ValueFromIndex[I]);
  For I := 0 to ZugSL.Count-1 do BoxZug.Items.Add(ZugSL.ValueFromIndex[I]); 
  For I := 0 to DZL.Count-1 do BoxDZ.Items.Add(DZL[I]);
  BoxDZ.Items[0] := ' ';

  ItemC := MarkColBox.ItemIndex;
  TempList := TStringList.Create;
  TempList.LoadFromFile(ExtractFilePath(Application.ExeName)+COLFILE);
  For I := 0 to MarkColBox.Items.Count -1 do
  Begin
    TempIndex := TempList.IndexOfName(MarkColBox.Items[I]);
    If TempIndex >-1 then
      MarkColBox.Items[I] := TempList.ValueFromIndex[TempIndex];
  End;     
  TempList.Free;
  MarkColBox.ItemIndex := ItemC;
end;

procedure TFrmEdit.BtnLGAddClick(Sender: TObject);
Var
  I, J, Akt : Integer;
  T0, T1, T2 : String;
begin
  Akt := 4;
  For I := 0 to 3 do
   If Trim(LGGrid.Cells[2, I]) = '' then
    Begin Akt := I; Break; End;
  If Akt < 4 then Begin
    LGGrid.Cells[2, Akt] := EdLG.Text;
    LGGrid.Cells[1, Akt] := DateToStr(LGb.Date);
    LGGrid.Cells[0, Akt] := DateToStr(LGa.Date);
  End;

  For I := 0 to 3 do
  For J := 0 to 3 do
  If (LGGrid.Cells[0, I]<>'') and (LGGrid.Cells[0, J]<> '') then
  If StrToDate(LGGrid.Cells[0, I]) < StrToDate(LGGrid.Cells[0, J]) then
  Begin
    T2 := LGGrid.Cells[2, I];
    T1 := LGGrid.Cells[1, I];
    T0 := LGGrid.Cells[0, I];

    LGGrid.Cells[2, I] := LGGrid.Cells[2, J];
    LGGrid.Cells[1, I] := LGGrid.Cells[1, J];
    LGGrid.Cells[0, I] := LGGrid.Cells[0, J];

    LGGrid.Cells[2, J] := T2;
    LGGrid.Cells[1, J] := T1;
    LGGrid.Cells[0, J] := T0;
  End;
end;

procedure TFrmEdit.LGbChange(Sender: TObject);
begin
  If LGb.Date < LGa.Date then LGb.Date := LGa.Date;
end;

procedure TFrmEdit.LGGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  SelectCell(ARow);
end;

procedure TFrmEdit.BtnLGDelClick(Sender: TObject);
Var
  I : Integer;
begin
  I := LGGrid.Selection.Top;
  LGGrid.Cells[2, I] := '';
  LGGrid.Cells[1, I] := '';
  LGGrid.Cells[0, I] := '';
  LGa.DateTime := now;
  LGb.DateTime := now;
  EdLG.Text := '';

  Repeat
    I := 0;
    While (LGGrid.Cells[2, I] <> '') and (I<3) do Inc(I);
    If LGGrid.Cells[2, I+1] <> '' then
    Begin
      LGGrid.Cells[2, I] := LGGrid.Cells[2, I+1];
      LGGrid.Cells[1, I] := LGGrid.Cells[1, I+1];
      LGGrid.Cells[0, I] := LGGrid.Cells[0, I+1];
      LGGrid.Cells[2, I+1] := '';
      LGGrid.Cells[1, I+1] := '';
      LGGrid.Cells[0, I+1] := '';
    End;
  Until LGGrid.Cells[2, I] = '';
end;

procedure TFrmEdit.BtnLGChgClick(Sender: TObject);
Var
  I : Integer;
begin
  I := LGGrid.Selection.Top;
  LGGrid.Cells[2, I] := EdLG.Text;
  LGGrid.Cells[1, I] := DateToStr(LGb.Date);
  LGGrid.Cells[0, I] := DateToStr(LGa.Date);
end;

procedure TFrmEdit.LGaChange(Sender: TObject);
begin
  If LGb.Date < LGa.Date then LGb.Date := LGa.Date;
end;

procedure TFrmEdit.Button1Click(Sender: TObject);
begin
  LoadSoldat(ActualSoldat);
end;

procedure TFrmEdit.Button4Click(Sender: TObject);
begin
  Soldaten[ActualSoldat].Archiv := False;
  Button4.Visible := False;
end;

end.
