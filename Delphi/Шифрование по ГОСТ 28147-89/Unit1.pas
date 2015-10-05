unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ComCtrls;

type
  TForm1 = class(TForm)
    E_C: TEdit;
    B_Code: TButton;
    B_Decode: TButton;
    SG: TStringGrid;
    StringGrid1: TStringGrid;
    M_Text: TMemo;
    M_Code: TMemo;
    Label1: TLabel;
    M_Decode: TMemo;
    PB: TProgressBar;
    procedure B_CodeClick(Sender: TObject);
    procedure B_DecodeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function Step(tN: String; tk: Cardinal): String;
    function FCode(ts: String): string;
    function FDecode(ts: String): string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  S: array[1..8, 1..16] of Byte = ((14, 10, 4, 11, 5, 3, 13, 7, 16, 2, 6, 9, 8, 12, 1, 15), (7, 15, 6, 1, 8, 12, 3, 5, 9, 2, 16, 4, 11, 10, 13, 14), (13, 2, 14, 3, 12, 8, 7, 16, 15, 5, 9, 11, 6, 4, 1, 10), (16, 15, 13, 4, 12, 6, 5, 11, 1, 3, 14, 9, 2, 8, 7, 10), (7, 10, 13, 8, 1, 3, 15, 12, 11, 16, 6, 14, 5, 4, 9, 2), (6, 15, 10, 14, 11, 2, 13, 7, 5, 4, 8, 9, 16, 1, 12, 3), (2, 5, 14, 13, 6, 16, 15, 11, 7, 1, 10, 9, 4, 12, 3, 8), (13, 2, 4, 12, 1, 6, 10, 16, 11, 3, 5, 9, 7, 15, 8, 14));
  //S: array[1..8, 1..16] of Byte;
  Code: String[255];
  k: array[1..8] of Integer absolute Code;                                                                                                    


implementation

{$R *.dfm}
{$R WindowsXP.res}

function TForm1.Step(tN: String; tk: Cardinal): String;
var
  N1, N2, i, tf: Cardinal;
  ts: String;
  S_, nS_: array[1..8] of Byte;
begin
  N1:=0;
  N2:=0;
  for i:=1 to 4
  do
    begin
      N1:=N1 shl 8;
      N2:=N2 shl 8;
      N2:=N2+Ord(tN[i]);
      N1:=N1+Ord(tN[i+4]);
    end;
  tf:=N1+tk;
  for i:=1 to 8
  do
    S_[i]:=0;
  S_[1]:=(tf and $f0000000) shr 28;
  S_[2]:=(tf and $0f000000) shr 24;
  S_[3]:=(tf and $00f00000) shr 20;
  S_[4]:=(tf and $000f0000) shr 16;
  S_[5]:=(tf and $0000f000) shr 12;
  S_[6]:=(tf and $00000f00) shr 8;
  S_[7]:=(tf and $000000f0) shr 4;
  S_[8]:=(tf and $0000000f);
  for i:=1 to 8
  do
    nS_[i]:=S[i, S_[i]];
  for i:=1 to 8
  do
    begin
      StringGrid1.Cells[0, i-1]:=IntToStr(S_[i]);
      StringGrid1.Cells[1, i-1]:=IntToStr(nS_[i]);
    end;
  tf:=0;
  for i:=1 to 8
  do
    begin
      tf:=tf shl 4;
      tf:=tf+nS_[i];
    end;
  asm
		rol tf, 11
	end;
  tf:=tf xor N2;
  N2:=N1;
  N1:=tf;
  SetLength(ts, 8);
  ts[1]:=Chr((N2 and $ff000000) shr 24);
  ts[2]:=Chr((N2 and $00ff0000) shr 16);
  ts[3]:=Chr((N2 and $0000ff00) shr 8);
  ts[4]:=Chr (N2 and $000000ff);
  ts[5]:=Chr((N1 and $ff000000) shr 24);
  ts[6]:=Chr((N1 and $00ff0000) shr 16);
  ts[7]:=Chr((N1 and $0000ff00) shr 8);
  ts[8]:=Chr (N1 and $000000ff);
  //Application.ProcessMessages;
  Step:=ts;
end;

function TForm1.FCode(ts: String): String;
var
  i, j: Integer;
  tts: String;
begin
  tts:=ts;
  //Memo1.Clear;
  tts:=Copy(tts, 5, 4)+Copy(tts, 1, 4);
  for j:=1 to 4
  do
    for i:=1 to 8
    do
      begin
        if j=4
        then
          tts:=Step(tts, k[9-i])
        else
          tts:=Step(tts, k[i]);
        //Memo1.Lines.Add(IntToStr(Memo1.Lines.Count+1)+' '+tts);
      end;
  //Inc(asd);
  //M_Decode.Lines.Add(IntToStr(asd)+' '+ts);
  FCode:=tts;
end;

function TForm1.FDecode(ts: String): String;
var
  i, j: Integer;
  tts: String;
begin
  tts:=ts;
  //Memo2.Clear;                                                                                                                              //asd:=-1;
  tts:=Copy(tts, 5, 4)+Copy(tts, 1, 4);
  for j:=1 to 4
  do
    for i:=1 to 8
    do
      begin
        if j=1
        then
          tts:=Step(tts, k[i])
        else
          tts:=Step(tts, k[9-i]);
        //Memo2.Lines.Add(IntToStr(Memo2.Lines.Count+1)+' '+tts);
      end;
  FDecode:=tts;
end;

procedure TForm1.B_CodeClick(Sender: TObject);
var
  s: String;
begin
  Code:=E_C.Text;
  s:=M_Text.Text;
  while (Length(s) mod 8)<>0
  do
    s:=s+' ';
  PB.Max:=Length(s) div 8-8;
  PB.Position:=0;
  M_Code.Clear;
  //M_Decode.Clear;
  while Length(s)>7
  do
    begin
      M_Code.Text:=M_Code.Text+FCode(Copy(s, 1, 8));
      M_Code.Update;
      Application.ProcessMessages;
      PB.Position:=PB.Position+1;
      Sleep(Random(100)+50);
      Delete(s, 1, 8);
    end;
end;

procedure TForm1.B_DecodeClick(Sender: TObject);
var
  s: String;
begin
  Code:=E_C.Text;
  s:=M_Code.Text;
  PB.Max:=Length(s) div 8-8;
  PB.Position:=0;
  //M_Code.Clear;
  M_Decode.Clear;
  while Length(s)>7
  do
    begin
      M_Decode.Text:=M_Decode.Text+FDecode(Copy(s, 1, 8));
      M_Decode.Update;
      PB.Position:=PB.Position+1;
      Sleep(Random(100)+50);
      Delete(s, 1, 8);
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i, j, r: Integer;
  ts: set of Byte;
begin
  {
  Randomize;
  for i:=1 to 8
  do
    begin
      ts:=[];
      for j:=1 to 16
      do
        ts:=ts+[j];
      j:=1;
      repeat
        r:=Random(16)+1;
        if r in ts
        then
          begin
            ts:=ts-[r];
            s[i, j]:=r;
            Inc(j);
          end;
      until ts=[];
    end;
  }
  for i:=1 to 8
  do
    for j:=1 to 16
    do
      SG.Cells[j-1, i-1]:=IntToStr(S[i, j]);
  //B_Code.Click;
  //B_Decode.Click;
end;

end.
