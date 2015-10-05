unit UMethodD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls, StdCtrls, Spin, Buttons, Math, XPMan;

type
  TForm1 = class(TForm)
    L1: TLabel;
    P1: TPanel;
    SG_A: TStringGrid;
    P2: TPanel;
    SG_CD: TStringGrid;
    SE_n: TSpinEdit;
    L2: TLabel;
    BB_Circuit: TBitBtn;
    B_Fill: TButton;
    SG_L: TStringGrid;
    L3: TLabel;
    E_InhValue: TEdit;
    E_Spur: TEdit;
    SG_Vectors: TStringGrid;
    SG_CheckAX: TStringGrid;
    SG_CheckLX: TStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    XPManifest1: TXPManifest;
    procedure FormCreate(Sender: TObject);
    procedure SE_nChange(Sender: TObject);
    procedure BB_CircuitClick(Sender: TObject);
    procedure B_FillClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TMyMatr=array[1..25,1..25] of Real;
  TMyMas=array[1..25] of Real;

var
  Form1:TForm1;
  e:Real;
implementation

{$R *.dfm}

//*****************************************************************************
function mE(n:Integer):TMyMatr;
var
  i,j:Byte;
begin
  for j:=1 to n
  do
    for i:=1 to n
    do
      if i=j
      then
        mE[i,j]:=1
      else
        mE[i,j]:=0;
end;

function CalcMatrix_M(a:TMyMatr; n,nm:Integer):TMyMatr;
var
  i,j:Byte;
  M:TMyMatr;
begin
  M:=mE(n);
  for i:=1 to n
  do
    if i<>nm
    then
      M[nm,i]:=-a[nm+1,i]/a[nm+1,nm]
    else
      M[i,i]:=1/a[nm+1,nm];
  CalcMatrix_M:=M;
end;

function CalcMatrix_backM(a:TMyMatr; n,nm:Integer):TMyMatr;
var
  i,j:Byte;
  M:TMyMatr;
begin
  M:=mE(n);
  for i:=1 to n
  do
    M[nm,i]:=a[nm+1,i];
  CalcMatrix_backM:=M;
end;

procedure Calc_Sigma(var a:TMyMatr; n:Integer);
var
  i,j:Integer;
  S:Real;
begin
  for i:=1 to n
  do
    begin
      a[i,n+1]:=0;
      S:=0;
      for j:=1 to n
      do
        S:=S+a[i,j];
      a[i,n+1]:=S;
    end;
end;

procedure MulMatrix(b,c:TMyMatr; var g:TMyMatr; var n:Integer); {умножение матрицы b*c}
var
  ii,jj,kk:Integer;
  resA:Real;
begin
  for ii:=1 to n
  do
    begin
      for jj:=1 to n
      do
        begin
          resA:=0;
          for kk:=1 to n
          do
            begin
              resA:=resA+b[ii,kk]*c[kk,jj];
            end;
          g[ii,jj]:=resA;
        end;
    end;
end;

procedure InvRow(var a:TMyMatr; nst1,nst2,m:Byte);
var
  j:Byte;
  buf:Real;
begin
  for j:=1 to m
  do
    begin
      buf:=a[nst1,j];
      a[nst1,j]:=a[nst2,j];
      a[nst2,j]:=buf;
    end;
end;

procedure InvCol(var a:TMyMatr; nst1,nst2,m:Byte);
var
  j:Byte;
  buf:Real;
begin
  for j:=1 to m
  do
    begin
      buf:=a[j,nst1];
      a[j,nst1]:=a[j,nst2];
      a[j,nst2]:=buf;
    end;
end;

function Fun(x,p1,p2,p3,p4:Real):Real;
begin
  Fun:=Sqr(Sqr(x))-p1*Sqr(x)*x-p2*Sqr(x)-p3*x-p4;
end;

function Deriv1(x,p1,p2,p3,p4:Real):Real;
var
  del:Real;
begin
  del:=e/10;
  Deriv1:=(Fun(x+del,p1,p2,p3,p4)-Fun(x,p1,p2,p3,p4))/del;
end;

function Deriv2(x,p1,p2,p3,p4:Real):Real;
var
  del:Real;
begin
  del:=e/10;
  Deriv2:=(Deriv1(x+del,p1,p2,p3,p4)-Deriv1(x,p1,p2,p3,p4))/del;
end;

procedure MethodHK(aa,bb,p1,p2,p3,p4:Real; var Xx:Real; i:Integer);
var
  j:Integer;
  a,b:array of Real;
begin
  SetLength(a,1000);
  SetLength(b,1000);
  a[1]:=aa;
  b[1]:=bb;
  j:=1;
  while abs(a[j]-b[j])>=e
  do
    begin
      a[j+1]:=a[j]-(Fun(a[j],p1,p2,p3,p4)*(b[1]-a[j]))/(Fun(b[1],p1,p2,p3,p4)-Fun(a[j],p1,p2,p3,p4));
      b[j+1]:=b[j]-Fun(b[j],p1,p2,p3,p4)/Deriv1(b[j],p1,p2,p3,p4);
      j:=j+1;
      Xx:=(a[j]+b[j])/2;
    end;
  a:=nil;
  b:=nil;
end;

procedure GetL(p1,p2,p3,p4:Real; n:Byte; var X:TMyMas);
var
  i,j,k,l,Kint:Integer;
  h,c,d,An,Bn:Real;
  Nev,X0,a1,b1:TMyMas;
begin
  e:=0.001;
  An:=-10000;
  Bn:=10000;
  i:=1;
  j:=0;
  k:=0;
  c:=An;
  h:=e*100;
  //поиск интервалов
  while c<Bn
  do
    begin
      d:=c+h;
      if Fun(c,p1,p2,p3,p4)*Fun(d,p1,p2,p3,p4)<=0
      then
        begin
          j:=j+1;
          a1[j]:=c;
          b1[j]:=d;
        end;
      c:=d;
    end;
  Kint:=j;
  //вычисление корней
  for i:=1 to Kint
  do
    begin
      X0[i]:=(a1[i]+b1[i])/2;
      if (Deriv1(X0[i],p1,p2,p3,p4)*Deriv2(X0[i],p1,p2,p3,p4)>0)
      then
        MethodHK(a1[i],b1[i],p1,p2,p3,p4,X[i],i)
      else
        MethodHK(b1[i],a1[i],p1,p2,p3,p4,X[i],i);
      Nev[i]:=abs(0-Fun(X[i],p1,p2,p3,p4));
    end;
end;


procedure GetVector(InValue:TMyMas; var Vect:TMyMatr; n:Integer; A:TMyMatr);
var
  i,k,j,l:Integer;
  S:Real;
  V:TMyMas;
  M:TMyMatr;
begin
  for k:=1 to n
  do
    begin
      Vect[n,k]:=1;
      for i:=n-1 downto 1
      do
        Vect[i,k]:=Power(InValue[k],n-i);
    end;
  for l:=1 to n
  do
    for i:=1 to n-1
    do
      begin
        S:=0;
        for j:=0 to n
        do
          S:=S+(A[i,j]*Vect[j,l]);
        Vect[i,l]:=S;
      end;
end;

procedure MulMatrixVector(a:TMyMatr; g:TMyMas; n:Integer; var V:TMyMatr);
var
  i,j:Integer;
  S:Real;
begin
  for i:=1 to n
  do
    for j:=1 to n
    do
      V[j,i]:=g[i]*a[j,i];
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  SG_CD.Cells[0,0]:='№';
  SG_CD.Cells[1,0]:='M^-1';
  SG_CD.Cells[2,0]:='1';
  SG_CD.Cells[3,0]:='2';
  SG_CD.Cells[4,0]:='3';
  SG_CD.Cells[5,0]:='4';
  SG_CD.Cells[6,0]:='E';
  SG_CD.Cells[7,0]:='E`';
end;

procedure TForm1.SE_nChange(Sender: TObject);
var
  i:Byte;
begin
  SG_L.ColCount:=SE_n.Value;
  SG_A.RowCount:=SE_n.Value;
  SG_A.ColCount:=SE_n.Value;
  SG_CD.ColCount:=SE_n.Value+4;
  SG_CD.Cells[0,0]:='№';
  SG_CD.Cells[1,0]:='M^-1';
  for i:=1 to SE_n.Value
  do
    SG_CD.Cells[1+i,0]:=IntToStr(i);
  SG_CD.Cells[SE_n.Value+2,0]:='E';
  SG_CD.Cells[SE_n.Value+3,0]:='E`';
end;



procedure TForm1.BB_CircuitClick(Sender: TObject);
var
  n,i,j,l,k,LS:Integer;
  A,M,bM,B,C,AA,Vect,V_M,PrVm,PrViv:TMyMatr;
  dS,SIV,Ssm,S:Real;
  IV:TMyMas;
begin
  n:=4;
  for i:=1 to n
  do
    for j:=1 to n
    do
      A[i,j]:=StrToFloat(SG_A.Cells[j-1,i-1]);
  SG_CD.RowCount:=n+1;
  Calc_Sigma(A,n);
  AA:=A;
  for i:=1 to n
  do
    begin
      for j:=1 to n+1
      do
        SG_CD.Cells[j+1,i]:=FloatToStr(RoundTo(A[i,j],-3));
      SG_CD.Cells[0,i]:=IntToStr(i);
    end;
  B:=A;
  for l:=1 to n-1
  do
    begin
      LS:=SG_CD.RowCount;
      SG_CD.RowCount:=LS+n+2;
      M:=CalcMatrix_M(B,n+1,n-l);
      for i:=1 to n
      do
        V_M[n-l,i]:=M[n-l,i];
      bM:=CalcMatrix_backM(B,n,n-l);
      for i:=1 to n+1
      do
        begin
          SG_CD.Cells[i+1,LS]:=FloatToStr(RoundTo(M[n-l,i],-3));
          if i=n-l
          then
            SG_CD.Cells[i+1,LS]:=SG_CD.Cells[i+1,LS]+'  |-1';
        end;
      SG_CD.Cells[0,LS]:=IntToStr(l)+'"';
      MulMatrix(A,M,B,n);
      Calc_Sigma(B,n);
      Calc_Sigma(A,n);
      for i:=1 to n
      do
        B[i,n+2]:=A[i,n+1]+A[i,n-l]*M[n-l,n+1];
      for i:=1 to n
      do
        begin
          for j:=1 to n+2
          do
            SG_CD.Cells[j+1,LS+i]:=FloatToStr(RoundTo(B[i,j],-3));
          SG_CD.Cells[0,LS+i]:=IntToStr(i+n*l);
          SG_CD.Cells[1,LS+i]:=FloatToStr(RoundTo(bM[n-l,i],-3));
        end;
      MulMatrix(bM,B,A,n);
      dS:=0;
      for i:=1 to n
      do
        dS:=dS+bM[n-l,i]*B[i,n+1];
      A[n-l,n+1]:=dS;
      for i:=1 to n+1
      do
        begin
          SG_CD.Cells[i+1,LS+n+1]:=FloatToStr(RoundTo(A[n-l,i],-3));
          SG_CD.Cells[0,LS+n+1]:=IntToStr(n*l+n-l)+'`';
        end;
      B:=A;
    end;
  //******************  выч собств. значений
  GetL(B[1,1],B[1,2],B[1,3],B[1,4],n,IV);
  for i:=1 to n
  do
    begin
      SG_L.Cells[i-1,0]:='L'+IntToStr(i);
      SG_L.Cells[i-1,1]:=FloatToStr(RoundTo(IV[i],-3));
    end;
  //********
  SIV:=0;
  for i:=1 to n
  do
    SIV:=SIV+IV[i];
  Ssm:=0;
  E_InhValue.Text:=FloatToStr(RoundTo(SIV,-3));
  for i:=1 to n
  do
    Ssm:=Ssm+AA[i,i];
  E_Spur.Text:=FloatToStr(RoundTo(Ssm,-4));
  //****************** выч собств векторов
  GetVector(IV,Vect,n,V_M);
  for i:=1 to n
  do
    begin
      SG_Vectors.Cells[i-1,0]:='V'+IntToStr(i);
      for j:=1 to n
      do
        SG_Vectors.Cells[j-1,i]:=FloatToStr(RoundTo(Vect[i,j],-4));
    end;
  MulMatrix(AA,Vect,PrVm,n);
  MulMatrixVector(Vect,IV,n,PrViv);
  for j:=1 to n
  do
    for i:=1 to n
    do
      begin
        SG_CheckAX.Cells[i-1,j-1]:=FloatToStr(RoundTo(PrVm[j,i],-3));
        SG_CheckLX.Cells[i-1,j-1]:=FloatToStr(RoundTo(PrViv[j,i],-3));
      end;
end;

procedure TForm1.B_FillClick(Sender: TObject);
begin
  SE_n.Value:=4;
  SG_A.Cells[0,0]:='1';
  SG_A.Cells[0,1]:='2';
  SG_A.Cells[0,2]:='3';
  SG_A.Cells[0,3]:='4';
  SG_A.Cells[1,0]:='2';
  SG_A.Cells[1,1]:='1';
  SG_A.Cells[1,2]:='2';
  SG_A.Cells[1,3]:='3';
  SG_A.Cells[2,0]:='3';
  SG_A.Cells[2,1]:='2';
  SG_A.Cells[2,2]:='1';
  SG_A.Cells[2,3]:='2';
  SG_A.Cells[3,0]:='4';
  SG_A.Cells[3,1]:='3';
  SG_A.Cells[3,2]:='2';
  SG_A.Cells[3,3]:='1';
end;

end.
