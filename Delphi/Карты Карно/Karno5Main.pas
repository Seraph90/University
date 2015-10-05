unit Karno5Main;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, Spin, Grids, StdCtrls, Math;

type
  TMySet=set of Byte;

  TMain = class(TForm)
    E_F: TEdit;
    L_F: TLabel;
    SG_K: TStringGrid;
    SE_n: TSpinEdit;
    L_n: TLabel;
    B_Acc: TButton;
    L_Karno: TLabel;
    Memo: TMemo;
    Label1: TLabel;
    E_R: TEdit;
    procedure SE_nChange(Sender: TObject);
    procedure B_AccClick(Sender: TObject);
    procedure SG_KMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG_KMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SG_KMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    procedure SGClear;
    function Freezing(xc, xr: Integer): TMySet;
    function Calc(What, LB, RB, Op1, Op2, fName: string): integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main:TMain;
  Karno:array[1..32,1..16] of Boolean;
  n,nc,nr:Byte;
  x:array[1..9] of Byte;

implementation

{$R *.dfm}

procedure TMain.SGClear;
var
  i,j:Byte;
begin
  for i:=1 to nr
  do
    for j:=1 to nc
    do
      SG_K.Cells[j-1,i-1]:='0';
end;

procedure TMain.SE_nChange(Sender: TObject);
begin
  n:=SE_n.Value;
  if (n mod 2)=0
  then
    begin
      nc:=1 shl (n div 2);
      nr:=nc;
    end
  else
    begin
      nc:=1 shl ((n+1) div 2);
      nr:=nc div 2;
    end;
  if n>3
  then
    with Main
    do
    begin
      Width:=156+25*nc;
      Height:=262+25*nr
    end;
  SG_K.ColCount:=nc;
  SG_K.RowCount:=nr;
  SGClear;
  //Main.Position:=poDesigned;
  //Main.Position:=poScreenCenter;
end;

function TMain.Calc(What,LB,RB,Op1,Op2,fName:string):integer;
label
  Include,Include2;
var
  Cube:array[0..4,0..4]of Boolean;
  fI,fJ,fP,fQ:array[0..1000]of byte;
  i,j,k,q,p,ResE,ti,tj:integer;
  {w,h:Byte;}
  Res,Res2:string;
  Sq:integer;
  Sf,Si:array[0..1000]of set of byte;
  Stoped,Was:Boolean;

procedure ShowCube;
var
  i:integer;
begin
  //exit;
  for i:=0 to 4
  do
    Memo.Lines.Add('> '+IntToStr(Byte(Cube[0,i]))+IntToStr(Byte(Cube[1,i]))
     +IntToStr(Byte(Cube[2,i]))+IntToStr(Byte(Cube[3,i]))
     +IntToStr(Byte(Cube[4,i])));
end;

begin
  //SG_K.Refresh;
  i:=0;
  //Memo.Clear;
  Sq:=0;
  with Memo
  do
    begin
      while i<nr
      do
        begin
          j:=0;
          while j<nc
          do
            begin
              if SG_K.Cells[j,i]=What
              then
                begin
                  FillChar(Cube,SizeOf(Cube),0);
                  for q:=0 to 4
                  do
                    begin
                      for p:=0 to 4
                      do
                        begin
                          Stoped:=false;
                          if(1 shl p<=nr)and(1 shl q<=nc)
                          then
                            begin
                              for ti:=i to i+(1 shl p)-1
                              do
                                for tj:=j to j+(1 shl q)-1
                                do
                                  Stoped:=Stoped or(SG_K.Cells[tj mod nc,ti mod nr]=IntToStr(1-StrToInt(What)));
                              if not Stoped
                              then
                                Cube[q,p]:=True;
                            end;
                        end;
                    end;
                  //ShowCube;
                  p:=4;
                  q:=0;
                  Was:=false;
                  repeat
                    if Cube[q,p]
                    then
                      begin
                        if not Cube[q+1,p]
                        then
                          begin
                            Stoped:=false;
                            for k:=1 to Sq
                            do
                              begin
                                for ti:=i to i+(1 shl p)-1
                                do
                                  for tj:=j to j+(1 shl q)-1
                                  do
                                    if not((16*(ti mod nr)+tj mod nc)in Si[k])
                                    then
                                      goto Include;
                                Stoped:=true;
                                Break;
                                Include:{continue;}
                              end;
                            if not Stoped
                            then
                              begin
                                inc(Sq);
                                for ti:=1 to n
                                do
                                  Sf[Sq]:=Sf[Sq]+[ti,10+ti];
                                Si[Sq]:=[];
                                for ti:=i to i+(1 shl p)-1
                                do
                                  for tj:=j to j+(1 shl q)-1
                                  do
                                    begin
                                      Si[Sq]:=Si[Sq]+[16*(ti mod nr)+tj mod nc];
                                      Sf[Sq]:=Sf[Sq]*Freezing(tj mod nc,ti mod nr);
                                      fI[Sq]:=i;
                                      fJ[Sq]:=j;
                                      fP[Sq]:=P;
                                      fQ[Sq]:=Q;
                                    end;
                              end;
                            Dec(p);
                            if p<0
                            then
                              break;
                          end;
                        Inc(q);
                        if q>4
                        then
                          break;
                      end
                    else
                      dec(p);
                  until(p<0)or(q<0)or(q>4);
                end;
              Inc(j);
            end;
          Inc(i);
        end;
      for k:=1 to Sq
      do
        begin
          Si[0]:=[];
          for ti:=1 to Sq
          do
            if ti<>k
            then
              Si[0]:=Si[0]+Si[ti];
          for ti:=fI[k] to fI[k]+(1 shl fP[k])-1
          do
            for tj:=fJ[k] to fJ[k]+(1 shl fQ[k])-1
            do
              if not((16*(ti mod nr)+tj mod nc)in Si[0])
              then
                goto Include2;
          Si[k]:=[];
          Include2:{continue;}
        end;
      Res:='';
      ResE:=0;
      for k:=1 to Sq
      do
        if Si[k]<>[]
        then
          begin
            Was:=false;
            Res2:='';
            for i:=1 to n
            do
              if i in Sf[k]
              then
                begin
                  inc(ResE);
                  Res2:=Res2+{>IntToStr(i){|}chr(i+$60){<}+Op1;
                end
              else
                if 10+i in Sf[k]
                then
                  begin
                    inc(ResE);
                    Res2:=Res2+'¬'+{>IntToStr(i){|}chr(i+$60){<}+Op1;
                  end;
            if Res2>''
            then
              begin
                if Res>''
                then
                  Res:=Res+Op2;
                Res:=Res+LB+copy(Res2,1,length(Res2)-length(Op1))+RB;
              end;
          end;
      E_R.Text:=Res;
      if Res=''
      then
        Res:='Функция равна единице'
      else
        Res:=Res+' ['+IntToStr(ResE-1)+' оп.]';
      Lines.Add(fName+': '+Res);
      Calc:=ResE;
    end;
end;

procedure TMain.B_AccClick(Sender: TObject);
var
  E1,E0:string;
  L1,L0:integer;
begin
  Memo.Clear;
  L0:=Calc('0','(',')',' V ',' ^ ','МКНФ');
  E0:=E_R.Text;
  L1:=Calc('1','','','',' V ','МДНФ');
  E1:=E_R.Text;
  with Memo
  do
    if L1<L0
    then
      begin
        //E_R.Text:=E1;
        Lines.Add('МДНФ короче');
      end
    else
      if L1>L0
      then
        begin
          E_R.Text:=E0;
          Lines.Add('МКНФ короче')
        end
      else
        Lines.Add('Обе формулы одинаково эффективны');
end;

function TMain.Freezing(xc,xr:Integer):TMySet;
var
  i,j,h,k,k1:Integer;
  s:TMySet;
begin
  h:=((n-1) div 2)+1;
  s:=[];
  for i:=1 to h
  do
    begin
      for k:=0 to h div (1 shl i)
      do
        begin
          k1:=k*(1 shl (i+1));
          for j:=k1+(1 shl i)-(1 shl (i-1))+1 to Min(k1+(1 shl i)+(1 shl (i-1)),nc)
          do
            begin
              if xc+1=j
              then
                s:=s+[i];
              if (((n mod 2)=0) or (i<h)) and (xr+1=j)
              then
                s:=s+[i+h];
            end;
        end;
    end;
  for i:=1 to n
  do
    if not(i in s)
    then
      s:=s+[10+i];
  Freezing:=s;
end;

procedure TMain.SG_KMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  xc,xr:Integer;
begin
  SG_K.MouseToCell(x,y,xc,xr);
  SG_K.Cells[xc,xr]:=IntToStr(1-StrToInt(SG_K.Cells[xc,xr]));
end;

procedure TMain.FormCreate(Sender: TObject);
var
  i,j:integer;
begin
  SE_n.Value:=4;
  SE_nChange(nil);
  SGClear;
  {>
    1100
    1111
    1110
    0010

  for i:=1 to nr
  do
    for j:=1 to nc
    do
      SG_K.Cells[j-1,i-1]:='1';
  SG_K.Cells[2,0]:='0';
  SG_K.Cells[3,0]:='0';
  SG_K.Cells[0,3]:='0';
  SG_K.Cells[1,3]:='0';
  SG_K.Cells[3,2]:='0';
  SG_K.Cells[3,3]:='0';
  {<}
end;

procedure TMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=vk_Escape
 then
   Close;
end;

procedure TMain.SG_KMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  l:string;
  p:TPoint;
  xc,xr:Integer;
begin
  SG_K.MouseToCell(x,y,xc,xr);
  p.x:=x;
  p.y:=y;
  l:=IntToStr(xr+1)+'с/'+IntToStr(xc+1)+'к';
  if l<>SG_K.Hint
  then
    begin
      SG_K.Hint:=l;
      try
        Application.ActivateHint(p);
      except
      end;
    end;
end;

procedure TMain.SG_KMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  v:string;
begin
  v:=SG_K.Cells[SG_K.Selection.Left,SG_K.Selection.top];
  for x:=SG_K.Selection.Left to SG_K.Selection.Right
  do
    for y:=SG_K.Selection.top to SG_K.Selection.bottom
    do
      SG_K.Cells[x,y]:=v;
end;

end.
