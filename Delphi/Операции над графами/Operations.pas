unit Operations;

interface

uses
  Math;

const
  ns=50;

type
  TMyMat=array[1..ns,1..ns] of Real;
  TXYMat=array[1..ns,1..2] of Integer;
  TMySet=set of Byte;
  TArrSet=array[1..ns] of TMySet;

var
  num,pqr:Integer;
  n:array[0..2] of Integer;
  A:array[0..3] of TMyMat;
  XY:array[0..2] of TXYMat;
  Ds,Us:TArrSet;

  function Reflexivity(tA:TMyMat; tn:Integer):Boolean;
  function AReflexivity(tA:TMyMat; tn:Integer):Boolean;
  function Symmetry(tA:TMyMat; tn:Integer):Boolean;
  function ASymmetry(tA:TMyMat; tn:Integer):Boolean;
  function NSymmetry(tA:TMyMat; tn:Integer):Boolean;
  function Transitivity(tA:TMyMat; tn:Integer):Boolean;
  function Acyclic(tA:TMyMat; tn:Integer):Boolean;
  function Union(tA1,tA2:TMyMat; tn1,tn2:Integer; var tn:Integer; var tXY:TXYMat; f:Boolean):TMyMat;
  function Intersection(tA1,tA2:TMyMat; tn1,tn2:Integer; var tn:Integer; var tXY:TXYMat; f:Boolean):TMyMat;
  function Degree(var tA:TMyMat; tn,dgr:Integer):TMyMat;
  function Duality(tA:TMyMat; tn:Integer):TMyMat;
  function Inverse(tA:TMyMat; tn:Integer):TMyMat;
  function Supplement(tA:TMyMat; tn:Integer):TMyMat;

implementation

function Reflexivity(tA:TMyMat; tn:Integer):Boolean;
var
  i:Integer;
begin
  for i:=1 to tn
  do
    if tA[i,i]<>1
    then
      begin
        Reflexivity:=False;
        Exit;
      end;
  Reflexivity:=True;
end;

function AReflexivity(tA:TMyMat; tn:Integer):Boolean;
var
  i:Integer;
begin
  for i:=1 to tn
  do
    if tA[i,i]=1
    then
      begin
        AReflexivity:=False;
        Exit;
      end;
  AReflexivity:=True;
end;

function Symmetry(tA:TMyMat; tn:Integer):Boolean;
var
  i,j:Integer;
begin
  for i:=1 to tn
  do
    for j:=i+1 to tn
    do
      if tA[i,j]<>tA[j,i]
      then
        begin
          Symmetry:=False;
          Exit;
        end;
  Symmetry:=True;
end;

function ASymmetry(tA:TMyMat; tn:Integer):Boolean;
var
  i,j:Integer;
begin
  for i:=1 to tn
  do
    for j:=i+1 to tn
    do
      if tA[i,j]=tA[j,i]
      then
        begin
          ASymmetry:=False;
          Exit;
        end;
  ASymmetry:=True;
end;

function NSymmetry(tA:TMyMat; tn:Integer):Boolean;
var
  i,j:Integer;
  tR:TMyMat;
begin
  tR:=Intersection(tA,Inverse(tA,tn),tn,tn,tn,XY[0],False);
  for i:=1 to tn
  do
    for j:=1 to tn
    do
      if tR[i,j]<>0
      then
        begin
          NSymmetry:=False;
          Exit;
        end;
  NSymmetry:=True;
end;

function Transitivity(tA:TMyMat; tn:Integer):Boolean;
var
  i,j:Integer;
  tR:TMyMat;
begin
  tR:=Degree(tA,tn,2);
  for i:=1 to tn
  do
    for j:=1 to tn
    do
      if tR[i,j]>tA[i,j]
      then
        begin
          Transitivity:=False;
          Exit;
        end;
  Transitivity:=True;
end;

function Acyclic(tA:TMyMat; tn:Integer):Boolean;
var
  i,j,k:Integer;
  tR:TMyMat;
  b:Boolean;
begin
  b:=True;
  for k:=1 to tn
  do
    begin
      if not b
      then
        Break;
      tR:=Intersection(Degree(tA,tn,k),Inverse(tA,tn),tn,tn,tn,XY[0],False);
      b:=True;
      for i:=1 to tn
      do
        begin
          if not b
          then
            Break;
          for j:=1 to tn
          do
            if tR[i,j]=1
            then
              begin
                b:=False;
                Break;
              end;
        end;
    end;
  Acyclic:=b;
end;

function Union(tA1,tA2:TMyMat; tn1,tn2:Integer; var tn:Integer; var tXY:TXYMat; f:Boolean):TMyMat;
var
  i,j:Integer;
  tR:TMyMat;
begin
  tn:=Max(tn1,tn2);
  for i:=1 to tn
  do
    begin
      if f
      then
        begin
          tXY[i,1]:=Random(395)+15;
          tXY[i,2]:=Random(395)+15;
        end;
      for j:=1 to tn
      do
        tR[i,j]:=Max(tA1[i,j],tA2[i,j]);
    end;
  Union:=tR;
end;

function Intersection(tA1,tA2:TMyMat; tn1,tn2:Integer; var tn:Integer; var tXY:TXYMat; f:Boolean):TMyMat;
var
  i,j:Integer;
  tR:TMyMat;
begin
  tn:=Max(tn1,tn2);
  for i:=1 to tn
  do
    begin
      if f
      then
        begin
          tXY[i,1]:=Random(395)+15;
          tXY[i,2]:=Random(395)+15;
        end;
      for j:=1 to tn
      do
        tR[i,j]:=Min(tA1[i,j],tA2[i,j]);
    end;
  Intersection:=tR;
end;

function Degree(var tA:TMyMat; tn,dgr:Integer):TMyMat;
var
  i,j,ii,k:Integer;
  tR,tA2:TMyMat;
begin
  tA2:=tA;
  if dgr=1
  then
    Degree:=tA
  else
    begin
      for k:=1 to dgr-1
      do
        begin
          for i:=1 to tn
          do
            for j:=1 to tn
            do
              begin
                tR[i,j]:=0;
                for ii:=1 to tn
                do
                  tR[i,j]:=Max(tR[i,j],Min(tA[i,ii],tA2[ii,j]));
              end;
          tA:=tR;
        end;
      Degree:=tR;
    end;
end;

function Duality(tA:TMyMat; tn:Integer):TMyMat;
var
  i,j:Integer;
  tR:TMyMat;
begin
  for i:=1 to tn
  do
    for j:=1 to tn
    do
      tR[i,j]:=1-tA[j,i];
  Duality:=tR;
end;

function Inverse(tA:TMyMat; tn:Integer):TMyMat;
var
  i,j:Integer;
  tR:TMyMat;
begin
  for i:=1 to tn
  do
    for j:=1 to tn
    do
      tR[i,j]:=tA[j,i];
  Inverse:=tR;
end;

function Supplement(tA:TMyMat; tn:Integer):TMyMat;
var
  i,j:Integer;
begin
  for i:=1 to tn
  do
    for j:=1 to tn
    do
      begin
        tA[i,j]:=1-tA[i,j];
      end;
  Supplement:=tA;
end;

end.
