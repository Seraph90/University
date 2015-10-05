unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, XPMan, StdCtrls, Math;

type
  TMyRec=record
    Gr,R,Ymn,Ymx,Xs,Xf,dX:String;
  end;

  TForm2 = class(TForm)
    SG_R: TStringGrid;
    SG_AR: TStringGrid;
    SG_P: TStringGrid;
    XPManifest1: TXPManifest;
    Button1: TButton;
    procedure FormActivate(Sender: TObject);
    procedure B_FTRClick(Sender: TObject);
    function GetRec(tn,Table:Byte):TMyRec;
    procedure Switch(tn1,tn2,Table:Byte);
    procedure PushRec(tRec:TMyRec; tn,Table:Byte);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Form2: TForm2;

implementation

uses DateUtils, Unit1;

{$R *.dfm}
function TForm2.GetRec(tn,Table:Byte):TMyRec;
var
  tRec:TMyRec;
  SG:TStringGrid;
begin
  case Table
  of
    1:SG:=SG_R;
    2:SG:=SG_AR;
  end;
  with tRec
  do
    begin
      Gr:=SG.Cells[0,tn];
      R:=SG.Cells[1,tn];
      Ymn:=SG.Cells[2,tn];
      Ymx:=SG.Cells[3,tn];
      Xs:=SG.Cells[4,tn];
      Xf:=SG.Cells[5,tn];
      dX:=SG.Cells[6,tn];
    end;
  GetRec:=tRec;
end;

procedure TForm2.PushRec(tRec:TMyRec; tn,Table:Byte);
var
  SG:TStringGrid;
begin
  case Table
  of
    1:SG:=SG_R;
    2:SG:=SG_AR;
  end;
  with tRec
  do
    begin
      SG.Cells[0,tn]:=Gr;
      SG.Cells[1,tn]:=R;
      SG.Cells[2,tn]:=Ymn;
      SG.Cells[3,tn]:=Ymx;
      SG.Cells[4,tn]:=Xs;
      SG.Cells[5,tn]:=Xf;
      SG.Cells[6,tn]:=dX;
    end;
end;

procedure TForm2.Switch(tn1,tn2,Table:Byte);
var
  b:TMyRec;
begin
  b:=GetRec(tn1,Table);
  PushRec(GetRec(tn2,Table),tn1,Table);
  PushRec(b,tn2,Table);
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
  SG_R.Cells[0,0]:='Группа';
  SG_R.Cells[1,0]:='Ребро';
  SG_R.Cells[2,0]:='Y min';
  SG_R.Cells[3,0]:='Y max';
  SG_R.Cells[4,0]:='X нач';
  SG_R.Cells[5,0]:='X кон';
  SG_R.Cells[6,0]:='dX';

  SG_AR.Cells[0,0]:='Группа';
  SG_AR.Cells[1,0]:='Ребро';
  SG_AR.Cells[2,0]:='Y min';
  SG_AR.Cells[3,0]:='Y max';
  SG_AR.Cells[4,0]:='X нач';
  SG_AR.Cells[5,0]:='X кон';
  SG_AR.Cells[6,0]:='dX';

  {>
  SG_AR.Cells[0,0]:='Ребро';
  SG_AR.Cells[1,0]:='Y нач';
  SG_AR.Cells[2,0]:='X нач';
  SG_AR.Cells[3,0]:='dX';
  <}

  SG_P.Cells[0,0]:='P';
  SG_P.Cells[1,0]:='X';
  SG_P.Cells[2,0]:='Y';

  SG_P.Cells[0,1]:='A';
  SG_P.Cells[1,1]:='10';
  SG_P.Cells[2,1]:='20';
  SG_P.Cells[0,2]:='B';
  SG_P.Cells[1,2]:='40';
  SG_P.Cells[2,2]:='80';
  SG_P.Cells[0,3]:='C';
  SG_P.Cells[1,3]:='80';
  SG_P.Cells[2,3]:='60';
  SG_P.Cells[0,4]:='D';
  SG_P.Cells[1,4]:='70';
  SG_P.Cells[2,4]:='20';
  SG_P.Cells[0,5]:='E';
  SG_P.Cells[1,5]:='50';
  SG_P.Cells[2,5]:='40';
end;

procedure TForm2.B_FTRClick(Sender: TObject);
var
  Rec1,Rec2:TMyRec;
  i,j,n,k,y1,y2:Integer;
  x1,x2,dx,dy:Real;
begin
  n:=SG_P.RowCount-1;
  Form1.Image1.Canvas.MoveTo(StrToInt(SG_P.Cells[1,1]),StrToInt(SG_P.Cells[2,1]));
  for i:=1 to n
  do
    Form1.Image1.Canvas.LineTo(StrToInt(SG_P.Cells[1,(i mod n)+1]),StrToInt(SG_P.Cells[2,(i mod n)+1]));
  SG_R.RowCount:=n+1;
  for i:=1 to n
  do
    begin
      SG_R.Cells[1,i]:=SG_P.Cells[0,i]+SG_P.Cells[0,(i mod n)+1];
      SG_R.Cells[2,i]:=IntToStr(Min(StrToInt(SG_P.Cells[2,i]),StrToInt(SG_P.Cells[2,(i mod n)+1])));
      SG_R.Cells[3,i]:=IntToStr(Max(StrToInt(SG_P.Cells[2,i]),StrToInt(SG_P.Cells[2,(i mod n)+1])));
      SG_R.Cells[4,i]:=IntToStr(Min(StrToInt(SG_P.Cells[1,i]),StrToInt(SG_P.Cells[1,(i mod n)+1])));
      SG_R.Cells[5,i]:=IntToStr(Max(StrToInt(SG_P.Cells[1,i]),StrToInt(SG_P.Cells[1,(i mod n)+1])));
      SG_R.Cells[6,i]:=FloatToStr((StrToInt(SG_R.Cells[5,i])-StrToInt(SG_R.Cells[4,i]))/(StrToInt(SG_R.Cells[3,i])-StrToInt(SG_R.Cells[2,i])));
    end;
  for i:=1 to n-1
  do
    for j:=i to n
    do
      begin
        Rec1:=GetRec(i,1);
        Rec2:=GetRec(j,1);
        if (StrToInt(Rec1.Ymn)>StrToInt(Rec2.Ymn)) or ((StrToInt(Rec1.Ymn)=StrToInt(Rec2.Ymn)) and (StrToInt(Rec1.Xs)>StrToInt(Rec2.Xs)))
        then
          Switch(i,j,1);
      end;
  SG_R.Cells[0,1]:='1';
  k:=1;
  for i:=2 to n
  do
    begin
      Rec1:=GetRec(i-1,1);
      Rec2:=GetRec(i,1);
      if k=1
      then
        begin
          SG_AR.RowCount:=i;
          SG_AR.Cells[0,i-1]:=Rec1.Gr;
          SG_AR.Cells[1,i-1]:=Rec1.R;
          SG_AR.Cells[2,i-1]:=Rec1.Ymn;
          SG_AR.Cells[3,i-1]:=Rec1.Ymx;
          SG_AR.Cells[4,i-1]:=Rec1.Xs;
          SG_AR.Cells[5,i-1]:=Rec1.Xf;
          SG_AR.Cells[6,i-1]:=Rec1.dX;
          {>
          SG_AR.Cells[0,i-1]:=Rec1.R;
          SG_AR.Cells[1,i-1]:=Rec1.Ymn;
          SG_AR.Cells[2,i-1]:=Rec1.Xs;
          SG_AR.Cells[3,i-1]:=Rec1.dX;
          <}
        end;
      if Rec1.Ymn<Rec2.Ymn
      then
        k:=k+1;
      SG_R.Cells[0,i]:=IntToStr(k);
    end;
  Application.ProcessMessages;
  Rec1:=GetRec(1,2);
  Rec2:=GetRec(2,2);
  y1:=StrToInt(Rec1.Ymn);
  y2:=Min(StrToInt(Rec1.Ymx),StrToInt(Rec2.Ymx));
  x1:=StrToFloat(Rec1.Xs);
  x2:=StrToFloat(Rec2.Xs);
  while y1<y2
  do
    begin
      y1:=y1+1;
      x1:=x1+StrToFloat(Rec1.dX);
      x2:=x2+StrToFloat(Rec2.dX);
      for i:=1 to 3000000
      do
        Application.ProcessMessages;
      Form1.Line_B(Round(x1),y1,Round(x2),y1,Form1.Image1);
    end;
end;

end.
