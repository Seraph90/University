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
        0:v.f1:='��᫮�';
        1:v.f1:='��������';
        2:v.f1:='�������';
        3:v.f1:='��⫮�';
        4:v.f1:='��९���⮢';
      end;
      j:=random(5);
      case j
      of
        0:v.i1:='��ᨫ��';
        1:v.i1:='����';
        2:v.i1:='����';
        3:v.i1:='�����';
        4:v.i1:='�ઠ���';
      end;
      j:=random(5);
      case j
      of
        0:v.o1:='��ᨫ쥢��';
        1:v.o1:='���஢��';
        2:v.o1:='��������';
        3:v.o1:='������';
        4:v.o1:='�ઠ������';
      end;
      j:=random(5);
      case j
      of
        0:v.f2:='��᫮�';
        1:v.f2:='���������';
        2:v.f2:='��������';
        3:v.f2:='��⫮��';
        4:v.f2:='��९���⮢�';
      end;
      j:=random(5);
      case j
      of
        0:v.i2:='��ᨫ��';
        1:v.i2:='����';
        2:v.i2:='�����';
        3:v.i2:='�����';
        4:v.i2:='�ઠ���';
      end;
      j:=random(5);
      case j
      of
        0:v.o2:='��ᨫ쥢��';
        1:v.o2:='���஢��';
        2:v.o2:='��������';
        3:v.o2:='�����筠';
        4:v.o2:='�ઠ������';
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