unit Ser_DBF;

interface

uses
  crt,dos;

type
  rec=record
    f1,i1,o1,f2,i2,o2,d,n:string[15];
  end;

var
  curf:file of rec;
  curr:rec;
  sc:array[0..160,0..24] of byte;
  s:string[11];
  e,i,cc,n,nm,x,y:integer;
  c:char;
  menu,lr,ud,col,len:byte;

  CurSizeBuf:word;
  rgs:registers;

const
  ttvo=8;
  tvvo=10;
  sf=$78;
  op=$2e;
  glp=$02;
  gpp=$02;
  vs=$2f;
  vm=$0f;
  gt=$2a;

   function GetText(x,y,len:byte; s:string):string;
  procedure ShowInf;
  procedure ShowFile(n:integer);
  procedure ShowBase;
  procedure ReadNam;
  procedure SFrame(num,snum:byte);
  procedure CSel(x1,len,y,clr:byte);
  procedure SScr(x1,y1,x2,y2:byte);
  procedure LScr(x1,y1,x2,y2:byte);
  procedure DrawAll;
  procedure Frame(s:string; x1,y1,x2,y2,clr:byte);

   function CurSize:word;
  procedure Cur(Mode:word);

implementation

function GetText(x,y,len:byte; s:string):string;
var
  c:char;
  b:string;
begin
  CSel(x,len,y-1,gt);
  gotoxy(x,y);
  textattr:=$2a;
  for i:=1 to len
  do
    write(' ');
  Cur(1);
  b:=s;
  repeat
    gotoxy(x,y);
    write(s,' '#8);
    c:=readkey;
    case c
    of
      #8:if s[0]>#0
         then
           dec(s[0]);
      #33..#255:if s[0]<chr(len)
                then
                  s:=s+c;
      #27:begin
            s:=b;
            gotoxy(x,y);
            write(s,'      ');
          end;
    end;
  until (c=#27) or (c=#13);
  GetText:=s;
  Cur(0);
  gotoxy(x,y);
  write('':len);
  gotoxy(x,y);
  write(s);
  CSel(x,20,y-1,vm);
end;

procedure ShowInf;
var
  clr:byte;
begin
  window(1,1,80,25);
  clr:=textattr;
  textattr:=$0a;
  gotoxy(55,5);
  writeln('               ');
  gotoxy(55,7);
  writeln('               ');
  gotoxy(55,9);
  writeln('               ');
  gotoxy(55,11);
  writeln('               ');
  gotoxy(55,13);
  writeln('               ');
  gotoxy(55,15);
  writeln('               ');
  gotoxy(55,17);
  writeln('               ');
  gotoxy(55,19);
  writeln('               ');
  if filesize(curf)<>0
  then
    begin
      seek(curf,n-1+nm);
      read(curf,curr);
      gotoxy(55,5);
      writeln(curr.f1);
      gotoxy(55,7);
      writeln(curr.i1);
      gotoxy(55,9);
      writeln(curr.o1);
      gotoxy(55,11);
      writeln(curr.f2);
      gotoxy(55,13);
      writeln(curr.i2);
      gotoxy(55,15);
      writeln(curr.o2);
      gotoxy(55,17);
      writeln(curr.d);
      gotoxy(55,19);
      writeln(curr.n);
    end;
  textattr:=clr;
end;

procedure ShowFile(n:integer);
var
  clr:byte;
begin
  clr:=textattr;
  textattr:=$02;
  window(3,3,80,25);
  if n-1<filesize(curf)
  then
    seek(curf,n-1);
  if filesize(curf)>=21
  then
    for i:=1 to 21
    do
      begin
        read(curf,curr);
        with curr
        do
          writeln(f1+' '+i1[1]+'.'+o1[1]+'.':23,f2+' '+i2[1]+'.'+o2[1]+'.':23);
      end
  else
    for i:=1 to filesize(curf)
    do
      begin
        read(curf,curr);
        with curr
        do
          writeln(f1+' '+i1[1]+'.'+o1[1]+'.':23,f2+' '+i2[1]+'.'+o2[1]+'.':23);
      end;
  SScr(1,2,80,24);
  textattr:=clr;
end;

procedure ShowBase;
begin
  LScr(1,2,80,24);
  Frame('Ф.И.О.',1,2,51,24,glp);
  Frame('Информация',52,2,80,24,gpp);
  writeln(#10' Фамилия жениха:'#10);
  writeln(' Имя жениха:'#10);
  writeln(' Отчество жениха:'#10);
  writeln(' Фамилия невесты:'#10);
  writeln(' Имя невесты:'#10);
  writeln(' Отчество невесты:'#10);
  writeln(' Дата (дд:мм:гггг):'#10);
  writeln(' Номер брака:'#10);
  SScr(1,2,80,24);
end;

procedure ReadNam;
begin
  Frame('Введите имя файла',27,11,53,13,sf);
  CSel(28,24,11,$0a);
  textattr:=$0a;
  Cur(1);
  readln(s);
  Cur(0);
  s:=s+'.sbd';
  LScr(27,11,53,13);
end;

procedure SFrame(num,snum:byte);
begin
  if lr<>num
  then
    LScr(1,1,80,8);
  lr:=num;
  ud:=snum;
  if ud<>0
  then
    begin
      case lr
      of
        0:begin
            Frame('',1,2,15,8,sf);
            textcolor(ttvo);
            write('Новый        ');
            write('Открыть    ');
            textcolor(tvvo);
            write('F3');
            textcolor(ttvo);
            write('Сохранить  ');
            textcolor(tvvo);
            write('F2');
            textcolor(ttvo);
            write('Выход     ');
            textcolor(tvvo);
            write('F10');
            col:=4;
            len:=12;
          end;
        1:begin
            Frame('',11,2,25,7,sf);
            textcolor(ttvo);
            write('Добавить     ');
            write('Изменить     ');
            write('Удалить   ');
            textcolor(tvvo);
            write('DEL');
            col:=3;
            len:=12;
          end;
        2:begin
            Frame('',21,2,40,7,sf);
            textcolor(ttvo);
            write('По фамилии жениха ');
            write('По фамилии невесты');
            write('По дате');
            col:=3;
            len:=17;
          end;
        3:begin
            Frame('',31,2,46,6,sf);
            textcolor(ttvo);
            write('Помощь      ');
            textcolor(tvvo);
            write('F1');
            textcolor(8);
            write('О программе ');
            col:=2;
            len:=13;
          end
      end;
    end;
  if ud<>0
  then
    CSel(2+lr*10,len,ud+1,vm);
  CSel(2+lr*10,9,0,vm);
end;

procedure CSel(x1,len,y,clr:byte);
begin
  for x:=x1 to x1+len
  do
    mem[$b800:(y)*160+x*2-1]:=clr;
end;

procedure SScr(x1,y1,x2,y2:byte);
begin
  for x:=x1 to x2*2
  do
    for y:=y1 to y2
    do
      sc[x,y]:=mem[$b800:(y-1)*160+x-1];
end;

procedure LScr(x1,y1,x2,y2:byte);
begin
  for x:=x1 to x2*2
  do
    for y:=y1 to y2
    do
      mem[$b800:(y-1)*160+x-1]:=sc[x,y];
end;

procedure DrawAll;
var
  x,y,xx:integer;
begin
  textattr:=$07;
  clrscr;
  for x:=1 to 80
  do
    begin
      mem[$b800:x*2-2]:=219;
      mem[$b800:160*24+x*2-2]:=219;
      for y:=1 to 23
      do
        mem[$b800:y*160+x*2-2]:=177;
    end;
  textattr:=$78;
  gotoxy(1,1);
  write('  Файл      Правка    Поиск     Справка                                         ');
  gotoxy(1,25);
  write('  F1 Help  F2 Save  F3 Open  F10 Exit  DEL Delete                              ');
  for x:=1 to 5
  do
    for xx:=1 to 3
    do
      mem[$b800:160*24+18*x+xx*2-15]:=$70+tvvo;
  mem[$b800:3923]:=$70+tvvo;
end;

procedure Frame(s:string; x1,y1,x2,y2,clr:byte);
var
  tx,ty:integer;
begin
  textattr:=clr;
  window(x1,y1,x2,y2);
  clrscr;
  for tx:=x1+1 to x2-1
  do
    begin
      mem[$b800:160*(y1-1)+tx*2-2]:=ord('═');
      mem[$b800:160*(y2-1)+tx*2-2]:=ord('═');
    end;
  for ty:=y1 to y2-2
  do
    begin
      mem[$b800:160*ty+x1*2-2]:=ord('║');
      mem[$b800:160*ty+x2*2-2]:=ord('║');
    end;
  mem[$b800:160*(y1-1)+x1*2-2]:=ord('╔');
  mem[$b800:160*(y1-1)+x2*2-2]:=ord('╗');
  mem[$b800:160*(y2-1)+x1*2-2]:=ord('╚');
  mem[$b800:160*(y2-1)+x2*2-2]:=ord('╝');
  gotoxy(3,1);
  if s<>''
  then
    writeln(' '+s+' ');
  window(x1+1,y1+1,x2-1,y2-1);
end;

function CurSize:word;
begin
  with rgs
  do
    begin
      ah:=3;
      bh:=0;
      intr($10,rgs);
      CurSize:=cx;
    end;
end;

procedure Cur(Mode:word);
begin
  if Mode<>1
  then
    CurSizeBuf:=CurSize;
  if Mode=0
  then
    rgs.cx:=$2005
  else
    rgs.cx:=CurSizeBuf;
  rgs.ah:=1;
  intr($10,rgs);
end;

begin
end.