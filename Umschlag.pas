unit Umschlag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Printers, StdCtrls, ComCtrls, ExtCtrls;

type
  TFrm_Umschlag = class(TForm)
    Button1: TButton;
    PDlg: TPrintDialog;
    PSDlg: TPrinterSetupDialog;
    Button2: TButton;
    Button3: TButton;
    EdAdr1: TEdit;
    EdAdr2: TEdit;
    EdPLZ: TEdit;
    EdOrt: TEdit;
    EdAdr3: TEdit;
    GroupsBox: TComboBox;
    AddrBox: TListBox;
    GroupsEd: TEdit;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Person: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button8: TButton;
    PgSetup: TPageSetupDialog;
    Button9: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GroupsBoxDropDown(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure GroupsBoxChange(Sender: TObject);
    procedure AddrBoxClick(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PgSetupDrawEnvStamp(Sender: TObject; Canvas: TCanvas;
      PageRect: TRect; var DoneDrawing: Boolean);
    procedure PgSetupDrawMargin(Sender: TObject; Canvas: TCanvas;
      PageRect: TRect; var DoneDrawing: Boolean);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    Procedure LoadGroups;
    Procedure LoadGroup;
    Procedure LoadAdr;
  end;
  TUmschlag = record
    ShortName : String[32];
    ID : Integer;
    PID : Integer;
    Adr1, Adr2, Adr3 : string[64];
    PLZ : String[5];
    Ort : String[32];
  End;

var
  Frm_Umschlag: TFrm_Umschlag;
  AktUmschlag : TUmschlag;
  Umschlaege : Array of TUmschlag;
  TreeSelect : TTreeNode;

  UmschlagPic : TBitmap;
  TextPic : TBitmap;
  BtlPic : TBitmap;

Const
  USFN = 'Adressen.dat';

implementation

uses Adr;

{$R *.dfm}

Procedure TFrm_Umschlag.LoadGroups;    
Var
  I, J : Integer;
begin
  J := GroupsBox.ItemIndex;
  If J = -1 then J := 0;
  GroupsBox.Items.Clear;
  For I := 0 to Length(Umschlaege)-1 do
  Begin
    If Umschlaege[I].PID = 0 then
    GroupsBox.Items.AddObject(Umschlaege[I].ShortName,
                              TObject(Umschlaege[I].ID));
  End;
  GroupsBox.ItemIndex := J; 
  LoadGroup;
End;

Procedure TFrm_Umschlag.LoadGroup;
Var
  I : Integer;
Begin 
  AddrBox.Items.Clear;
  For I := 0 to Length(Umschlaege)-1 do
  Begin
    If Umschlaege[I].PID = Integer(GroupsBox.Items.Objects[GroupsBox.ItemIndex]) then
    AddrBox.Items.AddObject(Umschlaege[I].ShortName,
                            TObject(I));
  End;
  AddrBox.ItemIndex := 0;
  LoadAdr;
End;

Procedure TFrm_Umschlag.LoadAdr;
Begin
  If AddrBox.ItemIndex > -1 then
  With Umschlaege[Integer(AddrBox.Items.Objects[AddrBox.ItemIndex])] do Begin
    EdAdr1.Text := Adr1;
    EdAdr2.Text := Adr2;
    EdAdr3.Text := Adr3;
    EdPLZ.Text := PLZ;
    EdOrt.Text := Ort;
  End;
End;

procedure TFrm_Umschlag.FormShow(Sender: TObject);
Var
  FUmschlag : File of TUmschlag;
begin
  SetLength(Umschlaege, 0);
  If FileExists(ExtractFilePath(Application.ExeName)+USFN) then
  Begin
    AssignFile(FUmschlag, ExtractFilePath(Application.ExeName)+USFN);
    Reset(FUmschlag);

    While not EOF(FUmschlag) do
    Begin
      Read(FUmschlag, AktUmschlag);
      SetLength(Umschlaege, Length(Umschlaege)+1);
      Umschlaege[Length(Umschlaege)-1] := AktUmschlag;
    End;

    CloseFile(FUmschlag);
  End;
  LoadGroups;
end;

procedure TFrm_Umschlag.FormClose(Sender: TObject;
  var Action: TCloseAction);
Var
  FUmschlag : File of TUmschlag;
  I : Integer;
begin  
  AssignFile(FUmschlag, ExtractFilePath(Application.ExeName)+USFN);
  Rewrite(FUmschlag);

  For I := 0 to Length(Umschlaege)-1 do
  Begin
    Write(FUmschlag, Umschlaege[I]);
  End;

  CloseFile(FUmschlag);
end;

procedure TFrm_Umschlag.GroupsBoxDropDown(Sender: TObject);
Begin
  LoadGroups;
end;

procedure TFrm_Umschlag.Button5Click(Sender: TObject);
begin
  SetLength(Umschlaege, Length(Umschlaege)+1);
  With Umschlaege[Length(Umschlaege)-1] do
  Begin
    ShortName := GroupsEd.Text;
    PID := 0;
    If Length(Umschlaege) = 1 then ID := 1 else
     ID := Umschlaege[Length(Umschlaege)-2].ID+1;
    GroupsEd.Text := '';
  End;
  LoadGroups;
end;

procedure TFrm_Umschlag.Button2Click(Sender: TObject);
begin
  If GroupsBox.ItemIndex > -1 then with Adr_Form do
  Begin
    AddrEd.Text := '';
    EdAdr1.Text := '';
    EdAdr2.Text := '';
    EdAdr3.Text := '';
    EdPLZ.Text := '';
    EdOrt.Text := '';
    If ShowModal = mrOk then
    Begin
      SetLength(Umschlaege, Length(Umschlaege)+1);
      With Umschlaege[Length(Umschlaege)-1] do
      Begin
        ShortName := AddrEd.Text;
        Adr1 := EdAdr1.Text;
        Adr2 := EdAdr2.Text;
        Adr3 := EdAdr3.Text;
        PLZ := EdPLZ.Text;
        Ort := EdOrt.Text;
        PID := Integer(GroupsBox.Items.Objects[GroupsBox.ItemIndex]);
        If Length(Umschlaege) = 0 then ID := 1 else
         ID := Umschlaege[Length(Umschlaege)-2].ID+1;
        AddrEd.Text := '';
      End;
    End;
  End;
  LoadGroup;
end;

procedure TFrm_Umschlag.GroupsBoxChange(Sender: TObject);
begin
  LoadGroup;
end;

procedure TFrm_Umschlag.AddrBoxClick(Sender: TObject);
begin
  LoadAdr;
end;

procedure TFrm_Umschlag.Button7Click(Sender: TObject);
begin
  With UmschlagPic.Canvas do
  Begin
    TextPic.Canvas.FillRect(TextPic.Canvas.ClipRect);
    TextPic.Canvas.TextOut(0, 0, Person.Text);
    StretchDraw(Rect(3000, 700, 5000, 800), TextPic);
    TextPic.Canvas.FillRect(TextPic.Canvas.ClipRect);
    TextPic.Canvas.TextOut(0, 0, Person.Text);
    StretchDraw(Rect(3000, 800, 5000, 900), TextPic);
    TextPic.Canvas.FillRect(TextPic.Canvas.ClipRect);
    TextPic.Canvas.TextOut(0, 0, Person.Text);
    StretchDraw(Rect(3000, 900, 5000, 1000), TextPic);
    TextPic.Canvas.FillRect(TextPic.Canvas.ClipRect);
    TextPic.Canvas.TextOut(0, 0, Person.Text);
    StretchDraw(Rect(3000, 1000, 5000, 1100), TextPic);
    TextPic.Canvas.FillRect(TextPic.Canvas.ClipRect);
    TextPic.Canvas.TextOut(0, 0, Person.Text);
    StretchDraw(Rect(3000, 1200, 5000, 1300), TextPic);
  End;
  If PDlg.Execute then
  With Printer do
  Begin
    Title := 'Umschlag';
    BeginDoc;
    Canvas.StretchDraw(Rect(600, 600, PageWidth-600, PageHeight-600), UmschlagPic);
    EndDoc;
  End;
end;

procedure TFrm_Umschlag.Button3Click(Sender: TObject);
begin
  If AddrBox.ItemIndex > -1 then with Adr_Form do
  Begin
    With Umschlaege[Integer(AddrBox.Items.Objects[AddrBox.ItemIndex])] do Begin
      AddrEd.Text := ShortName;
      EdAdr1.Text := Adr1;
      EdAdr2.Text := Adr2;
      EdAdr3.Text := Adr3;
      EdPLZ.Text := PLZ;
      EdOrt.Text := Ort;
    End;
    If ShowModal = mrOk then
    With Umschlaege[Length(Umschlaege)-1] do
    Begin
      ShortName := AddrEd.Text;
      Adr1 := EdAdr1.Text;
      Adr2 := EdAdr2.Text;
      Adr3 := EdAdr3.Text;
      PLZ := EdPLZ.Text;
      Ort := EdOrt.Text;
    End;
  End;
  LoadGroup;
end;

procedure TFrm_Umschlag.Button1Click(Sender: TObject);
Var
  I : Integer;
begin      
  If AddrBox.ItemIndex > -1 then
  If MessageDlg('Wollen Sie diese Adresse wirklich löschen?', mtConfirmation,
                [mbYes, mbNo], 0) = mrYes then
  Begin     
    For I := Integer(AddrBox.Items.Objects[AddrBox.ItemIndex]) to Length(Umschlaege)-2 do
      Umschlaege[I] := Umschlaege[I+1];
    SetLength(Umschlaege, Length(Umschlaege)-1);
  End;
end;

procedure TFrm_Umschlag.Button8Click(Sender: TObject);
begin
  Close;
end;

procedure TFrm_Umschlag.Button9Click(Sender: TObject);
begin
  If PgSetup.Execute then
  Begin
  End;
end;

procedure TFrm_Umschlag.FormCreate(Sender: TObject);
begin
  UmschlagPic := TBitmap.Create;
  TextPic := TBitmap.Create;
  BtlPic := TBitmap.Create;
  BtlPic.LoadFromFile('FJgBtl.bmp');
  UmschlagPic.Width := 4020;
  UmschlagPic.Height := 1420;

  TextPic.Canvas.Font.Size := 144;
  TextPic.Canvas.Font.Style := TextPic.Canvas.Font.Style + [fsBold];
  TextPic.Height := TextPic.Canvas.TextHeight('XYZxyzXYZxyzXYZxyzXYZxyzXYZxyzXYZxyzXYZxyzXYZxyz');
  TextPic.Width := TextPic.Canvas.TextWidth('XYZxyzXYZxyzXYZxyzXYZxyzXYZxyzXYZxyzXYZxyzXYZxyz');
  TextPic.Transparent := True;

  UmschlagPic.Canvas.StretchDraw(Rect(0, 676, 584, 1420), BtlPic);
  BtlPic.Free;
  With UmschlagPic.Canvas do
  Begin
    TextPic.Canvas.FillRect(TextPic.Canvas.ClipRect);
    TextPic.Canvas.TextOut(0, 0, '2./ Feldjägerbataillon 350');
    StretchDraw(Rect(0, 0, 2000, 100), TextPic);
    TextPic.Canvas.FillRect(TextPic.Canvas.ClipRect);
    TextPic.Canvas.TextOut(0, 0, 'Postfach 51 03 53');
    StretchDraw(Rect(0, 120, 2000, 220), TextPic);
    TextPic.Canvas.FillRect(TextPic.Canvas.ClipRect);
    TextPic.Canvas.TextOut(0, 0, '13365 Berlin');
    StretchDraw(Rect(0, 340, 2000, 440), TextPic);
  End;
end;

procedure TFrm_Umschlag.FormDestroy(Sender: TObject);
begin
  UmschlagPic.Free;
  TextPic.Free;
end;

procedure TFrm_Umschlag.PgSetupDrawEnvStamp(Sender: TObject;
  Canvas: TCanvas; PageRect: TRect; var DoneDrawing: Boolean);
begin
  DoneDrawing := True;
end;

procedure TFrm_Umschlag.PgSetupDrawMargin(Sender: TObject; Canvas: TCanvas;
  PageRect: TRect; var DoneDrawing: Boolean);
begin
  Canvas.StretchDraw(PageRect, UmschlagPic);
  DoneDrawing := True;
end;

end.
