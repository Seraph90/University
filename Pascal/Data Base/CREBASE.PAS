uses
  crt;

type
  rec=record
    f1,i1,o1,f2,i2,o2,d,n:string[15];
  end;

var
  i,j:integer;
  v:rec;
  f:file of rec;

begin
  clrscr;
  randomize;
  assign(f,'bd.sbd');
  rewrite(f);
  for i:=1 to 30
  do
    begin
      j:=random(5);
      case j
      of
        0:v.f1:='Маслоу';
        1:v.f1:='Эвклидов';
        2:v.f1:='Додиков';
        3:v.f1:='Дятлов';
        4:v.f1:='Перепончатов';
      end;
      j:=random(5);
      case j
      of
        0:v.i1:='Василий';
        1:v.i1:='Пётр';
        2:v.i1:='Иван';
        3:v.i1:='Игнат';
        4:v.i1:='Аркадий';
      end;
      j:=random(5);
      case j
      of
        0:v.o1:='Васильевич';
        1:v.o1:='Пётрович';
        2:v.o1:='Иванович';
        3:v.o1:='Игнатич';
        4:v.o1:='Аркадиевич';
      end;
      j:=random(5);
      case j
      of
        0:v.f2:='Маслоу';
        1:v.f2:='Эвклидова';
        2:v.f2:='Додикова';
        3:v.f2:='Дятлова';
        4:v.f2:='Перепончатова';
      end;
      j:=random(5);
      case j
      of
        0:v.i2:='Василиса';
        1:v.i2:='Петра';
        2:v.i2:='Ивана';
        3:v.i2:='Игната';
        4:v.i2:='Аркадия';
      end;
      j:=random(5);
      case j
      of
        0:v.o2:='Васильевна';
        1:v.o2:='Пётровна';
        2:v.o2:='Ивановна';
        3:v.o2:='Игнатична';
        4:v.o2:='Аркадиевна';
      end;
      j:=random(5);
      case j
      of
        0:v.d:='01.01.2000';
        1:v.d:='01.01.2001';
        2:v.d:='01.01.2002';
        3:v.d:='01.01.2003';
        4:v.d:='01.01.2004';
      end;
      j:=random(5);
      case j
      of
        0:v.n:='1';
        1:v.n:='2';
        2:v.n:='3';
        3:v.n:='4';
        4:v.n:='5';
      end;
      write(f,v);
    end;
  close(f);
end.