unit New;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TFrmNew = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    EditName: TEdit;
    EditVorname: TEdit;
    EditPK1: TEdit;
    EditPK2: TEdit;
    EditPK3: TEdit;
    Button1: TButton;
    BoxZug: TComboBox;
    BoxDG: TComboBox;
    Label6: TLabel;
    TANEdit: TEdit;
    Label7: TLabel;
    DZE: TLabel;
    EditDZE: TDateTimePicker;
    Button2: TButton;
    EditStat: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure EditPK3KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditPK2KeyPress(Sender: TObject; var Key: Char);
    procedure EditNameChange(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    Procedure AddSdt;
  end;

var
  FrmNew: TFrmNew;

implementation

{$R *.dfm}

uses Main, TUnit;

Procedure TFrmNew.AddSdt;

Var
  SdtPos : Integer;
begin
  SetLength(Soldaten, Length(Soldaten)+1);
  SdtPos := Length(Soldaten)-1;
  With Soldaten[SdtPos] do
  Begin
    Name    := EditName.Text;
    Vorname := EditVorname.Text;
    PK1     := EditPK1.Text;
    PK2     := EditPK2.Text;
    PK3     := EditPK3.Text;
    DG      := DstGrd.Names[BoxDG.ItemIndex];
    Zug     := ZugSL.Names[BoxZug.ItemIndex];

    Status  := EditStat.ItemIndex;
    DZE     := EditDZE.Date;

    Mark := True;
    MarkCol := clYellow;

    Archiv  := False;
  End;
end;

procedure TFrmNew.Button1Click(Sender: TObject);
begin
  If (Trim(EditName.Text) <> '') and
     (Length(EditPK1.Text) = 6) and
     (Length(EditPK2.Text) = 1) and
     (Length(EditPK3.Text) = 5) and
     (BoxDG.ItemIndex > -1) and
     (BoxZug.ItemIndex > -1) then
  Begin
    AddSdt;
    ModalResult := mrOK;
  End else
    MessageDlg('Nicht alle wichtigen Felder sind ausgefüllt',
               mtWarning, [mbOk], 0);
end;

procedure TFrmNew.EditPK3KeyPress(Sender: TObject; var Key: Char);
begin
  If not ((Key in ['0'..'9']) or (Key=Chr(8))) then Key := Chr(0);
end;

procedure TFrmNew.FormCreate(Sender: TObject);
Var
  I : Integer;
begin
  BoxDG.Items.Clear;
  BoxZug.Items.Clear;
  For I := 0 to DstGrd.Count-1 do BoxDG.Items.Add(DstGrd.ValueFromIndex[I]);
  For I := 0 to ZugSL.Count-1 do BoxZug.Items.Add(ZugSL.ValueFromIndex[I]);
end;

procedure TFrmNew.FormShow(Sender: TObject);
begin
  EditName.Clear;
  EditVorname.Clear;
  BoxDG.ItemIndex := -1;
  EditPK1.Clear;
  EditPK2.Clear;
  EditPK3.Clear;
  BoxZug.ItemIndex := -1;
  TANEdit.Clear;
  EditStat.ItemIndex := 0;
  EditDZE.DateTime := Now;
end;

procedure TFrmNew.EditPK2KeyPress(Sender: TObject; var Key: Char);
begin
  If not ((Key in ['A'..'Z']) or (Key in ['a'..'z'])) then Key := Chr(0);
end;

procedure TFrmNew.EditNameChange(Sender: TObject);
begin
  If Length(EditName.Text) > 0 then
  If Length(EditPK2.Text) = 0 then EditPK2.Text := EditName.Text[1];
end;

end.
