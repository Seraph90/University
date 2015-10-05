unit Tri;

interface

uses
  Matrix;

var
  n:Integer;
  A,Ai,D,Di,DE,U,Ui,UE,E:TMyMat;
  DetA:Real;

  function MatInD(tA:TMyMat; tn:Integer):TMyMat;
  function MatInU(tA:TMyMat; tn:Integer):TMyMat;
  procedure DisPart(tA:TMyMat; var tU,tD:TMyMat; tn:Integer);

implementation

function MatInD(tA:TMyMat; tn:Integer):TMyMat;
var
  i,j,k:Integer;
  tR:TMyMat;
begin
  for i:=1 to tn
  do
    for j:=1 to tn
    do
      tR[j,i]:=0;
  for i:=1 to tn
  do
    for j:=1 to i
    do
      if i=j
      then
        tR[j,i]:=1/tA[j,i]
      else
        begin
          for k:=1 to i-1
          do
            tR[j,i]:=tR[j,i]-tA[k,i]*tR[j,k];
          tR[j,i]:=tR[j,i]/tA[i,i]
        end;
  MatInD:=tR;
end;

function MatInU(tA:TMyMat; tn:Integer):TMyMat;
var
  i,j,k:Integer;
  tR:TMyMat;
begin
  for i:=1 to tn
  do
    for j:=1 to tn
    do
      tR[j,i]:=0;
  for i:=tn downto 1
  do
    for j:=tn downto i
    do
      if i=j
      then
        tR[j,i]:=1/tA[j,i]
      else
        begin
          for k:=i+1 to j
          do
            tR[j,i]:=tR[j,i]-tA[k,i]*tR[j,k];
          tR[j,i]:=tR[j,i]/tA[i,i]
        end;
  MatInU:=tR;
end;

procedure DisPart(tA:TMyMat; var tU,tD:TMyMat; tn:Integer);
var
  i,j,k:Integer;
  buf:Real;
begin
  for i:=1 to n
  do
    for j:=1 to n
    do
      begin
        if (i>=j) and (j>-1)
        then
          begin
            buf:=0;
            for k:=1 to j
            do
              buf:=buf+tD[k,i]*tU[j,k];
            tD[j,i]:=tA[j,i]-buf;
          end;
        if (j>=i) and (i>-1)
        then
          begin
            buf:=0;
            for k:=1 to i
            do
              buf:=buf+tD[k,i]*tU[j,k];
            tU[j,i]:=(tA[j,i]-buf)/tD[i,i];
          end;
      end;
end;

end.
