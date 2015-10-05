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
  //�������� � ������������ �����
  KolByte:=0;
  //�������� ����� � ��������� ��� ������
  CommHandle:=CreateFile('COM6', GENERIC_READ or GENERIC_WRITE, 0, nil, OPEN_EXISTING,
    FILE_ATTRIBUTE_NORMAL or FILE_FLAG_OVERLAPPED, 0);
  //������ ����� - "�� ���������� ������������� �������"
  SetCommMask(CommHandle, EV_RXFLAG);
  //���������� DCB
  GetCommState(CommHandle, DCB);
  DCB.BaudRate:=CBR_9600;
  DCB.Parity:=NOPARITY;
  DCB.ByteSize:=8;
  DCB.StopBits:=OneStopBit;
  DCB.EvtChar:=Chr(13);//������� ������� ��� �����
  //������������� DCB
  SetCommState(CommHandle, DCB);
  //������� ����������� �����
  //��� ����� ��������� ��������� ������ ������
  //� ����� - ReadComm
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
      WaitCommEvent(CommHandle ,TransMask, @Ovr); //����
      if (TransMask and EV_RXFLAG)=EV_RXFLAG
      then //��������� ������ �������
        begin
          ClearCommError(CommHandle ,Errs, @Stat);//���������� ����
          Kols := 34;//Stat.cbInQue;
          ReadFile(CommHandle, Resive, Kols, Kols, @Ovr);//������
          //��� ������ ���� ��������� �������� ���������� �� Resive
          s:='';
          s:=string(Resive);
          Form1.TDo.Enabled:=True;
          //�� ����� ������� ������� ������, �� ��� ������� ��������
        end;//mask
    end;
end;

procedure WritePort(A: Byte);
var
  Transmit: Array[0..255] of Char;
begin
  //������� ���� ������ � ����
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
