unit Ser_DBM;

interface

uses
  crt,Ser_DBF;

  procedure MFind(var h:string);
  procedure MNew;
  procedure MDel;
  procedure MAdd;
  procedure MEdit;
  procedure MSave;
  procedure MOpen;
  procedure MHelp;
  procedure MAbout;

implementation

procedure MFind(var h:string);
var
  ss:string;
begin
  SScr(27,11,53,13);
  Frame('Искать',27,11,53,13,sf);
  CSel(28,24,11,$0a);
  textattr:=$0a;
  Cur(1);
  readln(ss);
  Cur(0);
  LScr(27,11,53,13);
  if ss=''
  then
    exit;
  with curr
  do
    repeat
      read(curf,curr);
    until (pos(ss,h)>0) or eof(curf);
  if eof(curf)
  then
    exit;
  if filepos(curf)>21
  then
    begin
      n:=filepos(curf)-21;
      nm:=20;
    end
  else
    begin
      n:=1;
      nm:=filepos(curf)-1;
    end;
  LScr(1,1,80,24);
  ShowFile(n);
  ShowInf;
  CSel(3,46,nm+2,vs);
  menu:=0;
end;

procedure MNew;
begin
  LScr(1,1,80,24);
  if s<>''
  then
    close(curf);
  s:='temp.sbd';
  assign(curf,s);
  rewrite(curf);
  ShowBase;
end;

procedure MDel;
var
  i:integer;
begin
  for i:=nm+1 to filesize(curf)-1
  do
    begin
      seek(curf,i);
      read(curf,curr);
      seek(curf,i-1);
      write(curf,curr);
    end;
  seek(curf,filesize(curf)-1);
  truncate(curf);
  if nm=filesize(curf)
  then
    nm:=nm-1;
  n:=1;
  window(2,3,49,23);
  textattr:=$0f;
  clrscr;
  ShowFile(n);
  if filesize(curf)=0
  then
    begin
      menu:=1;
      LScr(1,1,80,24);
      CSel(2,9,0,vm);
    end
  else
    CSel(3,46,nm+2,vs);
  ShowInf;
  SScr(1,2,80,24);
end;

procedure MAdd;
begin
  LScr(1,2,49,24);
  window(1,1,80,25);
  with curr
  do
    begin
      f1:=GetText(55,5,15,'');
      i1:=GetText(55,7,15,'');
      o1:=GetText(55,9,15,'');
      f2:=GetText(55,11,15,'');
      i2:=GetText(55,13,15,'');
      o2:=GetText(55,15,15,'');
       d:=GetText(55,17,15,'');
       n:=GetText(55,19,15,'');
    end;
  seek(curf,filesize(curf));
  write(curf,curr);
  if filesize(curf)>20
  then
    begin
      n:=filesize(curf)-20;
      nm:=20;
    end
  else
    n:=1;
  ShowFile(n);
  CSel(3,46,nm+2,vs);
  menu:=0;
end;

procedure MEdit;
begin
  LScr(1,2,49,24);
  window(1,1,80,25);
  with curr
  do
    begin
      f1:=GetText(55,5,15,f1);
      i1:=GetText(55,7,15,i1);
      o1:=GetText(55,9,15,o1);
      f2:=GetText(55,11,15,f2);
      i2:=GetText(55,13,15,i2);
      o2:=GetText(55,15,15,o2);
       d:=GetText(55,17,15,d);
       n:=GetText(55,19,15,n);
    end;
  seek(curf,n+nm-1);
  write(curf,curr);
  if filesize(curf)>20
  then
    begin
      n:=filesize(curf)-20;
      nm:=20;
    end
  else
    n:=1;
  ShowFile(n);
  CSel(3,46,nm+2,vs);
  menu:=0;
end;

procedure MSave;
var
  t:file of rec;
begin
  if s=''
  then
    exit;
  LScr(1,2,80,24);
  close(curf);
  if s='temp.sbd'
  then
    begin
      repeat
        ReadNam;
      until s<>'';
      rename(curf,s);
    end
  else
    begin
      assign(t,s);
      ReadNam;
      assign(curf,s);
      rewrite(curf);
      reset(t);
      while not eof(t)
      do
        begin
          read(t,curr);
          write(curf,curr);
        end;
      close(t);
      erase(t);
    end;
  readkey;
  assign(curf,s);
  reset(curf);
  if IOResult<>0
  then
    begin
      s:='';
      exit;
    end;
  ShowBase;
  ShowFile(n);
  if menu=0
  then
    CSel(3,46,nm+2,vs);
end;

procedure MOpen;
begin
  LScr(1,1,80,24);
  if s<>''
  then
    close(curf);
  ReadNam;
  if s=''
  then
    exit;
  nm:=0;
  n:=1;
  assign(curf,s);
  reset(curf);
  if IOResult<>0
  then
    begin
      s:='';
      exit;
    end;
  ShowBase;
  ShowFile(n);
  if menu=0
  then
    CSel(3,46,nm+2,vs);
end;

procedure MHelp;
begin
  LScr(1,1,80,24);
  Frame('Помощь',20,6,60,16,op);
  write('                                       ');
  write('   ',#24,#25,#26,#27,' - Управление                   ');
  write('     F1 - Помощь                       ');
  write('     F2 - Сохранение базы              ');
  write('     F3 - Открытие базы                ');
  write('    F10 - Выход                        ');
  write('    DEL - Удаление элемента списка     ');
  write('    ENT - Редактирование элемента      ');
  readkey;
  LScr(20,6,60,16);
end;

procedure MAbout;
begin
  LScr(1,1,80,24);
  Frame('О программе',20,6,60,16,op);
  write('                                       ');
  write('  База посетителей ЗАГСа.              ');
  write('                                       ');
  write('                                       ');
  write('                                       ');
  write('                       Группа ВМК-08   ');
  write('                       Логвинов А. И.  ');
  write('                       Ser@ph_2009     ');
  readkey;
  LScr(20,6,60,16);
end;

begin
end.