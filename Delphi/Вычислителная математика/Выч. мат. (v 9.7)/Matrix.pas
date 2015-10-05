unit Matrix;

interface

uses
  SysUtils, Grids, Math;

type
  TMyMat=array[1..10,1..10] of Real;
  TMySet=set of Byte;

  function NOTM(tA:TMyMat; n1,n2:Integer; Num:Byte):Real;
  function CSch(tA:TMyMat; n1,n2,tn:Integer):TMyMat;
  function RSch(tA:TMyMat; n1,n2,tn:Integer):TMyMat;
  function Determinate(tA:TMyMat; tn:Integer; ts:TMySet; td:Byte):Real;
  function TransMat(tA:TMyMat; tn:integer):TMyMat;
  procedure WriteMat(tA:TMyMat; tnn,tnn2,tn,tn2:Integer; tSG:TStringGrid; k:Integer);
  function ReadMat(tn,tn2:Integer; tSG:TStringGrid):TMyMat;
  function MatDiv(tA:TMyMat; tn,tn2:Integer; k:Real):TMyMat;
  function SumMat(tA,tB:TMyMat; tn,tn2:Integer):TMyMat;
  function SubMat(tA,tB:TMyMat; tn,tn2:Integer):TMyMat;
  function MultMat(tA,tB:TMyMat; tn,tn1,tn2:Integer):TMyMat;

implementation

uses Classes;

function NOTM(tA:TMyMat; n1,n2:Integer; Num:Byte):Real;
var
  i,j:Integer;
  mx,bmx:Real;
begin
  mx:=0;
  case Num
  of
    1:begin
        for j:=1 to n2
        do
          mx:=mx+abs(tA[j,1]);
        for i:=2 to n1
        do
          begin
            bmx:=0;
            for j:=1 to n2
            do
              bmx:=bmx+abs(tA[j,i]);
            if bmx>mx
            then
              mx:=bmx;
          end;
      end;
    2:begin
        for i:=1 to n1
        do
          mx:=mx+abs(tA[1,i]);
        for j:=2 to n2
        do
          begin
            bmx:=0;
            for i:=1 to n1
            do
              bmx:=bmx+abs(tA[j,i]);
            if bmx>mx
            then
              mx:=bmx;
          end;
      end;
    3:begin
        for i:=1 to n1
        do
          for j:=1 to n2
          do
            mx:=mx+sqr(abs(tA[j,i]));
        mx:=sqrt(mx);
      end;
  end;
  NOTM:=mx;
end;

function RSch(tA:TMyMat; n1,n2,tn:Integer):TMyMat;
var
  i:Integer;
  b:Real;
  tR:TMyMat;
begin
  tR:=tA;
  for i:=1 to tn
  do
    begin
      b:=tR[i,n1];
      tR[i,n1]:=tR[i,n2];
      tR[i,n2]:=b;
    end;
  RSch:=tR;
end;

function CSch(tA:TMyMat; n1,n2,tn:Integer):TMyMat;
var
  i:Integer;
  b:Real;
  tR:TMyMat;
begin
  tR:=tA;
  for i:=1 to tn
  do
    begin
      b:=tR[n1,i];
      tR[n1,i]:=tR[n2,i];
      tR[n2,i]:=b;
    end;
  CSch:=tR;
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

function TransMat(tA:TMyMat; tn:integer):TMyMat;
var
  i,j:integer;
  tR:TMyMat;
begin
  for i:=1 to tn
  do
    for j:=1 to tn
    do
      tR[j,i]:=tA[i,j];
  TransMat:=tR;
end;

procedure WriteMat(tA:TMyMat; tnn,tnn2,tn,tn2:Integer; tSG:TStringGrid; k:Integer);
var
  i,j:Integer;
begin
  for i:=1 to tn2
  do
    for j:=1 to tn
    do
      tSG.Cells[j+tnn-2,i+tnn2-2]:=FloatToStr({RoundTo(}tA[j,i]{,k)});
end;

function ReadMat(tn,tn2:Integer; tSG:TStringGrid):TMyMat;
var
  i,j:Integer;
  tR:TMyMat;
begin
  for i:=1 to tn2
  do
    for j:=1 to tn
    do
      tR[j,i]:=StrToFloat(tSG.Cells[j-1,i-1]);
  ReadMat:=tR;
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
