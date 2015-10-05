unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Grids, XPMan, Buttons, Math, ExtCtrls, Spin,
  Operations;

type
  TForm1 = class(TForm)
    XPManifest1: TXPManifest;
    SG_AP: TStringGrid;
    Image1: TImage;
    SG_XYP: TStringGrid;
    SG_AQ: TStringGrid;
    SG_AR: TStringGrid;
    SG_XYQ: TStringGrid;
    SG_XYR: TStringGrid;
    PC: TPageControl;
    TS_P: TTabSheet;
    TS_Q: TTabSheet;
    TS_R: TTabSheet;
    M_Ds: TMemo;
    B_Ds: TButton;
    B_Us: TButton;
    M_Us: TMemo;
    B_Ac: TButton;
    B_Sppl: TButton;
    B_Inv: TButton;
    B_Is: TButton;
    B_Un: TButton;
    B_Dgr: TButton;
    E_Dgr: TEdit;
    B_Dual: TButton;
    B_GmLn: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure B_DsClick(Sender: TObject);
    procedure B_UsClick(Sender: TObject);
    procedure B_SpplClick(Sender: TObject);
    procedure B_InvClick(Sender: TObject);
    procedure B_IsClick(Sender: TObject);
    procedure B_UnClick(Sender: TObject);
    procedure B_DgrClick(Sender: TObject);
    procedure B_DualClick(Sender: TObject);
    procedure B_AcClick(Sender: TObject);
    procedure B_GmLnClick(Sender: TObject);
    procedure M_UsClick(Sender: TObject);
  private
    procedure TReW;
    procedure Redraw;
    procedure AddKnot(tx,ty:Integer);
    procedure AddRib(tn1,tn2,tn:Integer);
    procedure Start;
  public
  end;

const
  cl1=$ff00ff;
  cl2=$00ff00;
  cl3=$ffff00;

var
  Form1:TForm1;

implementation

{$R *.dfm}

procedure TForm1.TReW;
var
  i,j:Integer;
begin
  if n[0]=0
  then
    begin
      SG_AP.RowCount:=n[0]+2;
      SG_AP.ColCount:=n[0]+2;
      SG_XYP.RowCount:=n[0]+2;
    end
  else
    begin
      SG_AP.RowCount:=n[0]+1;
      SG_AP.ColCount:=n[0]+1;
      SG_XYP.RowCount:=n[0]+1;
    end;
  if n[1]=0
  then
    begin
      SG_AQ.RowCount:=n[1]+2;
      SG_AQ.ColCount:=n[1]+2;
      SG_XYQ.RowCount:=n[1]+2;
    end
  else
    begin
      SG_AQ.RowCount:=n[1]+1;
      SG_AQ.ColCount:=n[1]+1;
      SG_XYQ.RowCount:=n[1]+1;
    end;
  if n[2]=0
  then
    begin
      SG_AR.RowCount:=n[2]+2;
      SG_AR.ColCount:=n[2]+2;
      SG_XYR.RowCount:=n[2]+2;
    end
  else
    begin
      SG_AR.RowCount:=n[2]+1;
      SG_AR.ColCount:=n[2]+1;
      SG_XYR.RowCount:=n[2]+1;
    end;
  for i:=1 to n[0]
  do
    begin
      SG_XYP.Cells[1,i]:=IntToStr(XY[0][i,1]);
      SG_XYP.Cells[2,i]:=IntToStr(XY[0][i,2]);
      for j:=1 to n[0]
      do
        SG_AP.Cells[i,j]:=FloatToStr(A[0][i,j]);
    end;
  for i:=1 to n[1]
  do
    begin
      SG_XYQ.Cells[1,i]:=IntToStr(XY[1][i,1]);
      SG_XYQ.Cells[2,i]:=IntToStr(XY[1][i,2]);
      for j:=1 to n[1]
      do
        SG_AQ.Cells[i,j]:=FloatToStr(A[1][i,j]);
    end;
  for i:=1 to n[2]
  do
    begin
      SG_XYR.Cells[1,i]:=IntToStr(XY[2][i,1]);
      SG_XYR.Cells[2,i]:=IntToStr(XY[2][i,2]);
      for j:=1 to n[2]
      do
        SG_AR.Cells[i,j]:=FloatToStr(A[2][i,j]);
    end;
end;

procedure TForm1.AddKnot(tx,ty:Integer);
begin
  Inc(n[PC.TabIndex]);
  XY[PC.TabIndex][n[PC.TabIndex],1]:=tx;
  XY[PC.TabIndex][n[PC.TabIndex],2]:=ty;
  case PC.TabIndex
  of
    0:begin
        SG_AP.RowCount:=n[0]+1;
        SG_AP.ColCount:=n[0]+1;
        SG_XYP.RowCount:=n[0]+1;
        SG_XYP.Cells[1,n[0]]:=IntToStr(tx);
        SG_XYP.Cells[2,n[0]]:=IntToStr(ty);
      end;
    1:begin
        SG_AQ.RowCount:=n[1]+1;
        SG_AQ.ColCount:=n[1]+1;
        SG_XYQ.RowCount:=n[1]+1;
        SG_XYQ.Cells[1,n[1]]:=IntToStr(tx);
        SG_XYQ.Cells[2,n[1]]:=IntToStr(ty);
      end;
    2:begin
        SG_AR.RowCount:=n[2]+1;
        SG_AR.ColCount:=n[2]+1;
        SG_XYR.RowCount:=n[2]+1;
        SG_XYR.Cells[1,n[2]]:=IntToStr(tx);
        SG_XYR.Cells[2,n[2]]:=IntToStr(ty);
      end;
  end;
end;

procedure TForm1.AddRib(tn1,tn2,tn:Integer);
begin
  case tn
  of
    0:SG_AP.Cells[tn2,tn1]:=IntToStr(1-StrToInt(SG_AP.Cells[tn2,tn1]));
    1:SG_AQ.Cells[tn2,tn1]:=IntToStr(1-StrToInt(SG_AQ.Cells[tn2,tn1]));
    2:SG_AR.Cells[tn2,tn1]:=IntToStr(1-StrToInt(SG_AR.Cells[tn2,tn1]));
  end;
  A[tn][tn2,tn1]:=1-A[tn][tn2,tn1];
end;

function Radius(tx,ty:Real):Real;
begin
  Radius:=Sqrt(tx*tx+ty*ty);
end;

function fAngle(tx,ty:Real):Real;
begin
  if tx=0
  then
    if ty>0
    then
      fAngle:=3.14/2
    else
      fAngle:=3*3.14/2
  else
    if tx>0
    then
      if ty>0
      then
        fAngle:=ArcTan(ty/tx)
      else
        fAngle:=2*3.14+ArcTan(ty/tx)
    else
      fAngle:=3.14+ArcTan(ty/tx);
end;

procedure TForm1.Redraw;
var
  i,j,k:Integer;
  fi:Real;
begin
  for i:=1 to n[PC.TabIndex]
  do
    begin
      case PC.TabIndex
      of
        0:begin
            XY[0][i,1]:=StrToInt(SG_XYP.Cells[1,i]);
            XY[0][i,2]:=StrToInt(SG_XYP.Cells[2,i]);
          end;
        1:begin
            XY[1][i,1]:=StrToInt(SG_XYQ.Cells[1,i]);
            XY[1][i,2]:=StrToInt(SG_XYQ.Cells[2,i]);
          end;
        2:begin
            XY[2][i,1]:=StrToInt(SG_XYR.Cells[1,i]);
            XY[2][i,2]:=StrToInt(SG_XYR.Cells[2,i]);
          end;
      end;
    end;
  Image1.Canvas.FillRect(Form1.Image1.Canvas.ClipRect);
  for k:=0 to 2
  do
    for i:=1 to n[k]
    do
      for j:=1 to n[k]
      do
        begin
          if A[k][j,i]=1
          then
            begin
              case k
              of
                0:Image1.Canvas.Pen.Color:=cl1;
                1:Image1.Canvas.Pen.Color:=cl2;
                2:Image1.Canvas.Pen.Color:=cl3;
              end;
              Image1.Canvas.MoveTo(XY[k][i,1],XY[k][i,2]);
              Image1.Canvas.LineTo(XY[k][j,1],XY[k][j,2]);
              Fi:=fAngle(XY[k][j,1]-XY[k][i,1],XY[k][j,2]-XY[k][i,2]);
              Image1.Canvas.MoveTo(XY[k][j,1]+Round(14*Cos(Fi+Pi)),XY[k][j,2]+Round(14*Sin(Fi+Pi)));
              Image1.Canvas.LineTo(XY[k][j,1]+Round(14*Cos(Fi+Pi))+Round(20*Cos(Fi-5*Pi/6)),XY[k][j,2]+Round(15*Sin(Fi+Pi))+Round(20*Sin(Fi-5*Pi/6)));
              Image1.Canvas.LineTo(XY[k][j,1]+Round(14*Cos(Fi+Pi))+Round(20*Cos(Fi+5*Pi/6)),XY[k][j,2]+Round(15*Sin(Fi+Pi))+Round(20*Sin(Fi+5*Pi/6)));
              Image1.Canvas.LineTo(XY[k][j,1]+Round(14*Cos(Fi+Pi)),XY[k][j,2]+Round(14*Sin(Fi+Pi)));
            end;
        end;
  for k:=0 to 2
  do
    for i:=1 to n[k]
    do
      begin
        case k
        of
          0:Image1.Canvas.Pen.Color:=cl1;
          1:Image1.Canvas.Pen.Color:=cl2;
          2:Image1.Canvas.Pen.Color:=cl3;
        end;
        Image1.Canvas.Ellipse(XY[k][i,1]-15,XY[k][i,2]-15,XY[k][i,1]+15,XY[k][i,2]+15);
        Image1.Canvas.TextOut(XY[k][i,1]-5,XY[k][i,2]-5,IntToStr(i));
      end;
  Image1.Canvas.Pen.Color:=clBlack;
end;

procedure TForm1.Start;
var
  i,j:Integer;
begin
  Randomize;
  SG_XYP.Cells[1,0]:='x';
  SG_XYP.Cells[2,0]:='y';
  SG_XYQ.Cells[1,0]:='x';
  SG_XYQ.Cells[2,0]:='y';
  SG_XYR.Cells[1,0]:='x';
  SG_XYR.Cells[2,0]:='y';
  n[0]:=0;
  n[1]:=0;
  n[2]:=0;
  Image1.Canvas.FillRect(Image1.Canvas.ClipRect);
  for i:=1 to ns
  do
    begin
      for j:=1 to ns
      do
        begin
          SG_AP.Cells[i,j]:='0';
          SG_AQ.Cells[i,j]:='0';
          SG_AR.Cells[i,j]:='0';
          A[0][i,j]:=0;
          A[1][i,j]:=0;
          A[2][i,j]:=0;
        end;
      SG_AP.Cells[i,0]:=IntToStr(i);
      SG_AP.Cells[0,i]:=IntToStr(i);
      SG_AQ.Cells[i,0]:=IntToStr(i);
      SG_AQ.Cells[0,i]:=IntToStr(i);
      SG_AR.Cells[i,0]:=IntToStr(i);
      SG_AR.Cells[0,i]:=IntToStr(i);
      SG_XYP.Cells[0,i]:=IntToStr(i);
      SG_XYQ.Cells[0,i]:=IntToStr(i);
      SG_XYR.Cells[0,i]:=IntToStr(i);
    end;
  TReW;
  Redraw;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Start;
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  i:Integer;
begin
  if Button=mbRight
  then
    Start;
  if ssCtrl in Shift
  then
    begin
      AddKnot(x,y);
      num:=n[PC.TabIndex];
    end
  else
    for i:=1 to n[PC.TabIndex]
    do
      if Radius(x-XY[PC.TabIndex][i,1],y-XY[PC.TabIndex][i,2])<=15
      then
        begin
          num:=i;
          Break;
        end;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if num=0
  then
    Abort;
  if not(ssShift in Shift)
  then
    begin
      case PC.TabIndex
      of
        0:begin
            SG_XYP.Cells[1,num]:=IntToStr(x);
            SG_XYP.Cells[2,num]:=IntToStr(y);
          end;
        1:begin
            SG_XYQ.Cells[1,num]:=IntToStr(x);
            SG_XYQ.Cells[2,num]:=IntToStr(y);
          end;
        2:begin
            SG_XYR.Cells[1,num]:=IntToStr(x);
            SG_XYR.Cells[2,num]:=IntToStr(y);
          end;
      end;
      Redraw;
    end;
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  i:Integer;
begin
  if num=0
  then
    Abort;
  if ssShift in Shift
  then
    begin
      for i:=1 to n[PC.TabIndex]
      do
        if Radius(x-XY[PC.TabIndex][i,1],y-XY[PC.TabIndex][i,2])<=15
        then
          begin
            AddRib(num,i,PC.TabIndex);
            Break;
          end;
    end
  else
    begin
      case PC.TabIndex
      of
        0:begin
            SG_XYP.Cells[1,num]:=IntToStr(x);
            SG_XYP.Cells[2,num]:=IntToStr(y);
          end;
        1:begin
            SG_XYQ.Cells[1,num]:=IntToStr(x);
            SG_XYQ.Cells[2,num]:=IntToStr(y);
          end;
        2:begin
            SG_XYR.Cells[1,num]:=IntToStr(x);
            SG_XYR.Cells[2,num]:=IntToStr(y);
          end;
      end;
    end;
  Redraw;
  num:=0;
end;



procedure TForm1.B_DsClick(Sender: TObject);
var
  i,j,tn:Integer;
  s:String;
  tA:TMyMat;
begin
  M_Ds.Clear;
  M_Ds.Lines.Add('Нижний срез для отношения '+PC.ActivePage.Caption+':');
  M_Ds.Lines.Add('');
  tA:=A[PC.TabIndex];
  tn:=n[PC.TabIndex];
  Ds:=Get_Ds(tA,tn);
  for i:=1 to tn
  do
    begin
      s:='R-('+IntToStr(i)+'):{';
      for j:=1 to tn
      do
        if j in Ds[i]
        then
          s:=s+IntToStr(j)+',';
        if s[Length(s)]=','
        then
          s[Length(s)]:='}'
        else
          s:=s+'}';
      M_Ds.Lines.Add(s);
    end;
end;

procedure TForm1.B_UsClick(Sender: TObject);
var
  i,j,tn:Integer;
  s:String;
  tA:TMyMat;
begin
  M_Us.Clear;
  M_Us.Lines.Add('Верхний срез для отношения '+PC.ActivePage.Caption+':');
  M_Us.Lines.Add('');
  tA:=A[PC.TabIndex];
  tn:=n[PC.TabIndex];
  Us:=Get_Us(tA,tn);
  for i:=1 to tn
  do
    begin
      s:='R+('+IntToStr(i)+'):{';
      for j:=1 to tn
      do
        if j in Us[i]
        then
          s:=s+IntToStr(j)+',';
        if s[Length(s)]=','
        then
          s[Length(s)]:='}'
        else
          s:=s+'}';
      M_Us.Lines.Add(s);
    end;
end;

procedure TForm1.B_SpplClick(Sender: TObject);
begin
  A[PC.TabIndex]:=Supplement(A[PC.TabIndex],n[PC.TabIndex]);
  TReW;
  Redraw;
end;

procedure TForm1.B_InvClick(Sender: TObject);
begin
  A[PC.TabIndex]:=Inverse(A[PC.TabIndex],n[PC.TabIndex]);
  TReW;
  Redraw;
end;

procedure TForm1.B_IsClick(Sender: TObject);
begin
  A[2]:=Intersection(A[0],A[1],n[0],n[1],n[2],XY[2],True);
  TReW;
  Redraw;
end;

procedure TForm1.B_UnClick(Sender: TObject);
begin
  A[2]:=Union(A[0],A[1],n[0],n[1],n[2],XY[2],True);
  TReW;
  Redraw;
end;

procedure TForm1.B_DgrClick(Sender: TObject);
begin
  A[PC.TabIndex]:=Degree(A[PC.TabIndex],n[PC.TabIndex],StrToInt(E_Dgr.Text));
  TReW;
  Redraw;
end;

procedure TForm1.B_DualClick(Sender: TObject);
begin
  A[PC.TabIndex]:=Duality(A[PC.TabIndex],n[PC.TabIndex]);
  TReW;
  Redraw;
end;

procedure TForm1.B_AcClick(Sender: TObject);
begin
  if Acyclic(A[PC.TabIndex],n[PC.TabIndex])
  then
    MessageBox(Form1.Handle,'Граф ацикличен','Lab №1',MB_OK)
  else
    MessageBox(Form1.Handle,'Граф цикличен','Lab №1',MB_OK);
end;

procedure TForm1.B_GmLnClick(Sender: TObject);
var
  tn,i,j,k:integer;
  tA:TMyMat;
  ts,stp,chk:set of Byte;
  b:Boolean;
  s:string;
begin
  tA:=A[PC.TabIndex];
  tn:=n[PC.TabIndex];
  Ds:=Get_Ds(tA,tn);
  Us:=Get_Us(tA,tn);
  ts:=[];
  stp:=[];
  chk:=[];
  for i:=1 to tn
  do
    if Us[i]=[]
    then
      chk:=chk+[i];
  k:=0;
  if not Acyclic(tA,tn)
  then
    begin
      MessageBox(Form1.Handle,'Граф цикличен','Lab №1',MB_OK);
      Abort;
    end
  else
    begin
      M_Ds.Clear;
      M_Ds.Lines.Add('Гомоморфизм в линейный порядок '+PC.ActivePage.Caption+':');
      M_Ds.Lines.Add('');
      for i:=1 to tn
      do
        begin
          ts:=ts+[i];
          stp:=stp+[i];
        end;
      s:='X:{';
      for i:=1 to tn
      do
        if i in stp
        then
          s:=s+IntToStr(i)+',';
      s[Length(s)]:='}';
      repeat
        Inc(k);
        b:=True;
        for i:=1 to tn
        do
          if stp<>chk
          then
            begin
              b:=False;
              Break;
            end;
        for i:=1 to tn
        do
          begin
            if (Ds[i]=[]) and (i in stp) and (Us[i]<>[])
            then
              stp:=stp-[i];
          end;
        for i:=1 to tn
        do
          if not(i in stp)
          then
            for j:=1 to tn
            do
              if j in Us[i]
              then
                begin
                  Ds[j]:=Ds[j]-[i];
                  Us[i]:=Us[i]-[j];
                end;
        M_Ds.Lines.Add(s);
        s:='X['+IntToStr(k)+']:{';
        for i:=1 to tn
        do
          if i in stp
          then
            s:=s+IntToStr(i)+',';
        if s[Length(s)]=','
        then
          s[Length(s)]:='}'
        else
          s:=s+'}';
      until b;
    end;
end;

procedure TForm1.M_UsClick(Sender: TObject);
var
  tA:TMyMat;
  tn:Integer;
begin
  M_Us.Clear;
  M_Us.Lines.Add('Свойства отношения '+PC.ActivePage.Caption+':');
  M_Us.Lines.Add('');
  tA:=A[PC.TabIndex];
  tn:=n[PC.TabIndex];
  if Reflexivity(tA,tn)
  then
    M_Us.Lines.Add('Рефлексивно');
  if AReflexivity(tA,tn)
  then
    M_Us.Lines.Add('Антирефлексивно');
  if Symmetry(tA,tn)
  then
    M_Us.Lines.Add('Симметрично')
  else
    if ASymmetry(tA,tn)
    then
      M_Us.Lines.Add('Антисимметрично')
    else
      if NSymmetry(tA,tn)
      then
        M_Us.Lines.Add('Асимметрично');
  if Transitivity(tA,tn)
  then
    M_Us.Lines.Add('Транзитивно');
  if Acyclic(tA,tn)
  then
    M_Us.Lines.Add('Ациклично')
  else
    M_Us.Lines.Add('Циклично');
end;

end.


