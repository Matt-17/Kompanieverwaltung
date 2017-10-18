unit Tabelle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls;

type
  TFrm_Table = class(TForm)
    ListNo: TListBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    ListYes: TListBox;
    Button1: TButton;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Frm_Table: TFrm_Table;

implementation

{$R *.dfm}

Uses TUnit;

procedure TFrm_Table.FormShow(Sender: TObject);
Procedure AddToTable(MyTab : TMyTable);
Begin
  If MyTab.TOn then ListYes.Items.AddObject(MyTab.Text, TObject(MyTab.Order)) else
    ListNo.Items.Add(MyTab.Text);
End;
Var
  I, J, TI : Integer;
  TS : String;
begin
  ListYes.Items.Clear;
  ListNo.Items.Clear;
  For I := 0 to TABLEMAX do
    AddToTable(AllTable[I]);
  For I := 0 to ListYes.Items.Count do
   For J := I to ListYes.Items.Count-1 do
   If Integer(ListYes.Items.Objects[I]) > Integer(ListYes.Items.Objects[J]) then
   Begin
     TS := ListYes.Items[I];
     TI := Integer(ListYes.Items.Objects[I]);
     ListYes.Items[I] := ListYes.Items[J];
     ListYes.Items.Objects[I] := ListYes.Items.Objects[J];
     ListYes.Items[J] := TS;
     ListYes.Items.Objects[J] := TObject(TI);
   End;
end;

procedure TFrm_Table.SpeedButton2Click(Sender: TObject);
begin
  If ListNo.ItemIndex > -1 then
  Begin
    ListYes.Items.Add(ListNo.Items[ListNo.ItemIndex]);
    ListNo.DeleteSelected;
  End;
end;

procedure TFrm_Table.SpeedButton3Click(Sender: TObject);
begin
  If (ListYes.ItemIndex > -1) and not (ListYes.Items[ListYes.ItemIndex]='Name') then
  Begin
    ListNo.Items.Add(ListYes.Items[ListYes.ItemIndex]);
    ListYes.DeleteSelected;
  End;
end;

procedure TFrm_Table.Button2Click(Sender: TObject);
Procedure CompareTable(Nr : Integer; var MyTab : TMyTable);
Begin
  If (MyTab.Text = ListYes.Items.Strings[Nr]) then
  Begin
    MyTab.TOn := True;
    MyTab.Order := Nr+1;
  End;
End;

Var
  I, J : Integer;
begin
  For J := 0 to TABLEMAX do AllTable[J].TOn := False;
  For I := 0 to ListYes.Items.Count-1 do
   For J := 0 to TABLEMAX do
    CompareTable(I, AllTable[J]);
end;

procedure TFrm_Table.SpeedButton1Click(Sender: TObject);
Var
  CurIndex : Integer;
begin
  CurIndex := ListYes.ItemIndex;
  If CurIndex > 0 then
  Begin
    ListYes.Items.Move(CurIndex, CurIndex-1);
    ListYes.ItemIndex := CurIndex-1;
  End;
end;

procedure TFrm_Table.SpeedButton4Click(Sender: TObject);
Var
  CurIndex : Integer;
begin
  CurIndex := ListYes.ItemIndex;
  If (CurIndex > -1) and (CurIndex < ListYes.Count-1) then
  Begin
    ListYes.Items.Move(CurIndex, CurIndex+1); 
    ListYes.ItemIndex := CurIndex+1;
  End;
end;

end.
