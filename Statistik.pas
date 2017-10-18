unit Statistik;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  TFrm_Stat = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LblS1: TLabel;
    LblS2: TLabel;
    LblS3: TLabel;
    LblS4: TLabel;
    BtnOK: TButton;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    LblZ1: TLabel;
    LblZ3: TLabel;
    LblZ4: TLabel;
    LblZ2: TLabel;
    Label9: TLabel;
    LblZ5: TLabel;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    LblM1: TLabel;
    LblM2: TLabel;
    GroupBox4: TGroupBox;
    Label36: TLabel;
    LblG: TLabel;
    Button1: TButton;
    DstGrid: TStringGrid;
    GroupBox5: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    LblDZ4: TLabel;
    LblDZ3: TLabel;
    LblDZ2: TLabel;
    LblDZ1: TLabel;
    CheckBox1: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Frm_Stat: TFrm_Stat;

implementation

{$R *.dfm}

Uses TUnit, Main;

procedure TFrm_Stat.FormShow(Sender: TObject);
Function ZahlStr(Zahl : Integer) : String;
Begin
  Result := '';
  If CheckBox1.Checked then Result := IntToStr(Zahl) else
    If Zahl <> 0 then Result := IntToStr(Zahl);
End;
Var
  I, G : Integer;
  StatusCount : Array[0..3] of Integer;
  ZugCount : Array[0..4] of Integer;
  GeschCount : Array[0..1] of Integer;
  DGCount : Array of Array[0..6] of Integer;
  DGZCount : Array[0..3] of Integer;
begin
  DstGrid.ColWidths[0] := 144; 
  DstGrid.ColWidths[5] := 8;
  DstGrid.ColWidths[9] := 8;
  DstGrid.Rows[0][1] := 'GWDL';
  DstGrid.Rows[0][2] := 'FWDL';
  DstGrid.Rows[0][3] := 'SaZ';
  DstGrid.Rows[0][4] := 'BS'; 
  DstGrid.Rows[0][6] := 'UA';
  DstGrid.Rows[0][7] := 'FA';
  DstGrid.Rows[0][8] := 'OA';
  DstGrid.Rows[0][10] := 'Gesamt';
  DstGrid.RowCount := DStGrd.Count+1;
  SetLength(DGCount, DStGrd.Count);
  For I:= 0 to 3 do StatusCount[I] := 0;  
  For I:= 0 to 3 do DGZCount[I] := 0;
  For I:= 0 to 4 do ZugCount[I] := 0;
  For I:= 0 to 1 do ZugCount[I] := 0;
  For I:= 0 to Length(DGCount)-1 do
    For G := 0 to 3 do DGCount[I, G] := 0;
  G := 0;
  For I := 0 to Length(Soldaten)-1 do
   If not Soldaten[I].Archiv then
  Begin
    Inc(G);
    If Soldaten[I].Zusatz = 'UA' then Inc(DGZCount[1]) else
     If Soldaten[I].Zusatz = 'FA' then Inc(DGZCount[2]) else
     If Soldaten[I].Zusatz = 'OA' then Inc(DGZCount[3]) else
      Inc(DGZCount[0]);
    Inc(StatusCount[Soldaten[I].Status]);
    Inc(ZugCount[StrToInt(Copy(Soldaten[I].Zug, 0, 2))-1]);
    If Soldaten[I].Weiblich then Inc(GeschCount[1]) else Inc(GeschCount[0]); 
    Inc(DGCount[DstGrd.IndexOfName(Soldaten[I].DG), Soldaten[I].Status]);
    If Soldaten[I].Zusatz = 'UA' then Inc(DGCount[DstGrd.IndexOfName(Soldaten[I].DG), 4]) else
     If Soldaten[I].Zusatz = 'FA' then Inc(DGCount[DstGrd.IndexOfName(Soldaten[I].DG), 5]) else
      If Soldaten[I].Zusatz = 'OA' then Inc(DGCount[DstGrd.IndexOfName(Soldaten[I].DG), 6]);
  End;
  LblG.Caption := IntToStr(G);

  LblS1.Caption := IntToStr(StatusCount[0]);
  LblS2.Caption := IntToStr(StatusCount[1]);
  LblS3.Caption := IntToStr(StatusCount[2]);
  LblS4.Caption := IntToStr(StatusCount[3]);

  LblDZ1.Caption := IntToStr(DGZCount[0]);
  LblDZ2.Caption := IntToStr(DGZCount[1]);
  LblDZ3.Caption := IntToStr(DGZCount[2]);
  LblDZ4.Caption := IntToStr(DGZCount[3]);

  LblZ1.Caption := IntToStr(ZugCount[0]);
  LblZ2.Caption := IntToStr(ZugCount[1]);
  LblZ3.Caption := IntToStr(ZugCount[2]);
  LblZ4.Caption := IntToStr(ZugCount[3]);
  LblZ5.Caption := IntToStr(ZugCount[4]);

  LblM1.Caption := IntToStr(GeschCount[0]);
  LblM2.Caption := IntToStr(GeschCount[1]);

  For I := 0 to Length(DGCount)-1 Do
  Begin
    G := DGCount[I, 0]+DGCount[I, 1]+DGCount[I, 2]+DGCount[I, 3];
    DstGrid.Rows[I+1][0]:=DStGrd.ValueFromIndex[I];
    DstGrid.Rows[I+1][1]:= ZahlStr(DGCount[I, 0]);
    DstGrid.Rows[I+1][2]:= ZahlStr(DGCount[I, 1]);
    DstGrid.Rows[I+1][3]:= ZahlStr(DGCount[I, 2]);
    DstGrid.Rows[I+1][4]:= ZahlStr(DGCount[I, 3]);
    
    DstGrid.Rows[I+1][6]:= ZahlStr(DGCount[I, 4]);
    DstGrid.Rows[I+1][7]:= ZahlStr(DGCount[I, 5]);
    DstGrid.Rows[I+1][8]:= ZahlStr(DGCount[I, 6]);

    DstGrid.Rows[I+1][10]:= ZahlStr(G);
  End;
end;

procedure TFrm_Stat.BtnOKClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm_Stat.Button1Click(Sender: TObject);
begin
  Color := clWhite;
  CheckBox1.Visible := False;
  BorderStyle := bsNone;
  Button1.Visible := False;
  BtnOK.Visible := False;
  Frm_Stat.Print;
  Button1.Visible := True;
  BtnOK.Visible := True;
  BorderStyle := bsSingle;   
  CheckBox1.Visible := True;
  Color := clBtnFace;
end;

procedure TFrm_Stat.CheckBox1Click(Sender: TObject);
begin
  FormShow(Sender);
end;

end.
