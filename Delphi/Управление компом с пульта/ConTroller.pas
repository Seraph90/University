unit ConTroller;

interface

const
  L=8;

type
  TConTroller=class
    Commands: array[1..L] of Integer;
    Number: Integer;
    LastCommand: Integer;
    constructor Create;
    function Encode(Command: String): Integer;
    procedure Search(ECommand: Integer);
    procedure Run(tNumber: Integer);
  end;

implementation

uses SysUtils, Math, Windows, Messages;

procedure MonitorState(isOn: boolean);
var
  i:Integer;
begin
  if isOn
  then
    i:=-1
  else
    i:=2;
  SendMessage(HWND_BROADCAST, WM_SYSCOMMAND, SC_MONITORPOWER, i);
end;

{ TConTroller }

constructor TConTroller.Create;
begin
  LastCommand:=0;
  {
  00000000111111111000101001110101 play
  00000000111111110010001011011101 stop
  00000000111111111000000001111111 last
  00000000111111111010001001011101 next
  00000000111111110101100010100111 ff
  00000000111111110110000010011111 +
  00000000111111110111101010000101 -
  00000000111111111110101000010101 mute
  }
  Commands[1]:=16747125;
  Commands[2]:=16720605;
  Commands[3]:=16744575;
  Commands[4]:=16753245;
  Commands[5]:=16734375;
  Commands[6]:=16743045;
  Commands[7]:=16736415;
  Commands[8]:=16771605;
end;

function TConTroller.Encode(Command: String): Integer;
var
  i: Integer;
begin
  if Length(Command)<32
  then
    Abort;
  LastCommand:=0;
  for i:=1 to 32
  do
    LastCommand:=LastCommand+StrToInt(Command[i])*Round(Power(2,32-i));
  Encode:=LastCommand;
  Search(LastCommand);
end;


procedure TConTroller.Search(ECommand: Integer);
var
  i: Integer;
begin
  for i:=1 to L
  do
    if ECommand=Commands[i]
    then
      begin
        Number:=i;
        Break;
      end;
  Run(Number);
end;


procedure TConTroller.Run(tNumber: Integer);
var
  h: HWND;
  wParam: Integer;
begin
  wParam:=0;
  h:=FindWindow('WMPlayerApp', nil);
  case tNumber
  of
    1: wParam:=$4978; //Play/pause
    2: wParam:=$4979; //Stop
    3: wParam:=$497A; //Last song
    4: wParam:=$497B; //Next song
    5: wParam:=$497D; //FF
    6: wParam:=$4980; //Vol+
    7: wParam:=$497F; //Vol-
    8: wParam:=$4981; //Mute
    9: MonitorState(state);
  else
    wParam:=0;
  end;
  SendMessage(h, WM_COMMAND, wParam,0);
end;


end.
