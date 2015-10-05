unit UPort;

interface

uses Windows, Sysutils;

type
  TComPort=class
  hPort: Integer;
  DCB: TDCB;
  Ovr: TOverlapped;
  Stat: TComStat;
  hEvent: THandle;
  Flag, StopResive: boolean;
  CommThread: THandle;
  ByteAmount, Kols, Mask, TransMask, Errs: DWord;
    constructor Create;
    procedure ReadComm;
    procedure WriteComm(A: Byte);
    destructor Destroy;
  end;

implementation

uses Variants;

constructor TComPort.Create;
var
  ThreadID: DWord;
begin
  ByteAmount:=0;
  //Создание порта и получение его хэндла
  hPort:= CreateFile('COM6', GENERIC_READ or GENERIC_WRITE, 0, nil, OPEN_EXISTING,
  FILE_ATTRIBUTE_NORMAL or FILE_FLAG_OVERLAPPED, 0);
  //Ставим маску - "по пришествии определенного символа"
  //Построение DCB
  GetCommState(hPort, DCB);
  DCB.BaudRate:=CBR_9600;
  DCB.Parity:=NOPARITY;
  DCB.ByteSize:=8;
  DCB.StopBits:=OneStopBit;
  //Задание символа для флага
  DCB.EvtChar:=chr(13);
  //Устанавливаем DCB
  SetCommState(hPort, DCB);
  //Создаем паралельный поток
  //CommThread:=CreateThread(nil, 0, @TComPort.ReadComm, nil, 0, ThreadID);
end;

procedure TComPort.ReadComm;
var
  Resive:array[0..255] of Char;
begin
  while True
  do
    begin
      TransMask:=0;
      WaitCommEvent(hPort, TransMask, @Ovr);
      if(TransMask and EV_RXFLAG)=EV_RXFLAG
      then
        begin
          ClearCommError(hPort, Errs, @Stat);
          Kols:=Stat.cbInQue;
          ReadFile(hPort, Resive, Kols, Kols, @Ovr);
        end;
    end;
end;

procedure TComPort.WriteComm(A: Byte);
var
  Transmit:array[0..255] of Char;
begin
  ByteAmount:=1;
  Transmit[0]:=Chr(A);
  WriteFile(hPort, Transmit, ByteAmount, ByteAmount, @Ovr);
end;

destructor TComPort.Destroy;
begin
  TerminateThread(CommThread,0);
  CloseHandle(hPort);
end;

end.

