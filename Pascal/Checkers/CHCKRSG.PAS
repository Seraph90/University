unit ChckrsG;


interface

uses
  crt,graph;

type
  TSetOfTake=set of byte;
  BoardMas=array[0..7,0..7] of byte;

const
  BrdClr=5;
  CellClr=7;
  FsTmClr=5;
  ScTmClr=2;

  procedure CanTake(team:integer);
  procedure BoardStart;
  procedure BoardRedraw;
  procedure CheckerDraw(row,col,team,ctype:integer);
  procedure BoardDraw;
  procedure MDelay(time:longint);
  procedure InitG(s:string);

var
  Ch:array[1..4] of pointer;
  size:integer;
  BrdM:BoardMas;
  s:TSetOfTake;
  sd,i,j,ii,jj,sti,stj:integer;
  key:char;
  st:boolean;
  r:integer;
  u,k:integer;

implementation

procedure CanTake(team:integer);
var
  i,j,ii,jj,r:integer;
begin
  s:=[];
  for i:=0 to 7
  do
    for j:=0 to 7
    do
      if BrdM[i,j]=team
      then
        for ii:=-1 to 1
        do
          for jj:=-1 to 1
          do
            begin
              if ((j+2*jj) in [0..7]) and ((i+2*ii) in [0..7])
              and (BrdM[i+2*ii,j+2*jj]=0) and (jj<>0) and (ii<>0)
              and ((BrdM[i+ii,j+jj]=4-team) or (BrdM[i+ii,j+jj]=5-team))
              then
                s:=s+[j+i*10];           {для пешки}
            end
      else
        if BrdM[i,j]=team+1
        then
          for ii:=-1 to 1
          do
            for jj:=-1 to 1
            do
              if (ii*jj<>0)
              then
                begin
                  r:=1;
                  while ((j+r*jj) in [0..7]) and ((i+r*ii) in [0..7])
                  and (BrdM[i+r*ii,j+r*jj]=0)
                  do
                    inc(r);
                  if ((j+(r+1)*jj) in [0..7]) and ((i+(r+1)*ii) in [0..7])
                  and ((BrdM[i+r*ii,j+r*jj]=4-team) or (BrdM[i+r*ii,j+r*jj]=5-team))
                  and (BrdM[i+(r+1)*ii,j+(r+1)*jj]=0)
                  then
                    s:=s+[j+i*10];                 {для дамки}
                end;
end;

procedure BoardStart;            {заполняет поле шашками (нач растановка )}
var
  i,j:integer;
begin
  for i:=0 to 7
  do
    for j:=0 to 7
    do
      begin
        BrdM[i,j]:=0;
        case i
        of
          0,2,4,6:case j
              of
                0,2:BrdM[i,j]:=1;
                6:BrdM[i,j]:=3;
              end;
          1,3,5,7:case j
                  of
                    1:BrdM[i,j]:=1;
                    5,7:BrdM[i,j]:=3;
                  end;
        end;
      end;
end;

procedure BoardRedraw;          {перерисовывает поле}
var
  i,j:integer;
begin
  BoardDraw;
  for i:=0 to 7
  do
    for j:=0 to 7
    do
      if BrdM[i,j]<>0
      then
        putimage(i*55+6,j*55+6,Ch[BrdM[i,j]]^,1);
end;

procedure CheckerDraw(row,col,team,ctype:integer);
var
  CrTmClr:byte;
begin
  row:=row*55;
  col:=col*55;
  case team
  of
    1:begin
        setfillstyle(1,FsTmClr);
        setcolor(FsTmClr+8);
        CrTmClr:=FsTmClr;
      end;
    2:begin
        setfillstyle(1,ScTmClr);
        setcolor(ScTmClr+8);
        CrTmClr:=ScTmClr;
      end;
  end;
  case ctype
  of
    1:begin
        fillellipse(row-23,col-23,20,20);
        circle(row-23,col-23,20);
        circle(row-23,col-23,15);
      end;
    2:begin
        fillellipse(row-23,col-23,20,20);
        circle(row-23,col-23,20);
      end;
  end
end;

procedure BoardDraw;          {рисует доску}
var
  i,j:integer;
begin
  setfillstyle(1,8);
  bar(6,6,443,443);
  setfillstyle(1,CellClr);
  for i:=0 to 7
  do
    for j:=0 to 7
    do
      begin
        if ((i+j) mod 2)=0
        then
          bar(i*55+6,j*55+6,i*55+59,j*55+59);
      end;
  setcolor(BrdClr);
  rectangle(4,4,446,446);
  for i:=0 to 8
  do
    begin
      line(i*55+5,5,i*55+5,444);
      line(5,i*55+5,444,i*55+5);
    end;
end;

procedure MDelay(time:longint);    {задержка адыкватная}
var
  ticks:longint absolute 0:$46c;
begin
  time:=round(time*0.185)+ticks;
  repeat
  until ticks>time;
end;

procedure InitG(s:string);
var
  grDriver:Integer;
  grMode:Integer;
  ErrCode:Integer;
begin
  grDriver:=Detect;
  InitGraph(grDriver,grMode,s);
  ErrCode:=GraphResult;
  if ErrCode<>grOk
  then
    writeln('Графическая ошибка: ',GraphErrorMsg(ErrCode));
end;

begin
  InitG('');
  size:=imagesize(6,6,54,54);
  getmem(Ch[1],size);
  getmem(Ch[2],size);
  getmem(Ch[3],size);
  getmem(Ch[4],size);
  CheckerDraw(1,1,1,1);
  getimage(6,6,54,54,Ch[1]^);
  CheckerDraw(1,1,1,2);
  getimage(6,6,54,54,Ch[2]^);
  CheckerDraw(1,1,2,1);
  getimage(6,6,54,54,Ch[3]^);
  CheckerDraw(1,1,2,2);
  getimage(6,6,54,54,Ch[4]^);
end.