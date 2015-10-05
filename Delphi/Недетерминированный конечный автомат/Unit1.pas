unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, XPMan, ComCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    E_Q: TEdit;
    E_E: TEdit;
    E_q0: TEdit;
    E_F: TEdit;
    SG_d: TStringGrid;
    Label5: TLabel;
    B_Accept: TButton;
    Label6: TLabel;
    E_S: TEdit;
    XPManifest1: TXPManifest;
    Button1: TButton;
    TV_Res: TTreeView;
    procedure B_AcceptClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function Solution(tq:Char; tn:Integer):Boolean;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  F,E,Q,s:String;
  TTN:TTreeNode;

implementation

{$R *.dfm}

procedure TForm1.B_AcceptClick(Sender: TObject);
var
  i:Integer;
begin
  i:=2;
  while i<=length(E_Q.Text)
  do
    if Pos(E_Q.Text[i],Copy(E_Q.Text,1,i-1))>0
    then
      E_Q.Text:=Copy(E_Q.Text,1,i-1)+Copy(E_Q.Text,i+1,255)
    else
      i:=i+1;
  i:=2;
  while i<=length(E_E.Text)
  do
    if Pos(E_E.Text[i],Copy(E_E.Text,1,i-1))>0
    then
      E_E.Text:=Copy(E_E.Text,1,i-1)+Copy(E_E.Text,i+1,255)
    else
      i:=i+1;
  SG_d.ColCount:=length(E_Q.Text)+1;
  SG_d.RowCount:=length(E_E.Text)+1;
  for i:=1 to length(E_Q.Text)
  do
    SG_d.Cells[i,0]:=E_Q.Text[i];
  for i:=1 to length(E_E.Text)
  do
    SG_d.Cells[0,i]:=E_E.Text[i];
  Q:=E_Q.Text;
  E:=E_E.Text;
  F:=E_F.Text;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  B_AcceptClick(Form1);
  SG_d.Cells[1,1]:='qw';
  SG_d.Cells[2,1]:='wt';
  SG_d.Cells[3,1]:='e';
  SG_d.Cells[4,1]:='r';
  SG_d.Cells[1,2]:='qe';
  SG_d.Cells[2,2]:='w';
  SG_d.Cells[3,2]:='et';
  SG_d.Cells[4,2]:='r';
  SG_d.Cells[1,3]:='qr';
  SG_d.Cells[2,3]:='w';
  SG_d.Cells[3,3]:='e';
  SG_d.Cells[4,3]:='rt';
end;

function TForm1.Solution(tq:Char; tn:Integer):Boolean;
var
  i:Integer;
  ss,sg:string;

begin
  TTN:=TTreeNode.Create(TV_Res.Items);
  TTN:=TV_Res.Items.AddChild(TV_Res.Selected,tq+' '''+Copy(s,tn,255)+''' '+IntToStr(tn));
  TV_Res.Selected:=TTN;
  if tn>Length(s)
  then
    begin
      Solution:=Pos(tq,F)>0;
      Exit;
    end;
  sg:=SG_d.Cells[Pos(tq,Q),Pos(s[tn],E)];
  for i:=1 to Length(sg)
  do
    if Solution(sg[i],tn+1)
    then
      begin
        Solution:=True;
        Exit;
      end;
  TV_Res.Selected:=TV_Res.Selected.Parent;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  i:Integer;
begin
  s:=E_S.Text;
  TV_Res.Items.Clear;
  TTN:=TTreeNode.Create(TV_Res.Items);
  TTN:=TV_Res.Items.Add(TTN,E_q0.Text[1]+'---'''+s+'''---'+F);
  TV_Res.Selected:=TTN;
  if Solution(E_q0.Text[1],1)
  then
    ShowMessage('Автомат распознан!!!')
  else
    ShowMessage('!!!ACHTUNG!!!');
end;

end.
