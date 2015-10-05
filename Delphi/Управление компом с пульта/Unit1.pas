unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ConTroller, UPort, Spin, Grids, Math, PortUnit,
  ExtCtrls;

type
  TForm1 = class(TForm)
    TDo: TTimer;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TDoTimer(Sender: TObject);
  private
  public
  end;

var
  Form1: TForm1;
  Ctrl: TConTroller;
  s: String;

implementation

{$R *.dfm}
{$R WindowsXP.res}

procedure TPresskey(key:String);
var
  i:Integer;
begin
  key:=AnsiUpperCase(key);
  for i:=1 to Length(key)
  do
    begin
      keybd_event(Ord(key[i]),0,0,0);
      Sleep(10);
      keybd_event(Ord(key[i]),0,KEYEVENTF_KEYUP,0);
      Sleep(50);
    end;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  Ctrl:=TConTroller.Create;
  InitPort;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClosePort;
end;

procedure TForm1.TDoTimer(Sender: TObject);
begin
  Ctrl.Encode(s);
  TDo.Enabled:=False;
end;

end.
