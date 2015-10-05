unit MatU;

interface

uses
  Matrix, Tri;

var
  n6:Integer;
  A6,B6,X6,Ai6,X:TMyMat;
  DetA6:Real;

function MatTriInv(tA:TMyMat; tn:Integer):TMyMat;

implementation

function MatTriInv(tA:TMyMat; tn:Integer):TMyMat;
var
  tU,tD,tR:TMyMat;
begin
  DisPart(tA,tU,tD,tn);
  tU:=MatInU(tU,tn);
  tD:=MatInD(tD,tn);
  tR:=MultMat(tU,tD,tn,tn,tn);
  MatTriInv:=tR;
end;

end.
