unit Filter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TFrm_Filter = class(TForm)
    Button1: TButton;
    Button2: TButton;
    BtnLeer: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    FName: TEdit;
    FVorname: TEdit;
    FPK1: TEdit;
    FPK2: TEdit;
    FPK3: TEdit;
    FOrt: TEdit;
    BoxZug: TComboBox;
    BoxDG: TComboBox;
    FStatus: TComboBox;
    FLGa: TDateTimePicker;
    FLGb: TDateTimePicker;
    FEdLG: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    FLGaOn: TComboBox;
    FLGbOn: TComboBox;
    FAllLGChck: TCheckBox;
    FLGa2: TDateTimePicker;
    FLGb2: TDateTimePicker;
    Label11: TLabel;
    Label12: TLabel;
    FDZEa: TDateTimePicker;
    FGeba: TDateTimePicker;
    FDZEOn: TComboBox;
    FGebOn: TComboBox;
    FDZEb: TDateTimePicker;
    FGebb: TDateTimePicker;
    MarkColBox: TColorBox;
    Label13: TLabel;
    BoxDZ: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnLeerClick(Sender: TObject);
    procedure FLGaOnChange(Sender: TObject);
    procedure FLGbOnChange(Sender: TObject);
    procedure FAllLGChckClick(Sender: TObject);
    procedure FDZEOnChange(Sender: TObject);
    procedure FGebOnChange(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Frm_Filter: TFrm_Filter;

implementation

{$R *.dfm}

Uses TUnit, Main;

procedure TFrm_Filter.Button1Click(Sender: TObject);
begin
  With AllFilter do
  Begin
    Name.FOn := Trim(FName.Text) <> '';
    Name.Text := UpperCase(Trim(FName.Text));
    Vorname.FOn := Trim(FVorname.Text) <> '';
    Vorname.Text := UpperCase(Trim(FVorname.Text));
    PK1.FOn := Trim(FPK1.Text) <> '';
    PK1.Text := UpperCase(Trim(FPK1.Text));
    PK2.FOn := Trim(FPK2.Text) <> '';
    PK2.Text := UpperCase(Trim(FPK2.Text));
    PK3.FOn := Trim(FPK3.Text) <> '';
    PK3.Text := UpperCase(Trim(FPK3.Text));
    DG.FOn := BoxDG.ItemIndex > 0;
    If DG.FOn then DG.Text := DstGrd.Names[BoxDG.ItemIndex-1];  
    DZ.FOn := BoxDZ.ItemIndex > 0;
    If DZ.FOn then DZ.Text := DZL[BoxDZ.ItemIndex-1];

    Zug.FOn := BoxZug.ItemIndex > 0;
    If Zug.FOn then Zug.Text := ZugSL.Names[BoxZug.ItemIndex-1];
    Ort.FOn := Trim(FOrt.Text) <> '';
    Ort.Text := UpperCase(Trim(FOrt.Text));
    Status.FOn := FStatus.ItemIndex > 0;
    If Status.FOn then Status.Text := UpperCase(Trim(FStatus.Text));
    Mark.FOn := MarkColBox.ItemIndex > 0;
    If Mark.FOn then Mark.Text := IntToStr(MarkColBox.Selected);


    DZE.Compare := FDZEOn.ItemIndex;
    DZE.Date := FDZEa.Date;
    DZE.Date2 := FDZEb.Date;

    Geb.Compare := FGebOn.ItemIndex;
    Geb.Date := FGeba.Date;
    Geb.Date2 := FGebb.Date;

    LGa.Compare := FLGaOn.ItemIndex;
    LGa.Date := FLGa.Date;  
    LGa.Date2 := FLGa2.Date;

    LGb.Compare := FLGbOn.ItemIndex;
    LGb.Date := FLGb.Date;
    LGb.Date2 := FLGb2.Date;

    
    LG.FOn := Trim(FEdLG.Text) <> '';
    LG.Text := UpperCase(Trim(FEdLG.Text));

    AnyLG.FOn := FAllLGChck.Checked;
  End;
end;

procedure TFrm_Filter.FormCreate(Sender: TObject);
Var
  I : Integer; 
  TempIndex, ItemC : Integer;
  TempList : TStringList;
begin
  For I := 0 to DstGrd.Count-1 do BoxDG.Items.Add(DstGrd.ValueFromIndex[I]);
  For I := 0 to ZugSL.Count-1 do BoxZug.Items.Add(ZugSL.ValueFromIndex[I]); 
  For I := 0 to DZL.Count-1 do BoxDZ.Items.Add(DZL[I]);
  BoxDZ.Items[1] := '(ohne)';

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
  MarkColBox.Items.Insert(0, '(Alle)');
  MarkColBox.ItemIndex := 0;
end;

procedure TFrm_Filter.FormShow(Sender: TObject);
begin
  With AllFilter do
  Begin
    If Name.FOn then FName.Text := Name.Text else FName.Text := '';
    If Vorname.FOn then FVorname.Text := Vorname.Text else FVorname.Text := '';
    If PK1.FOn then FPK1.Text := PK1.Text else FPK1.Text := '';
    If PK2.FOn then FPK2.Text := PK2.Text else FPK2.Text := '';
    If PK3.FOn then FPK3.Text := PK3.Text else FPK3.Text := '';

    If DG.FOn then BoxDG.ItemIndex := DstGrd.IndexOfName(DG.Text)+1 else BoxDG.ItemIndex := 0;
    If Zug.FOn then BoxZug.ItemIndex := ZugSL.IndexOfName(Zug.Text)+1 else BoxZug.ItemIndex := 0;
    If DZ.FOn then BoxDZ.ItemIndex := DZL.IndexOf(DZ.Text)+1 else BoxDZ.ItemIndex := 0;

    If Ort.FOn then FOrt.Text := Ort.Text else FOrt.Text := '';
    If Status.FOn then FStatus.ItemIndex := FindStat(Status.Text)+1 else FStatus.ItemIndex := 0;
    If Mark.FOn then MarkColBox.Selected := StrToInt(Mark.Text) else FStatus.ItemIndex := 0;
              
    FDZEOn.ItemIndex := DZE.Compare;
    If DZE.Compare <> 0 then Begin
                               FDZEa.Date := DZE.Date;
                               FDZEb.Date := DZE.Date2;
                             end else
                             Begin
                               FDZEa.Date := now;
                               FDZEb.Date := now;
                             End; 
    FGebOn.ItemIndex := Geb.Compare;
    If Geb.Compare <> 0 then Begin
                               FGeba.Date := Geb.Date;
                               FGebb.Date := Geb.Date2;
                             end else
                             Begin
                               FGeba.Date := now;
                               FGebb.Date := now;
                             End;

    If LG.FOn then FEdLG.Text := LG.Text else FEdLG.Text := '';
    FLGaOn.ItemIndex := LGa.Compare;
    If LGa.Compare <> 0 then Begin
                               FLGa.Date := LGa.Date;
                               FLGa2.Date := LGa.Date2;
                             end else
                             Begin
                               FLGa.Date := now;
                               FLGa2.Date := now;
                             End;
    FLGbOn.ItemIndex := LGb.Compare;
    If LGb.Compare <> 0 then Begin
                               FLGb.Date := LGb.Date;
                               FLGb2.Date := LGb.Date2;
                             end else
                             Begin
                               FLGb.Date := now;
                               FLGb2.Date := now;
                             End;

    FAllLGChck.Checked := AnyLG.FOn;
    FLGa.Visible := (FLGaOn.ItemIndex <> 0);
    FLGa2.Visible := (FLGaOn.ItemIndex = 4);
    FLGb.Visible := (FLGbOn.ItemIndex <> 0);
    FLGb2.Visible := (FLGbOn.ItemIndex = 4);
    FDZEa.Visible := (FDZEOn.ItemIndex <> 0);
    FDZEb.Visible := (FDZEOn.ItemIndex = 4);
    FGeba.Visible := (FGebOn.ItemIndex <> 0);
    FGebb.Visible := (FGebOn.ItemIndex = 4);
  End;
end;

procedure TFrm_Filter.BtnLeerClick(Sender: TObject);
begin
  FName.Text := '';
  FVorname.Text := '';
  FPK1.Text := '';
  FPK2.Text := '';
  FPK3.Text := '';

  BoxDG.ItemIndex := 0;
  BoxZug.ItemIndex := 0;
  BoxDZ.ItemIndex := 0;

  FOrt.Text := '';
  FStatus.ItemIndex := 0;

  FDZEOn.ItemIndex := 0;
  FGebOn.ItemIndex := 0;

  FLGaOn.ItemIndex := 0;
  FLGbOn.ItemIndex := 0;
  FEdLG.Text := '';
  FAllLGChck.Checked := False;
  FEdLG.Visible := True;

  FLGa.Visible := (FLGaOn.ItemIndex <> 0);
  FLGa2.Visible := (FLGaOn.ItemIndex = 4);
  FLGb.Visible := (FLGbOn.ItemIndex <> 0);
  FLGb2.Visible := (FLGbOn.ItemIndex = 4);
  FDZEa.Visible := (FDZEOn.ItemIndex <> 0);
  FDZEb.Visible := (FDZEOn.ItemIndex = 4);
  FGeba.Visible := (FGebOn.ItemIndex <> 0);
  FGebb.Visible := (FGebOn.ItemIndex = 4);
end;

procedure TFrm_Filter.FLGaOnChange(Sender: TObject);
begin
  FLGa.Visible := (FLGaOn.ItemIndex <> 0);
  FLGa2.Visible := (FLGaOn.ItemIndex = 4);
end;

procedure TFrm_Filter.FLGbOnChange(Sender: TObject);
begin
  FLGb.Visible := (FLGbOn.ItemIndex <> 0);
  FLGb2.Visible := (FLGbOn.ItemIndex = 4);
end;

procedure TFrm_Filter.FAllLGChckClick(Sender: TObject);
begin
  FEdLG.Visible := not FAllLGChck.Checked;
  If not FEdLG.Visible then FEdLG.Text := '';
end;

procedure TFrm_Filter.FDZEOnChange(Sender: TObject);
begin
  FDZEa.Visible := (FDZEOn.ItemIndex <> 0);
  FDZEb.Visible := (FDZEOn.ItemIndex = 4);
end;

procedure TFrm_Filter.FGebOnChange(Sender: TObject);
begin
  FGeba.Visible := (FGebOn.ItemIndex <> 0);
  FGebb.Visible := (FGebOn.ItemIndex = 4);
end;

end.
