unit PortUnit;

interface

uses
  Windows, Sysutils;

var
  CommHandle: Integer;
  DCB: TDCB;
  Ovr: TOverlapped;
  Stat: TComStat;
  CommThread: THandle;
  hEvent: THandle;
  Flag, StopResive: Boolean;
  KolByte, Kols, Mask, TransMask, Errs: DWord;
  procedure InitPort;
  procedure ReadPort;
  procedure WritePort(A: Byte);
  procedure ClosePort;

implementation

uses
  Unit1;

procedure InitPort;
var
  ThreadID: DWord;
begin
  //создание и иницализация порта
  KolByte:=0;
  //создание порта и получение его хэндла
  CommHandle:=CreateFile('COM6', GENERIC_READ or GENERIC_WRITE, 0, nil, OPEN_EXISTING,
    FILE_ATTRIBUTE_NORMAL or FILE_FLAG_OVERLAPPED, 0);
  //ставим маску - "по пришествии определенного символа"
  SetCommMask(CommHandle, EV_RXFLAG);
  //построение DCB
  GetCommState(CommHandle, DCB);
  DCB.BaudRate:=CBR_9600;
  DCB.Parity:=NOPARITY;
  DCB.ByteSize:=8;
  DCB.StopBits:=OneStopBit;
  DCB.EvtChar:=Chr(13);//задание символа для флага
  //устанавливаем DCB
  SetCommState(CommHandle, DCB);
  //создаем паралельный поток
  //там будет вертеться процедура приема строки
  //с порта - ReadComm
  CommThread:=CreateThread(nil, 0, @ReadPort, nil, 0, ThreadID);
end;

procedure ReadPort;
var
  Resive: Array[0..31] of Char;
begin
  while true
  do
    begin
      TransMask:=0;
      WaitCommEvent(CommHandle ,TransMask, @Ovr); //ждем
      if (TransMask and EV_RXFLAG)=EV_RXFLAG
      then //проверяем нужное событие
        begin
          ClearCommError(CommHandle ,Errs, @Stat);//сбрасываем флаг
          Kols := 34;//Stat.cbInQue;
          ReadFile(CommHandle, Resive, Kols, Kols, @Ovr);//читаем
          //тут должна идти обработка принятой информации из Resive
          s:='';
          s:=string(Resive);
          Form1.TDo.Enabled:=True;
          //не очень хороший вариант вывода, но для примера подойдет
        end;//mask
    end;
end;

procedure WritePort(A: Byte);
var
  Transmit: Array[0..255] of Char;
begin
  //послать один символ в порт
  KolByte:=1;
  Transmit[0]:=Chr(A);
  WriteFile(CommHandle, Transmit, KolByte, KolByte, @Ovr);
end;

procedure ClosePort;
begin
  TerminateThread(CommThread, 0);
  CloseHandle(CommHandle);
end;

end.
