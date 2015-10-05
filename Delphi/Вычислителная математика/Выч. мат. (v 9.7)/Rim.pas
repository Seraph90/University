unit Rim;

interface

uses
  SysUtils, Dialogs, Matrix;

var
  n2:Integer;
  A2,Ai2,E2:TMyMat;
  DetA2:Real;

  function MatRimInv(tA:TMyMat; tn:Integer):TMyMat;

implementation

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
          end
        else
          ShowMessage('Матрица вырожденная на шаге номер - '+IntToStr(k));
      end;
  MatRimInv:=tR;
end;

end.
