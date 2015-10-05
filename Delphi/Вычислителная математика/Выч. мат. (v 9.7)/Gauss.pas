unit Gauss;

interface

uses
  SysUtils, Grids, Math,
  Matrix;

var
  n7:Integer;
  A7,B7,AB7,Ao7,At7,X:TMyMat;
  DetA7:Real;

  procedure Gaus(var tA:TMyMat; st,tn:Integer; Rnd:boolean);
  procedure ForwardWay2(var tA:TMyMat; tn:Integer);
  procedure BackwardWay2(var tA:TMyMat; tn:Integer);
  procedure ForwardWay(var tA:TMyMat; tn:Integer; var tSG:TStringGrid);
  procedure BackwardWay(var tA:TMyMat; tn:Integer; var tSG:TStringGrid);

implementation

procedure Gaus(var tA:TMyMat; st,tn:Integer; Rnd:boolean);
var
  i,j,nst:Integer;
  Vi,mn,buf:real;
begin
  for i:=st to tn
  do
    if tA[st,i]<>0
    then
      break;
  nst:=i;
  if st<>nst
  then
    RSch(tA,st,nst,tn+2);
  Vi:=tA[st,st];
  for j:=st to tn+2
  do      {*}
    tA[j,st]:=tA[j,st]/Vi;
  for i:=st+1 to tn
  do       {**}
    begin
      mn:=tA[st,i];
      for j:=st to tn+2
      do
        tA[j,i]:=tA[j,i]-mn*tA[j,st];
    end;
  if Rnd
  then
    for i:=1 to tn
    do
      tA[tn+1,i]:=RoundTo(tA[tn+1,i],-3);
  for i:=1 to tn
  do
    begin
      buf:=tA[tn+2,i];
      tA[tn+2,i]:=tA[tn+3,i];
      tA[tn+3,i]:=buf;
    end;
end;

procedure ForwardWay2(var tA:TMyMat; tn:Integer);
var
  i,j,k:Integer;
begin
  for i:=1 to tn
  do
    begin
      tA[tn+2,i]:=0;
      for j:=1 to tn+1
      do
        tA[tn+2,i]:=tA[tn+2,i]+tA[j,i];
      tA[tn+3,i]:=0;
    end;
  k:=1;
  while k<=tn
  do
    begin
      Gaus(tA,k,tn,False);
      for i:=k to tn
      do
        begin
          tA[tn+2,i]:=0;
          for j:=1 to tn+1
          do
            tA[tn+2,i]:=tA[tn+2,i]+tA[j,i]
        end;
      k:=k+1;
    end;
end;

procedure BackwardWay2(var tA:TMyMat; tn:Integer);
var
  i,j:Integer;
begin
  for i:=tn downto 1
  do
    for j:=tn downto i+1
    do
      tA[tn+1,i]:=tA[tn+1,i]-tA[j,i]*tA[tn+1,j];
  for i:=1 to tn
  do
    for j:=1 to tn
    do
      tA[j,i]:=0;
  {
  for i:=1 to tn
  do
    tA[i,i]:=1;
  for i:=1 to tn
  do
    tA[tn+3,i]:=1+tA[tn+1,i];
  }
end;

procedure ForwardWay(var tA:TMyMat; tn:Integer; var tSG:TStringGrid);
var
  i,j,k,d:Integer;
begin
  d:=0;
  for i:=1 to tn
  do
    begin
      tA[tn+2,i]:=0;
      for j:=1 to tn+1
      do
        tA[tn+2,i]:=tA[tn+2,i]+tA[j,i];
      tA[tn+3,i]:=0;
    end;
  k:=1;
  while k<=tn
  do
    begin
      case k
      of
        1:d:=1;
        2:d:=6;
        3:d:=10;
        4:d:=13;
      end;
      for j:=1 to tn+3
      do
        for i:=k to tn
        do
          tSG.Cells[j,i+d-k]:=FloatToStr(RoundTo(tA[j,i],-4));
      Gaus(tA,k,tn,True);
      for i:=k to tn
      do
        begin
          tA[tn+2,i]:=0;
          for j:=1 to tn+1
          do
            tA[tn+2,i]:=tA[tn+2,i]+tA[j,i];
        end;
      for j:=1 to tn+3
      do
        tSG.Cells[j,d+tn-k+1]:=FloatToStr(RoundTo(tA[j,k],-4));
      k:=k+1;
    end;
end;

procedure BackwardWay(var tA:TMyMat; tn:Integer; var tSG:TStringGrid);
var
  i,j:Integer;
begin
  for i:=tn downto 1
  do
    for j:=tn downto i+1
    do
      tA[tn+1,i]:=tA[tn+1,i]-tA[j,i]*tA[tn+1,j];
  for i:=1 to tn
  do
    for j:=1 to tn
    do
      tA[j,i]:=0;
  for i:=1 to tn
  do
    tA[i,i]:=1;
  for i:=1 to tn
  do
    tA[tn+3,i]:=1+tA[tn+1,i];
  for j:=1 to tn+3
  do
    for i:=tn downto 1
    do
      tSG.Cells[j,tn-i+15]:=FloatToStr(RoundTo(tA[j,i],-4));
end;

end.

