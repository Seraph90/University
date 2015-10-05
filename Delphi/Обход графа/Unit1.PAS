unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Grids, XPMan, Buttons, Math, ExtCtrls, Spin;

type
  TForm1 = class(TForm)
    XPManifest1: TXPManifest;
    SG_A: TStringGrid;
    BB_Ok: TBitBtn;
    Image1: TImage;
    SG_XY: TStringGrid;
    SG_L: TStringGrid;
    BB_Redraw: TBitBtn;
    E_n: TSpinEdit;
    BB_Solve: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    BB_PF: TBitBtn;
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure E_nChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BB_OkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BB_RedrawClick(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BB_SolveClick(Sender: TObject);
    procedure BB_PFClick(Sender: TObject);
  private
    procedure Redraw;
    procedure FindLR;
    procedure PathFinder(tp1:Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

type
  TMyMat=array[1..12,1..12] of Real;

var
  Form1: TForm1;
  num,n:Integer;
  A:TMyMat;
  XY:array[1..12,1..2] of Integer;
  p1,p2,pl,pr,Step,MStep:Integer;
  Path:string;

implementation

{$R *.dfm}

function ReadMat(tnn,tnn2,tn,tn2:Integer; tSG:TStringGrid):TMyMat;
var
  i,j:Integer;
  tR:TMyMat;
begin
  for i:=1 to tn2
  do
    for j:=1 to tn
    do
      tR[j,i]:=StrToFloat(tSG.Cells[j+tnn-2,i+tnn2-2]);
  ReadMat:=tR;
end;

procedure WriteMat(tA:TMyMat; tnn,tnn2,tn,tn2:Integer; tSG:TStringGrid; k:Integer);
var
  i,j:Integer;
begin
  for i:=1 to tn2
  do
    for j:=1 to tn
    do
      tSG.Cells[j+tnn-2,i+tnn2-2]:=FloatToStr(RoundTo(tA[j,i],k));
end;

function Radius(tx,ty:Real):Real;
begin
  Radius:=Sqrt(tx*tx+ty*ty);
end;

function fAngle(tx,ty:Real):Real;
begin
  if tx=0
  then
    if ty>0
    then
      fAngle:=3.14/2
    else
      fAngle:=3*3.14/2
  else
    if tx>0
    then
      if ty>0
      then
        fAngle:=ArcTan(ty/tx)
      else
        fAngle:=2*3.14+ArcTan(ty/tx)
    else
      fAngle:=3.14+ArcTan(ty/tx);
end;

procedure TForm1.FindLR;
var
  j:Integer;
  p3,p4:Integer;
  dx3,dx4,dy3,dy4,x2,x3,x4,y2,y3,y4:Real;
  a,b:Real;
begin
  p3:=0;
  p4:=0;
  for j:=1 to n
  do
    if (SG_A.Cells[j,p2]='1') and (j<>p1)
    then
      if p3=0
      then
        p3:=j
      else
        p4:=j;

  x2:=XY[p1,1]-XY[p2,1];
  y2:=XY[p1,2]-XY[p2,2];
  dx3:=XY[p3,1]-XY[p2,1];
  dy3:=XY[p3,2]-XY[p2,2];
  dx4:=XY[p4,1]-XY[p2,1];
  dy4:=XY[p4,2]-XY[p2,2];
  a:=fAngle(x2,y2);
  {>
  dx1:=XY[p1,1]-XY[p2,1];
  dy1:=XY[p1,2]-XY[p2,2];
  b:=fAngle(dx1,dy1)-a;
  {<}
  x3:=Radius(dx3,dy3)*cos(fAngle(dx3,dy3)-a);
  y3:=Radius(dx3,dy3)*sin(fAngle(dx3,dy3)-a);
  x4:=Radius(dx4,dy4)*cos(fAngle(dx4,dy4)-a);
  y4:=Radius(dx4,dy4)*sin(fAngle(dx4,dy4)-a);
  {>
  Image1.Canvas.Pen.Color:=$cccccc;
  Image1.Canvas.Ellipse(XY[p2,1]+Round(x1-15),XY[p2,2]+Round(y1-15),XY[p2,1]+Round(x1+15),XY[p2,2]+Round(y1+15));
  Image1.Canvas.TextOut(XY[p2,1]+Round(x1-5),XY[p2,2]+Round(y1-5),'1''');
  Image1.Canvas.Ellipse(XY[p2,1]+Round(x3-15),XY[p2,2]+Round(y3-15),XY[p2,1]+Round(x3+15),XY[p2,2]+Round(y3+15));
  Image1.Canvas.TextOut(XY[p2,1]+Round(x3-5),XY[p2,2]+Round(y3-5),'3''');
  Image1.Canvas.Ellipse(XY[p2,1]+Round(x4-15),XY[p2,2]+Round(y4-15),XY[p2,1]+Round(x4+15),XY[p2,2]+Round(y4+15));
  Image1.Canvas.TextOut(XY[p2,1]+Round(x4-5),XY[p2,2]+Round(y4-5),'4''');
  {<}
  if (y3<0)=(y4>0)
  then
    begin
      if y3<0
      then
        begin
          pl:=p4;
          pr:=p3;
        end
      else
        begin
          pl:=p3;
          pr:=p4;
        end;
    end
  else
    begin
      a:=fAngle(x3,y3);
      b:=fAngle(x4,y4);
      if(a<0)and(y3>0)
      then
        a:=a+3.14;
      if(b<0)and(y4>0)
      then
        b:=b+3.14;
      if a<b
      then
        begin
          pl:=p3;
          pr:=p4;
        end
      else
        begin
          pl:=p4;
          pr:=p3;
        end;
    end;
end;

procedure TForm1.Redraw;
var
  i,j,k:Integer;
begin
  for i:=1 to n
  do
    begin
      XY[i,1]:=StrToInt(SG_XY.Cells[1,i]);
      XY[i,2]:=StrToInt(SG_XY.Cells[2,i]);
    end;
  k:=0;
  Image1.Canvas.FillRect(Form1.Image1.Canvas.ClipRect);
  for i:=1 to n
  do
    for j:=i+1 to n
    do
      begin
        if A[j,i]=1
        then
          begin
            Inc(k);
            SG_L.Cells[0,k]:=IntToStr(i)+'-'+IntToStr(j);
            SG_L.Cells[1,k]:=FloatToStr(RoundTo(Sqrt(Sqr(XY[j,1]-XY[i,1])+Sqr(XY[j,2]-XY[i,2])),-3));
            Image1.Canvas.MoveTo(XY[i,1],XY[i,2]);
            Image1.Canvas.LineTo(XY[j,1],XY[j,2]);
          end;
      end;
  for i:=1 to n
  do
    begin
      Image1.Canvas.Ellipse(XY[i,1]-15,XY[i,2]-15,XY[i,1]+15,XY[i,2]+15);
      Image1.Canvas.TextOut(XY[i,1]-5,XY[i,2]-5,IntToStr(i));
    end;
end;

procedure TForm1.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  if Button=btNext
  then
    E_n.Text:=IntToStr(StrToInt(E_n.Text)+2)
  else
    E_n.Text:=IntToStr(StrToInt(E_n.Text)-2);
end;

procedure TForm1.E_nChange(Sender: TObject);
var
  i,j,x,y,k,k1,k2,q:Integer;
begin
  n:=StrToInt(E_n.Text);
  k:=(n*3) div 2;
  SG_A.ColCount:=n+1;
  SG_A.RowCount:=n+1;
  SG_XY.RowCount:=n+1;
  SG_L.RowCount:=k+1;
  SG_L.Cells[1,0]:='L';
  repeat
    k:=(n*3) div 2;
    for i:=1 to n
    do
      begin
        SG_A.Cells[i,0]:=IntToStr(i);
        SG_A.Cells[0,i]:=IntToStr(i);
        SG_XY.Cells[0,i]:=IntToStr(i);
        for j:=1 to n
        do
          SG_A.Cells[j,i]:='0';
      end;
    repeat
      q:=0;
      repeat
        x:=Random(n)+1;
        y:=Random(n)+1;
        q:=q+1;
        if (SG_A.Cells[x,y]='0') and (x<>y)
        then
          begin
            k1:=0;
            k2:=0;
            for i:=1 to n
            do
              begin
                if SG_A.Cells[x,i]='1'
                then
                  Inc(k1);
                if SG_A.Cells[i,y]='1'
                then
                  Inc(k2);
              end;
            if (k1<3) and (k2<3)
            then
              begin
                SG_A.Cells[x,y]:='1';
                SG_A.Cells[y,x]:='1';
                Break;
              end;
          end;
        Application.ProcessMessages;
        if q>n*n*n*n
        then
          Break;
      until False;
      if q>n*n*n*n
      then
        Break;
      Dec(k);
    until k<=0;
  until k<=0;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  E_nChange(Form1);
  BB_Ok.Click;
end;

procedure TForm1.BB_OkClick(Sender: TObject);
var
  i,j,k:Integer;
begin
  A:=ReadMat(2,2,n,n,SG_A);
  for i:=1 to n
  do
    for j:=1 to n
    do
      A[i,j]:=A[j,i];
  WriteMat(A,2,2,n,n,SG_A,0);
  for i:=1 to n
  do
    begin
      if A[i,i]<>0
      then
        ShowMessage('Achtung!!!');
      k:=0;
      for j:=1 to n
      do
        if A[j,i]<>0
        then
          inc(k);
      if k<>3
      then
        ShowMessage('Achtung!!!');
    end;
  for i:=1 to n
  do
    begin
      XY[i,1]:=Random(Image1.ClientWidth-40)+20;
      XY[i,2]:=Random(Image1.ClientHeight-40)+20;
      SG_XY.Cells[1,i]:=IntToStr(XY[i,1]);
      SG_XY.Cells[2,i]:=IntToStr(XY[i,2]);
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Randomize;
  SG_XY.ColCount:=3;
  SG_L.ColCount:=2;
  SG_XY.Cells[1,0]:='x';
  SG_XY.Cells[2,0]:='y';
  Image1.Canvas.FillRect(Image1.Canvas.ClipRect);
end;

procedure TForm1.BB_RedrawClick(Sender: TObject);
begin
  Redraw;
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  i:Integer;
begin
  for i:=1 to n
  do
    if Sqrt(Sqr(x-XY[i,1])+Sqr(y-XY[i,2]))<=15
    then
      begin
        num:=i;
        Break;
      end;
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if num=0
  then
    Abort;
  SG_XY.Cells[1,num]:=IntToStr(x);
  SG_XY.Cells[2,num]:=IntToStr(y);
  Redraw;
  num:=0;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if num=0
  then
    Abort;
  SG_XY.Cells[1,num]:=IntToStr(x);
  SG_XY.Cells[2,num]:=IntToStr(y);
  Redraw;
end;

procedure TForm1.BB_SolveClick(Sender: TObject);
var
  i:Integer;
procedure DrawO_o;
begin
  Image1.Canvas.LineTo(XY[p2,1],XY[p2,2]);
  Image1.Canvas.Ellipse(XY[p1,1]-15,XY[p1,2]-15,XY[p1,1]+15,XY[p1,2]+15);
  Image1.Canvas.TextOut(XY[p1,1]-5,XY[p1,2]-5,IntToStr(p1));
  Image1.Canvas.Ellipse(XY[p2,1]-15,XY[p2,2]-15,XY[p2,1]+15,XY[p2,2]+15);
  Image1.Canvas.TextOut(XY[p2,1]-5,XY[p2,2]-5,IntToStr(p2));
end;

begin
  Redraw;
  p1:=StrToInt(Edit1.Text);
  p2:=StrToInt(Edit2.Text);
  Image1.Canvas.Pen.Color:=clLime;
  Image1.Canvas.Pen.Width:=5;
  Image1.Canvas.MoveTo(XY[p1,1],XY[p1,2]);
  Edit4.Text:=IntToStr(p1)+IntToStr(p2);
  DrawO_o;
  for i:=1 to length(Edit3.Text)
  do
    begin
      FindLR;
      p1:=p2;
      if Edit3.Text[i]='L'
      then
        begin
          p2:=pl;
          Image1.Canvas.Pen.Color:=clLime;
        end
      else
        begin
          p2:=pr;
          Image1.Canvas.Pen.Color:=clRed;
        end;
      DrawO_o;
      Edit4.Text:=Edit4.Text+IntToStr(p2);
    end;
  Image1.Canvas.Pen.Color:=clBlack;
  Image1.Canvas.Pen.Width:=1;
end;

procedure TForm1.PathFinder(tp1:Integer);
var
  i:Integer;
begin
  for i:=1 to n
  do
    begin
//    if (A[tp1,i]=1) and ((Pos(Copy(IntToStr(100+i),2,2),Edit4.Text) mod 2)=0)
    if (SG_A.Cells[tp1,i]='1') and ((Pos(Copy(IntToStr(100+i),2,2),Edit4.Text) mod 2)=0)
    then
      begin
        //ShowMessage('Пробуем  из '+IntToStr(tp1)+' '+IntToStr(i));
        Inc(Step);
        if i=p2
        then
          begin
            //ShowMessage('Дошли до '+IntToStr(i));
            if MStep>Step
            then
              begin
                MStep:=Step;
                Path:=Edit4.Text;
              end;
            Dec(Step);
            Break;
          end
        else
          begin
            //ShowMessage('Уходим из '+IntToStr(tp1)+' в '+IntToStr(i));
            //Caption:=IntToStr(MStep)+' '+IntToStr(Step)+' '+Path;
            Edit4.Text:=Edit4.Text+Copy(IntToStr(100+i),2,2);
            PathFinder(i);
            //ShowMessage('Вернулись к '+IntToStr(tp1));
            Edit4.Text:=Copy(Edit4.Text,1,2*Step);
            Dec(Step);
            //Caption:=IntToStr(MStep)+' '+IntToStr(Step)+' '+Path;
          end;
      end
    else
      begin
        //ShowMessage('Нельзя из '+IntToStr(tp1)+' '+IntToStr(i)+' -> '+SG_A.Cells[tp1,i]);
        //SG_A.Cells[tp1,i]:='*';
      end;
  end;
end;

procedure TForm1.BB_PFClick(Sender: TObject);
var
  i:Integer;
begin
  p1:=StrToInt(Edit1.Text);
  p2:=StrToInt(Edit2.Text);
  Edit4.Text:=Copy(IntToStr(100+p1),2,2);
  Step:=0;
  MStep:=n+1;
  PathFinder(p1);
  Edit4.Text:=Path+Copy(IntToStr(100+p2),2,2);
  Edit2.Text:=IntToStr(StrToInt(Edit4.Text[3]+Edit4.Text[4]));
  Edit3.Text:='';
  p1:=StrToInt(Copy(Edit4.Text,1,2));
  p2:=StrToInt(Copy(Edit4.Text,3,2));
  for i:=3 to (length(Edit4.Text) div 2)
  do
    begin
      FindLR;
      p1:=p2;
      p2:=StrToInt(Copy(Edit4.Text,i*2-1,2));
      if p2=pl
      then
        Edit3.Text:=Edit3.Text+'L'
      else
        Edit3.Text:=Edit3.Text+'R';
    end;
end;


end.


