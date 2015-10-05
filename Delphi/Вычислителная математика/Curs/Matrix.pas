unit Matrix;

interface

uses
  SysUtils, Grids, Math;

type
  TMyMat=array[1..2,1..2] of Real;
  TMySet=set of Byte;

  function MatRimInv(tA:TMyMat; tn:Integer):TMyMat;
  //function CSch(tA:TMyMat; n1,n2,tn:Integer):TMyMat;
  //function RSch(tA:TMyMat; n1,n2,tn:Integer):TMyMat;
  function Determinate(tA:TMyMat; tn:Integer; ts:TMySet; td:Byte):Real;
  //function TransMat(tA:TMyMat; tn:integer):TMyMat;
  function MatDiv(tA:TMyMat; tn,tn2:Integer; k:Real):TMyMat;
  function SumMat(tA,tB:TMyMat; tn,tn2:Integer):TMyMat;
  function SubMat(tA,tB:TMyMat; tn,tn2:Integer):TMyMat;
  function MultMat(tA,tB:TMyMat; tn,tn1,tn2:Integer):TMyMat;

implementation

uses Classes;

function MatRimInv(tA:TMyMat; tn:Integer):TMyMat;
var
  tA1,tR,P,r,q,U,V:TMyMat;
  tDetA,a,a1,an:Real;
  ts:TMySet;
  i,j,k:Integer;
begin
  ts:=[1];
  tR:=tA;
  if tn=1
  then
    begin
      if tA[1,1]<>0
      then
        tR[1,1]:=1/tA[1,1];
    end
  else
    for k:=2 to tn
    do
      begin
        ts:=ts+[k];
        tDetA:=Determinate(tR,k,ts,1);
        if tDetA<>0
        then
          begin
            if k=2
            then
              begin
                tR[1,1]:=tA[2,2]/tDetA;
                tR[1,2]:=-tA[1,2]/tDetA;
                tR[2,1]:=-tA[2,1]/tDetA;
                tR[2,2]:=tA[1,1]/tDetA;
              end;
            for i:=1 to k-1
            do
              begin
                U[1,i]:=tR[k,i];
                V[i,1]:=tR[i,k];
                for j:=1 to k-1
                do
                  tA1[j,i]:=tR[j,i];
              end;
            an:=tR[k,k];
            a:=an-MultMat(MultMat(V,tR,k-1,1,k-1),U,k-1,1,1)[1,1];
            r:=MatDiv(MatDiv(MultMat(tR,U,k-1,k-1,1),1,k-1,a),1,k-1,-1);
            q:=MatDiv(MatDiv(MultMat(V,tR,k-1,1,k-1),k-1,1,a),k-1,1,-1);
            P:=SumMat(tR,MatDiv(MultMat(MultMat(MultMat(tR,U,k-1,k-1,1),V,1,k-1,k-1),tR,k-1,k-1,k-1),k-1,k-1,a),k-1,k-1);
            a1:=1/a;
            if k>2
            then
              begin
                for i:=1 to k-1
                do
                  begin
                    tR[k,i]:=r[1,i];
                    tR[i,k]:=q[i,1];
                    for j:=1 to k-1
                    do
                      tR[j,i]:=p[j,i];
                  end;
                tR[k,k]:=a1;
              end;
          end;
        {
        else
          ShowMessage('Матрица вырожденная на шаге номер - '+IntToStr(k));
        }
      end;
  MatRimInv:=tR;
end;

function Determinate(tA:TMyMat; tn:Integer; ts:TMySet; td:Byte):Real;
var
  i,sgn:Integer;
  s:Real;
begin
  s:=0;
  sgn:=1;
  for i:=1 to tn
  do
    if i in ts
    then
      begin
        if tn=td
        then
          begin
            Determinate:=tA[tn,i];
            Exit;
          end;
        s:=s+sgn*tA[td,i]*Determinate(tA,tn,ts-[i],td+1);
        sgn:=-sgn;
      end;
  Determinate:=s;
end;

function MatDiv(tA:TMyMat; tn,tn2:Integer; k:Real):TMyMat;
var
  i,j:Integer;
  tR:TMyMat;
begin
  for i:=1 to tn2
  do
    for j:=1 to tn
    do
      tR[j,i]:=tA[j,i]/k;
  MatDiv:=tR;
end;

function SumMat(tA,tB:TMyMat; tn,tn2:Integer):TMyMat;
var
  i,j:Integer;
  tR:TMyMat;
begin
  for i:=1 to tn2
  do
    for j:=1 to tn
    do
      tR[j,i]:=tA[j,i]+tB[j,i];
  SumMat:=tR;
end;

function SubMat(tA,tB:TMyMat; tn,tn2:Integer):TMyMat;
var
  i,j:Integer;
  tR:TMyMat;
begin
  for i:=1 to tn2
  do
    for j:=1 to tn
    do
      tR[j,i]:=tA[j,i]-tB[j,i];
  SubMat:=tR;
end;

function MultMat(tA,tB:TMyMat; tn,tn1,tn2:Integer):TMyMat;
var
  i,j,ii:Integer;
  tR:TMyMat;
begin
  for i:=1 to tn1
  do
    for j:=1 to tn2
    do
      begin
        tR[j,i]:=0;
        for ii:=1 to tn
        do
          tR[j,i]:=tR[j,i]+tA[ii,i]*tB[j,ii];
      end;
  MultMat:=tR;
end;

end.
