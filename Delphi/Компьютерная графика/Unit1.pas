unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ExtCtrls, Math, ComCtrls, XPMan, ImgList,
  ExtDlgs, Buttons, Spin;

type
  TForm1 = class(TForm)
    Image1: TImage;



    PC_Labs: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    XPManifest1: TXPManifest;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;   
    B_Clr: TButton;
    TabSheet3: TTabSheet;
    RadioGroup3: TRadioGroup;
    Panel1: TPanel;
    ColorDialog1: TColorDialog;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    TabSheet10: TTabSheet;
    SG_f: TStringGrid;
    Label1: TLabel;
    B_F: TButton;
    B_Opn: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    B_Rdrw: TButton;
    RadioGroup4: TRadioGroup;
    E_c: TEdit;
    Button1: TButton;
    Label2: TLabel;
    Button2: TButton;
    TB_W: TTrackBar;
    B_HCalc: TButton;
    B_BW: TButton;
    Image2: TImage;
    I_R: TImage;
    I_G: TImage;
    I_B: TImage;
    SavePictureDialog1: TSavePictureDialog;
    B_Sav: TButton;
    E_Fctr: TEdit;
    TB_B: TTrackBar;
    B_Exp: TButton;
    B_Com: TButton;
    Button3: TButton;
    PB_M: TProgressBar;
    SB_Win: TSpeedButton;
    SB_Lin: TSpeedButton;
    SG_Win: TStringGrid;
    SG_UDRL: TStringGrid;
    SE_mz: TSpinEdit;
    SG_mz: TStringGrid;
    SG_XY: TStringGrid;
    B_Dup: TButton;
    SG_XY2: TStringGrid;
    T_Anime: TTimer;
    B_Anime: TButton;
    SE_Fs: TSpinEdit;
    RadioGroup5: TRadioGroup;
    T_Aff: TTimer;
    B_Start: TButton;
    B_Stop: TButton;
    B_IncFi: TButton;
    B_DecFi: TButton;
    B_IncPsi: TButton;
    B_DecPsi: TButton;
    B_IncKsi: TButton;
    B_DecKsi: TButton;
    ProgressBar1: TProgressBar;
    procedure FormActivate(Sender: TObject);

    procedure ImgClr(Img:TImage);

    procedure Line_B(x1,y1,x2,y2:Integer; Img:TImage);
    procedure Line_DDA(x1,y1,x2,y2:Integer; Img:TImage);

    procedure Circle_B(tx,ty,r:Integer; Img:TImage);
    procedure Ellipse_B(tx,ty,ar,br:Integer; Img:TImage);

    procedure Fill_Prim(x,y:Integer; Img:TImage);
    procedure Fill_Line(x,y:Integer; Img:TImage);

    function CodeChk(x1,y1,x2,y2:Integer):Byte;

    procedure RedrawD(d:Byte);


    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure B_ClrClick(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure RadioGroup3Click(Sender: TObject);
    procedure B_OpnClick(Sender: TObject);
    procedure B_RdrwClick(Sender: TObject);
    procedure B_FClick(Sender: TObject);
    procedure RadioGroup4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure PC_LabsChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure B_HCalcClick(Sender: TObject);
    procedure B_BWClick(Sender: TObject);
    procedure B_SavClick(Sender: TObject);
    procedure TBChange(Sender: TObject);
    procedure B_ExpComClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure SE_mzChange(Sender: TObject);
    procedure SG_mzMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Redraw;
    procedure B_DupClick(Sender: TObject);
    procedure Image2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure B_AnimeClick(Sender: TObject);
    procedure T_AnimeTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure B_StartClick(Sender: TObject);
    procedure B_StopClick(Sender: TObject);
    procedure T_AffTimer(Sender: TObject);
    procedure B_IncFiClick(Sender: TObject);
    procedure B_DecFiClick(Sender: TObject);
    procedure B_IncPsiClick(Sender: TObject);
    procedure B_DecPsiClick(Sender: TObject);
    procedure B_IncKsiClick(Sender: TObject);
    procedure B_DecKsiClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TMyPoly=array[1..100,1..100] of Integer;
  TMyMat=array[1..3,1..3] of Cardinal;
  TMyF=array[1..3,1..3] of Real;
  TD=array[1..4,1..16] of Real;
var
  Form1: TForm1;
  x1,x2,y1,y2,xx,yy:Integer;
  Can,OPic,IPic:TBitmap;
  Ms,BFill:Boolean;
  f:TMyF;
  mzn,num:Integer;
  XY,XY2:array[1..10,1..2] of Integer;
  dXY:array[1..10,1..2] of Real;
  A,B,C,Au,Bu,Cu,Ad,Bd,Cd,Al,Bl,Cl,Ar,Br,Cr,xu,yu,xd,yd,xr,yr,xl,yl:Integer;
  Win:record
    b:Boolean;
    x1,y1,x2,y2:Integer;
  end;
  XYD,XYZD,nXYD,nXYZD:TD;
  fi,psi,ksi,dfi,dpsi,dksi:Real;
  Rx,Ry,Rz:array[1..4,1..4] of Real;

implementation

uses Unit2;

{$R *.dfm}

function Radius(x1,y1,x2,y2:Integer):Real;
begin
  Radius:=Sqrt(Sqr(x2-x1)+Sqr(y2-y1));
end;

procedure TForm1.Redraw;
var
  i,j{,k}:Integer;
begin
  Image1.Canvas.Brush.Style:=bsSolid;
  Image2.Canvas.Brush.Style:=bsSolid;
  for i:=1 to mzn
  do
    begin
      XY[i,1]:=StrToInt(SG_XY.Cells[1,i]);
      XY[i,2]:=StrToInt(SG_XY.Cells[2,i]);
      XY2[i,1]:=StrToInt(SG_XY2.Cells[1,i]);
      XY2[i,2]:=StrToInt(SG_XY2.Cells[2,i]);
    end;
  ImgClr(Image1);
  ImgClr(Image2);
  for i:=1 to mzn
  do
    for j:=i+1 to mzn
    do
      begin
        if SG_mz.Cells[j,i]='1'
        then
          begin
            {
            Inc(k);
            SG_L.Cells[0,k]:=IntToStr(i)+'-'+IntToStr(j);
            SG_L.Cells[1,k]:=FloatToStr(RoundTo(Sqrt(Sqr(XY[j,1]-XY[i,1])+Sqr(XY[j,2]-XY[i,2])),-3));
            }
            Image1.Canvas.MoveTo(XY[i,1],XY[i,2]);
            Image1.Canvas.LineTo(XY[j,1],XY[j,2]);
            Image2.Canvas.MoveTo(XY2[i,1],XY2[i,2]);
            Image2.Canvas.LineTo(XY2[j,1],XY2[j,2]);
          end;
      end;
  for i:=1 to mzn
  do
    begin
      Image1.Canvas.Ellipse(XY[i,1]-15,XY[i,2]-15,XY[i,1]+15,XY[i,2]+15);
      Image1.Canvas.TextOut(XY[i,1]-5,XY[i,2]-5,IntToStr(i));
      Image2.Canvas.Ellipse(XY2[i,1]-15,XY2[i,2]-15,XY2[i,1]+15,XY2[i,2]+15);
      Image2.Canvas.TextOut(XY2[i,1]-5,XY2[i,2]-5,IntToStr(i));
    end;
  Image1.Canvas.Brush.Style:=bsClear;
  Image2.Canvas.Brush.Style:=bsClear;
end;

procedure GetABC(x1,y1,x2,y2:Integer; var A,B,C:Integer);
begin
  A:=y1-y2;
  B:=x2-x1;
  C:=x1*y2-x2*y1;
end;

procedure GetCrossXY(A1,B1,C1,A2,B2,C2:Integer; var x,y:Integer);
begin
  if (A1*B2-A2*B1)<>0
  then
    begin
      x:=Round((B1*C2-B2*C1)/(A1*B2-A2*B1));
      y:=Round((C1*A2-C2*A1)/(A1*B2-A2*B1));
    end
  else
    begin
      x:=0;
      y:=0;
    end;
end;

function GetAreaNum(x,y:Integer):Byte;
begin
  if x<=Win.x1
  then
    if y<=Win.y1
    then
      GetAreaNum:=1
    else
      if y>=Win.y2
      then
        GetAreaNum:=7
      else
        GetAreaNum:=4
  else
    if x>=Win.x2
    then
      if y<=Win.y1
      then
        GetAreaNum:=3
      else
        if y>=Win.y2
        then
          GetAreaNum:=9
        else
          GetAreaNum:=6
    else
      if y<=Win.y1
      then
        GetAreaNum:=2
      else
        if y>=Win.y2
        then
          GetAreaNum:=8
        else
          GetAreaNum:=5;
end;

function TForm1.CodeChk(x1,y1,x2,y2:Integer):Byte;
var
  u1,d1,r1,l1,u2,d2,r2,l2:Boolean;
begin
  if x1<=Win.x1
  then
    begin
      l1:=True;
      r1:=False;
    end
  else
    if x1>=Win.x2
    then
      begin
        l1:=False;
        r1:=True;
      end
    else
      begin
        l1:=False;
        r1:=False;
      end;

  if x2<=Win.x1
  then
    begin
      l2:=True;
      r2:=False;
    end
  else
    if x2>=Win.x2
    then
      begin
        l2:=False;
        r2:=True;
      end
    else
      begin
        l2:=False;
        r2:=False;
      end;

  if y1<=Win.y1
  then
    begin
      d1:=True;
      u1:=False;
    end
  else
    if y1>=Win.y2
    then
      begin
        d1:=False;
        u1:=True;
      end
    else
      begin
        d1:=False;
        u1:=False;
      end;

  if y2<=Win.y1
  then
    begin
      d2:=True;
      u2:=False;
    end
  else
    if y2>=Win.y2
    then
      begin
        d2:=False;
        u2:=True;
      end
    else
      begin
        d2:=False;
        u2:=False;
      end;
  SG_UDRL.Cells[0,0]:=BoolToStr(d1);
  SG_UDRL.Cells[1,0]:=BoolToStr(u1);
  SG_UDRL.Cells[2,0]:=BoolToStr(r1);
  SG_UDRL.Cells[3,0]:=BoolToStr(l1);
  SG_UDRL.Cells[0,1]:=BoolToStr(d2);
  SG_UDRL.Cells[1,1]:=BoolToStr(u2);
  SG_UDRL.Cells[2,1]:=BoolToStr(r2);
  SG_UDRL.Cells[3,1]:=BoolToStr(l2);
  if not(u1 or u2 or d1 or d2 or r1 or r2 or l1 or l2)
  then
    CodeChk:=1
  else
    if (u1 and u2) or (d1 and d2) or (r1 and r2) or (l1 and l2)
    then
      CodeChk:=2
    else
      CodeChk:=3;
end;

procedure TForm1.Line_B(x1,y1,x2,y2:Integer; Img:TImage);
var
  clr,x,y,dx,dy,sx,sy,z,e,i:integer;
  Parity:Boolean;
begin
  clr:=Img.Canvas.Pen.Color;
  x:=x1;
  y:=y1;
  dx:=Abs(x2-x1);
  dy:=Abs(y2-y1);
  sx:=Sign(x2-x1);
  sy:=Sign(y2-y1);
  if (dx=0) and (dy=0)
  then
    begin
      Img.Canvas.Pixels[x1,y1]:=clr;
      Exit;
    end;
  if dy>dx
  then
    begin
      z:=dx;
      dx:=dy;
      dy:=z;
      Parity:=True;
    end
  else
    Parity:=False;
  e:=2*dy-dx;
  i:=1;
  repeat
    Img.Canvas.Pixels[x,y]:=clr;
    while e>=0
    do
      begin
        if Parity
        then
          x:=x+sx
        else
          y:=y+sy;
        e:=e-2*dx;
      end;
    if Parity
    then
      y:=y+sy
    else
      x:=x+sx;
    e:=e+2*dy;
    inc(i);
  until i>dx;
  Img.Canvas.Pixels[x,y]:=clr;
end;

procedure TForm1.Line_DDA(x1,y1,x2,y2:Integer; Img:TImage);
var
  gx,gy,dx,dy,x,y:real;
  clr,i,L:integer;
begin
  clr:=Img.Canvas.Pen.Color;
  dx:=(x2-x1);
  dy:=(y2-y1);
  gx:=0;
  gy:=0;
  if abs(dx)>=abs(dy)
  then
    begin
      gx:=1;
      if dx<>0
      then
        gy:=dy/dx;
      L:=Round(abs(dx));
    end
  else
    begin
      gy:=1;
      if dy<>0
      then
        gx:=dx/dy;
      L:=round(abs(dy));
    end;
  x:=x1;
  y:=y1;
  if (x2<=x1) and (Abs(dx)>=Abs(dy)) or (y2<=y1) and (Abs(dx)<Abs(dy))
  then
    for i:=0 to L
    do
      begin
        Img.Canvas.Pixels[round(x),round(y)]:=clr;
        x:=x-gx;
        y:=y-gy;
      end
  else
    for i:=0 to L
    do
      begin
        Img.Canvas.Pixels[round(x),round(y)]:=clr;
        x:=x+gx;
        y:=y+gy;
      end;
end;

procedure TForm1.Circle_B(tx,ty,r:Integer; Img:TImage);
var
  clr,x,y,d:Integer;
begin
  clr:=Img.Canvas.Pen.Color;
  x:=0;
  y:=r;
  d:=3-2*r;
  while x<=y
  do
    begin
      Img.Canvas.Pixels[tx+x,ty+y]:=clr;
      Img.Canvas.Pixels[tx+y,ty+x]:=clr;
      Img.Canvas.Pixels[tx+y,ty-x]:=clr;
      Img.Canvas.Pixels[tx+x,ty-y]:=clr;
      Img.Canvas.Pixels[tx-x,ty-y]:=clr;
      Img.Canvas.Pixels[tx-y,ty-x]:=clr;
      Img.Canvas.Pixels[tx-y,ty+x]:=clr;
      Img.Canvas.Pixels[tx-x,ty+y]:=clr;
      if d<0
      then
        d:=d+4*x+6
      else
        begin
          d:=d+4*(x-y)+10;
          Dec(y);
        end;
      Inc(x);
    end;
end;

procedure TForm1.Ellipse_B(tx,ty,ar,br:Integer; Img:TImage);
var
  clr,x,y,dx,dy:Integer;
  e:Real;
begin
  clr:=Img.Canvas.Pen.Color;
  x:=0;
  y:=br;
  dx:=0;
  dy:=2*Sqr(ar)*br;
  e:=Sqr(ar)/4-Sqr(ar)*br;
  while dx<dy
  do
    begin
      e:=e+dx+Sqr(br);
      if e>-0
      then
        begin
          dy:=dy-2*Sqr(ar);
          e:=e-dy;
          Dec(y);
        end;
      dx:=dx+2*Sqr(br);
      Img.Canvas.Pixels[tx+x,ty+y]:=clr;
      Img.Canvas.Pixels[tx+x,ty-y]:=clr;
      Img.Canvas.Pixels[tx-x,ty-y]:=clr;
      Img.Canvas.Pixels[tx-x,ty+y]:=clr;
      Inc(x);
    end;
  x:=ar;
  y:=0;
  dx:=2*ar*br*br;
  dy:=0;
  e:=(ar*ar)/4-ar*ar*br;
  while dy<=dx
  do
    begin
      e:=e+dy+ar*ar;
      if e>=0
      then
        begin
          dx:=dx-2*br*br;
          e:=e-dx;
          x:=x-1;
        end;
      dy:=dy+2*ar*ar;
      Img.Canvas.Pixels[tx+x,ty+y]:=clr;
      Img.Canvas.Pixels[tx+x,ty-y]:=clr;
      Img.Canvas.Pixels[tx-x,ty+y]:=clr;
      Img.Canvas.Pixels[tx-x,ty-y]:=clr;
      y:=y+1;
    end;
end;

procedure TForm1.Fill_Prim(x,y:Integer; Img:TImage);
type
  Pix=record
    x,y:Integer;
  end;
var
  Mas1,Mas2:array of Pix;
  pclr,clr:Integer;

function CPxl(x,y:Integer):Boolean;
begin
  CPxl:=(Img.Canvas.Pixels[x,y]<>pclr) and ((x>=0) or (x<Img.Width) or (y>=0) or (y<Img.Height));
end;

function SIE(mode:Byte):Boolean;
begin
  case mode
  of
    0:SIE:=SIE(1) and SIE(2);
    1:SIE:=(Length(Mas1)=0);
    2:SIE:=(Length(Mas2)=0);
  else
    SIE:=False;
  end;
end;

procedure Push(mode:Word; x,y:Integer);
begin
  case mode
  of
    1:begin
        SetLength(Mas1,Length(Mas1)+1);
        Mas1[Length(Mas1)-1].x:=x;
        Mas1[Length(Mas1)-1].y:=y;
      end;
    2:begin
        SetLength(Mas2, Length(Mas2)+1);
        Mas2[Length(Mas2)-1].x:=x;
        Mas2[Length(Mas2)-1].y:=y;
      end;
  end;
end;

procedure Pop(mode:Word; var x,y:Integer);
begin
  if SIE(mode)
  then
    exit;
  case mode
  of
    1:begin
        x:=Mas1[Length(Mas1)-1].x;
        y:=Mas1[Length(Mas1)-1].y;
        SetLength(Mas1, Length(Mas1)-1);
      end;
    2:begin
        x:=Mas2[Length(Mas2)-1].x;
        y:=Mas2[Length(Mas2)-1].y;
        SetLength(Mas2, Length(Mas2)-1);
      end;
  end;
end;

procedure Fill(mode,x,y:Integer);
begin
  if not CPxl(x+1,y)
  then
    begin
      Push(mode,x+1,y);
      Img.Canvas.Pixels[x+1,y]:=clr;
    end;
  if not CPxl(x,y+1)
  then
    begin
      Push(mode,x,y+1);
      Img.Canvas.Pixels[x,y+1]:=clr;
    end;
  if not CPxl(x-1,y)
  then
    begin
      Push(mode,x-1,y);
      Img.Canvas.Pixels[x-1,y]:=clr;
    end;
  if not CPxl(x,y-1)
  then
    begin
      Push(mode,x,y-1);
      Img.Canvas.Pixels[x,y-1]:=clr;
    end;
end;

begin
  pclr:=Img.Canvas.Pixels[x,y];
  clr:=Img.Canvas.Pen.Color;
  SetLength(Mas1,0);
  SetLength(Mas2,0);
  if not CPxl(x,y)
  then
    Push(1,x,y);
  while not SIE(0)
  do
    begin
      while not SIE(1)
      do
        begin
          Pop(1,x,y);
          Fill(2,x,y);
        end;
      while not SIE(2)
      do
        begin
          Pop(2,x,y);
          Fill(1,x,y);
        end;
      Application.ProcessMessages;
    end;
end;

procedure TForm1.Fill_Line(x,y:Integer; Img:TImage);
var
  clr,x_min,x_max,temp:Integer;

function CPxl(x,y:Integer):Boolean;
begin
  CPxl:=(Img.Canvas.Pixels[x,y]=clr) and ((x>=0) or (x<Img.Width) or (y>=0) or (y<Img.Height));
end;

begin
  clr:=Img.Canvas.Pen.Color;
  if not CPxl(x,y)
  then
    begin
      x_min:=x;
      while (not CPxl(x_min,y) and (x_min>0))
      do
        Dec(x_min);
      x_max:=x;
      while (not CPxl(x_max,y) and (x_max<Img.Width-1))
      do
        Inc(x_max);
      Line_B(x_min,y,x_max,y,Img);
      Application.ProcessMessages;
      temp:=x_min+1;
      while temp<x_max
      do
        begin
          Fill_Line(temp,y-1,Img);
          Inc(temp);
        end;
      temp:=x_min+1;
      while temp<x_max
      do
        begin
          Fill_Line(temp,y+1,Img);
          Inc(temp);
        end;
   end;
end;

procedure TForm1.ImgClr(Img:TImage);
var
  tbs:TBrushStyle;
begin
  tbs:=Img.Canvas.Brush.Style;
  Img.Canvas.Brush.Style:=bsSolid;
  Img.Canvas.FillRect(Img.Canvas.ClipRect);
  Img.Canvas.Brush.Style:=tbs;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  ImgClr(Image1);
  Randomize;
  Can:=TBitmap.Create;
  OPic:=TBitmap.Create;
  IPic:=TBitmap.Create;
  Image1.Canvas.Brush.Style:=bsClear;
  Image2.Canvas.Brush.Style:=bsClear;

  I_R.Canvas.Brush.Style:=bsClear;
  I_R.Canvas.Brush.Color:=clBlack;
  I_R.Canvas.FillRect(I_R.Canvas.ClipRect);
  I_G.Canvas.Brush.Style:=bsClear;
  I_G.Canvas.Brush.Color:=clBlack;
  I_G.Canvas.FillRect(I_G.Canvas.ClipRect);
  I_B.Canvas.Brush.Style:=bsClear;
  I_B.Canvas.Brush.Color:=clBlack;
  I_B.Canvas.FillRect(I_B.Canvas.ClipRect);
  Panel1.Color:=Image1.Canvas.Pen.Color;
  SE_mzChange(nil);
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  i:Integer;
begin
  case PC_Labs.ActivePageIndex
  of
    9:begin
        for i:=1 to mzn
        do
          if Sqrt(Sqr(x-XY[i,1])+Sqr(y-XY[i,2]))<=15
          then
            begin
              num:=i;
              Break;
            end;
      end;
  else
    begin
      Can.Assign(Image1.Picture.Bitmap);
      x1:=x;
      y1:=y;
      Ms:=True;
    end;
  end;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  nx1,ny1,nx2,ny2,b:Integer;
  Sn,An:Byte;
  Rev:Boolean;
begin
  case PC_Labs.ActivePageIndex
  of
    9:begin
        if num=0
        then
          Abort;
        SG_XY.Cells[1,num]:=IntToStr(x);
        SG_XY.Cells[2,num]:=IntToStr(y);
        Redraw;
      end;
  else
    begin
    if (Ms) and (not BFill)
    then
      begin
        Image1.Picture.Bitmap.Assign(Can);
        x2:=x;
        y2:=y;
        case PC_Labs.ActivePageIndex
        of
        0:if RadioGroup1.ItemIndex=0
          then
            Line_B(x1,y1,x2,y2,Image1)
          else
            Line_DDA(x1,y1,x2,y2,Image1);
        1:if RadioGroup2.ItemIndex=0
          then
            Circle_B(x1,y1,Round(Sqrt(Sqr(x2-x1)+Sqr(y2-y1))),Image1)
          else
            Ellipse_B(x1,y1,Abs(x2-x1),Abs(y2-y1),Image1);
        2:begin
            BFill:=True;
            case RadioGroup3.ItemIndex
            of
              0:Fill_Prim(x1,y1,Image1);
              1:Fill_Line(x1,y1,Image1);
              2:Form2.Show;
            end;
            BFill:=False;
          end;
        4:begin
            if (not Win.b) and (SB_Win.Down)
            then
              begin
                Line_B(x1,y1,x1,y2,Image1);
                Line_B(x2,y1,x2,y2,Image1);
                Line_B(x1,y1,x2,y1,Image1);
                Line_B(x1,y2,x2,y2,Image1);
              end;
            if (Win.b) and (SB_Lin.Down)
            then
              begin
                case CodeChk(x1,y1,x,y)
                of
                  1:begin
                      Image1.Canvas.Pen.Color:=clLime;
                      Line_B(x1,y1,x2,y2,Image1);
                    end;
                  2:begin
                      Image1.Canvas.Pen.Color:=clBlue;
                      Line_B(x1,y1,x2,y2,Image1);
                    end;
                  3:begin
                      GetABC(x1,y1,x,y,A,B,C);
                      GetCrossXY(A,B,C,Au,Bu,Cu,xu,yu);
                      GetCrossXY(A,B,C,Ad,Bd,Cd,xd,yd);
                      GetCrossXY(A,B,C,Ar,Br,Cr,xr,yr);
                      GetCrossXY(A,B,C,Al,Bl,Cl,xl,yl);
                      An:=GetAreaNum(x,y);
                      if An=5
                      then
                        begin
                          Sn:=5;
                          Rev:=True;
                          An:=GetAreaNum(x1,y1);
                        end
                      else
                        begin
                          Sn:=GetAreaNum(x1,y1);
                          Rev:=False;
                        end;
                      if (Sn<>5) and (An<>5)
                      then
                        begin
                          nx1:=0;
                          ny1:=0;
                          nx2:=0;
                          ny2:=0;
                          if (xu>=Win.x1) and (xu<=Win.x2) and (yu=Win.y1)
                          then
                            if nx1=0
                            then
                              begin
                                nx1:=xu;
                                ny1:=yu;
                              end
                            else
                              begin
                                nx2:=xu;
                                ny2:=yu;
                              end;
                          if (xd>=Win.x1) and (xd<=Win.x2) and (yd=Win.y2)
                          then
                            if nx1=0
                            then
                              begin
                                nx1:=xd;
                                ny1:=yd;
                              end
                            else
                              begin
                                nx2:=xd;
                                ny2:=yd;
                              end;
                          if (yr>=Win.y1) and (yr<=Win.y2) and (xr=Win.x2)
                          then
                            if nx1=0
                            then
                              begin
                                nx1:=xr;
                                ny1:=yr;
                              end
                            else
                              begin
                                nx2:=xr;
                                ny2:=yr;
                              end;
                          if (yl>=Win.y1) and (yl<=Win.y2) and (xl=Win.x1)
                          then
                            if nx1=0
                            then
                              begin
                                nx1:=xl;
                                ny1:=yl;
                              end
                            else
                              begin
                                nx2:=xl;
                                ny2:=yl;
                              end;
                          Image1.Canvas.Pen.Color:=clLime;
                          Line_B(nx1,ny1,nx2,ny2,Image1);
                        end
                      else
                        begin
                          if Rev
                          then
                            begin
                              nx1:=x;
                              ny1:=y;
                            end
                          else
                            begin
                              nx1:=x1;
                              ny1:=y1;
                            end;
                          nx2:=0;
                          ny2:=0;
                          if (xu>=Win.x1) and (xu<=Win.x2) and (yu=Win.y1) and (An in [1,2,3])
                          then
                            begin
                              nx2:=xu;
                              ny2:=yu;
                            end;
                          if (xd>=Win.x1) and (xd<=Win.x2) and (yd=Win.y2) and (An in [7,8,9])
                          then
                            begin
                              nx2:=xd;
                              ny2:=yd;
                            end;
                          if (yr>=Win.y1) and (yr<=Win.y2) and (xr=Win.x2) and (An in [3,6,9])
                          then
                            begin
                              nx2:=xr;
                              ny2:=yr;
                            end;
                          if (yl>=Win.y1) and (yl<=Win.y2) and (xl=Win.x1) and (An in [1,4,7])
                          then
                            begin
                              nx2:=xl;
                              ny2:=yl;
                            end;
                          Image1.Canvas.Pen.Color:=clLime;
                          Line_B(nx1,ny1,nx2,ny2,Image1);
                        end;
                    end;
                end;
              end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case PC_Labs.ActivePageIndex
  of
    9:begin
        if num=0
        then
          Abort;
        SG_XY.Cells[1,num]:=IntToStr(x);
        SG_XY.Cells[2,num]:=IntToStr(y);
        Redraw;
        num:=0;
      end;
    4:begin
        if (SB_Win.Down) and (not Win.b)
        then
          begin
            Win.b:=True;
            Win.x1:=x1;
            Win.y1:=y1;
            Win.x2:=x2;
            Win.y2:=y2;
            GetABC(Win.x1,Win.y1,Win.x2,Win.y1,Au,Bu,Cu);
            GetABC(Win.x1,Win.y2,Win.x2,Win.y2,Ad,Bd,Cd);
            GetABC(Win.x2,Win.y1,Win.x2,Win.y2,Ar,Br,Cr);
            GetABC(Win.x1,Win.y1,Win.x1,Win.y2,Al,Bl,Cl);
            SG_Win.Cells[0,0]:=IntToStr(Win.x1);
            SG_Win.Cells[1,0]:=IntToStr(Win.y1);
            SG_Win.Cells[0,1]:=IntToStr(Win.x2);
            SG_Win.Cells[1,1]:=IntToStr(Win.y2);
          end
        else
          begin
          end;
      end;
  end;
  Ms:=False;
end;

procedure TForm1.B_ClrClick(Sender: TObject);
begin
  ImgClr(Image1);
  Win.b:=False;
end;

procedure TForm1.Panel1Click(Sender: TObject);
begin
  if ColorDialog1.Execute
  then
    begin
      Image1.Canvas.Pen.Color:=ColorDialog1.Color;
      Panel1.Color:=ColorDialog1.Color;
    end;
end;

procedure TForm1.RadioGroup3Click(Sender: TObject);
begin
  if (RadioGroup3.ItemIndex=2) and (PC_Labs.ActivePageIndex=2)
  then
    Form2.Show
  else
    Form2.Close;
end;

procedure TForm1.B_OpnClick(Sender: TObject);
begin
  if OpenPictureDialog1.Execute
  then
    begin
      Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
      OPic.Assign(Image1.Picture.Bitmap);
    end;
end;

procedure TForm1.B_RdrwClick(Sender: TObject);
begin
  case PC_Labs.ActivePageIndex
  of
    9:
      Redraw;
  else
    begin
      Image1.Picture.Bitmap.Assign(OPic);
      PB_M.Position:=0;
    end;
  end;
end;

function GetN(x,y:Integer; img:TBitmap):TMyMat;
var
  t:TMyMat;
begin
  if (x>0) and (x<425) and (y>0) and (y<425)
  then
    begin
      t[1,1]:=img.Canvas.Pixels[x-1,y-1];
      t[2,1]:=img.Canvas.Pixels[x,y-1];
      t[3,1]:=img.Canvas.Pixels[x+1,y-1];
      t[1,2]:=img.Canvas.Pixels[x-1,y];
      t[2,2]:=img.Canvas.Pixels[x,y];
      t[3,2]:=img.Canvas.Pixels[x+1,y];
      t[1,3]:=img.Canvas.Pixels[x-1,y+1];
      t[2,3]:=img.Canvas.Pixels[x,y+1];
      t[3,3]:=img.Canvas.Pixels[x+1,y+1];
    end
  else
    if (x=0) and (y=0)
    then
      begin
        t[1,1]:=img.Canvas.Pixels[x+1,y+1];
        t[2,1]:=img.Canvas.Pixels[x+1,y];
        t[3,1]:=img.Canvas.Pixels[x+1,y+1];
        t[1,2]:=img.Canvas.Pixels[x,y+1];
        t[2,2]:=img.Canvas.Pixels[x,y];
        t[3,2]:=img.Canvas.Pixels[x+1,y];
        t[1,3]:=img.Canvas.Pixels[x+1,y+1];
        t[2,3]:=img.Canvas.Pixels[x,y+1];
        t[3,3]:=img.Canvas.Pixels[x+1,y+1];
      end
    else
      if (x=425) and (y=0)
      then
        begin
          t[1,1]:=img.Canvas.Pixels[x-1,y+1];
          t[2,1]:=img.Canvas.Pixels[x-1,y];
          t[3,1]:=img.Canvas.Pixels[x-1,y+1];
          t[1,2]:=img.Canvas.Pixels[x,y+1];
          t[2,2]:=img.Canvas.Pixels[x,y];
          t[3,2]:=img.Canvas.Pixels[x,y+1];
          t[1,3]:=img.Canvas.Pixels[x+1,y+1];
          t[2,3]:=img.Canvas.Pixels[x,y+1];
          t[3,3]:=img.Canvas.Pixels[x-1,y+1];
        end
      else
        if (x=425) and (y=425)
        then
          begin
            t[1,1]:=img.Canvas.Pixels[x-1,y+1];
            t[2,1]:=img.Canvas.Pixels[x-1,y];
            t[3,1]:=img.Canvas.Pixels[x+1,y-1];
            t[1,2]:=img.Canvas.Pixels[x,y+1];
            t[2,2]:=img.Canvas.Pixels[x,y];
            t[3,2]:=img.Canvas.Pixels[x,y-1];
            t[1,3]:=img.Canvas.Pixels[x-1,y-1];
            t[2,3]:=img.Canvas.Pixels[x-1,y];
            t[3,3]:=img.Canvas.Pixels[x-1,y-1];
          end
        else
          if (x=0) and (y=425)
          then
            begin
              t[1,1]:=img.Canvas.Pixels[x+1,y-1];
              t[2,1]:=img.Canvas.Pixels[x-1,y];
              t[3,1]:=img.Canvas.Pixels[x+1,y-1];
              t[1,2]:=img.Canvas.Pixels[x,y-1];
              t[2,2]:=img.Canvas.Pixels[x,y];
              t[3,2]:=img.Canvas.Pixels[x,y-1];
              t[1,3]:=img.Canvas.Pixels[x+1,y-1];
              t[2,3]:=img.Canvas.Pixels[x+1,y];
              t[3,3]:=img.Canvas.Pixels[x+1,y-1];
            end
          else
            if x=0
            then
              begin
                t[1,1]:=img.Canvas.Pixels[x+1,y-1];
                t[2,1]:=img.Canvas.Pixels[x,y-1];
                t[3,1]:=img.Canvas.Pixels[x+1,y-1];
                t[1,2]:=img.Canvas.Pixels[x+1,y];
                t[2,2]:=img.Canvas.Pixels[x,y];
                t[3,2]:=img.Canvas.Pixels[x+1,y];
                t[1,3]:=img.Canvas.Pixels[x+1,y+1];
                t[2,3]:=img.Canvas.Pixels[x,y+1];
                t[3,3]:=img.Canvas.Pixels[x+1,y+1];
              end
            else
              if y=0
              then
                begin
                  t[1,1]:=img.Canvas.Pixels[x-1,y+1];
                  t[2,1]:=img.Canvas.Pixels[x,y+1];
                  t[3,1]:=img.Canvas.Pixels[x+1,y+1];
                  t[1,2]:=img.Canvas.Pixels[x-1,y];
                  t[2,2]:=img.Canvas.Pixels[x,y];
                  t[3,2]:=img.Canvas.Pixels[x+1,y];
                  t[1,3]:=img.Canvas.Pixels[x-1,y+1];
                  t[2,3]:=img.Canvas.Pixels[x,y+1];
                  t[3,3]:=img.Canvas.Pixels[x+1,y+1];
                end
              else
                if x=425
                then
                  begin
                    t[1,1]:=img.Canvas.Pixels[x-1,y-1];
                    t[2,1]:=img.Canvas.Pixels[x,y-1];
                    t[3,1]:=img.Canvas.Pixels[x-1,y-1];
                    t[1,2]:=img.Canvas.Pixels[x-1,y];
                    t[2,2]:=img.Canvas.Pixels[x,y];
                    t[3,2]:=img.Canvas.Pixels[x-1,y];
                    t[1,3]:=img.Canvas.Pixels[x-1,y+1];
                    t[2,3]:=img.Canvas.Pixels[x,y+1];
                    t[3,3]:=img.Canvas.Pixels[x-1,y+1];
                  end
                else
                  if y=425
                  then
                    begin
                      t[1,1]:=img.Canvas.Pixels[x-1,y-1];
                      t[2,1]:=img.Canvas.Pixels[x,y-1];
                      t[3,1]:=img.Canvas.Pixels[x+1,y-1];
                      t[1,2]:=img.Canvas.Pixels[x-1,y];
                      t[2,2]:=img.Canvas.Pixels[x,y];
                      t[3,2]:=img.Canvas.Pixels[x+1,y];
                      t[1,3]:=img.Canvas.Pixels[x-1,y-1];
                      t[2,3]:=img.Canvas.Pixels[x,y-1];
                      t[3,3]:=img.Canvas.Pixels[x+1,y-1];
                    end;
  GetN:=t;
end;

procedure TForm1.B_FClick(Sender: TObject);

function PixelCalc(x,y:Integer; img:TBitmap):Integer;
var
  N:TMyMat;
  i,j:Integer;
  Pr,Pg,Pb:Integer;
begin
  N:=GetN(x,y,OPic);
  Pr:=0;
  Pg:=0;
  Pb:=0;
  for i:=1 to 3
  do
    for j:=1 to 3
    do
      begin
        Pr:=Pr+Round(GetRValue(N[j,i])*f[j,i]);
        Pg:=Pg+Round(GetGValue(N[j,i])*f[j,i]);
        Pb:=Pb+Round(GetBValue(N[j,i])*f[j,i]);
      end;
  if Pr>255
  then
    Pr:=255
  else
    if Pr<0
    then
      Pr:=0;
  if Pg>255
  then
    Pg:=255
  else
    if Pg<0
    then
      Pg:=0;
  if Pb>255
  then
    Pb:=255
  else
    if Pb<0
    then
      Pb:=0;
  PixelCalc:=RGB(Pr,Pg,Pb);
end;

var
  x,y,i,j:Integer;
  clr:Cardinal;
begin
  OPic.Assign(Image1.Picture.Bitmap);
  for i:=1 to 3
  do
    for j:=1 to 3
    do
      f[j,i]:=StrToFloat(E_Fctr.Text)*StrToFloat(SG_f.Cells[j-1,i-1]);
  for x:=0 to 425
  do
    begin
      for y:=0 to 425
      do
        begin
          clr:=PixelCalc(x,y,OPic);
          Image1.Canvas.Pixels[x,y]:=clr;
        end;
      Application.ProcessMessages;
    end;
end;

procedure TForm1.RadioGroup4Click(Sender: TObject);
begin
  case RadioGroup4.ItemIndex
  of
    0:begin
        SG_f.Cells[0,0]:='0,1';
        SG_f.Cells[1,0]:='0,1';
        SG_f.Cells[2,0]:='0,1';
        SG_f.Cells[0,1]:='0,1';
        SG_f.Cells[1,1]:='0,2';
        SG_f.Cells[2,1]:='0,1';
        SG_f.Cells[0,2]:='0,1';
        SG_f.Cells[1,2]:='0,1';
        SG_f.Cells[2,2]:='0,1';
      end;
    1:begin
        SG_f.Cells[0,0]:='-1';
        SG_f.Cells[1,0]:='-1';
        SG_f.Cells[2,0]:='-1';
        SG_f.Cells[0,1]:='-1';
        SG_f.Cells[1,1]:='8';
        SG_f.Cells[2,1]:='-1';
        SG_f.Cells[0,2]:='-1';
        SG_f.Cells[1,2]:='-1';
        SG_f.Cells[2,2]:='-1';
      end;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if OpenPictureDialog1.Execute
  then
    begin
      Image2.Picture.LoadFromFile(OpenPictureDialog1.FileName);
      IPic.Assign(Image2.Picture.Bitmap);
    end;
end;

procedure TForm1.PC_LabsChange(Sender: TObject);
begin
  PC_Labs.Height:=225;
  case PC_Labs.ActivePageIndex
  of
    3:
      begin
        PC_Labs.Height:=305;
        Width:=740;
        RedrawD(RadioGroup5.ItemIndex);
      end;
    7:
      begin
        Image2.Visible:=False;
        I_R.Visible:=True;
        I_G.Visible:=True;
        I_B.Visible:=True;
        Width:=1005;
      end;
    8:
      begin
        I_R.Visible:=False;
        I_G.Visible:=False;
        I_B.Visible:=False;
        ImgClr(Image2);
        Image2.Visible:=True;
        Width:=1175;
      end;
    9:
      begin
        I_R.Visible:=False;
        I_G.Visible:=False;
        I_B.Visible:=False;
        ImgClr(Image1);
        ImgClr(Image2);
        Image2.Visible:=True;
        Width:=1175;
        PC_Labs.Height:=305;
      end;
  else
    begin
      Width:=740;
    end;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  x,y:Integer;
  c:Real;
  R,G,B:Byte;
begin
  c:=StrToFloat(E_c.Text);
  for x:=0 to 425
  do
    begin
      for y:=0 to 425
      do
        begin
          R:=Round(c*GetRValue(OPic.Canvas.Pixels[x,y])+(1-c)*GetRValue(IPic.Canvas.Pixels[x,y]));
          G:=Round(c*GetGValue(OPic.Canvas.Pixels[x,y])+(1-c)*GetGValue(IPic.Canvas.Pixels[x,y]));
          B:=Round(c*GetBValue(OPic.Canvas.Pixels[x,y])+(1-c)*GetBValue(IPic.Canvas.Pixels[x,y]));
          Image1.Canvas.Pixels[x,y]:=RGB(R,G,B);
        end;
      Application.ProcessMessages
    end;
end;

procedure TForm1.B_HCalcClick(Sender: TObject);
var
  i,x,y,mR,mG,mB:Integer;
  R,G,B:array[0..255] of Integer;

procedure RedrowH;
var
  i:Integer;
begin
  for i:=0 to 255
  do
    begin
      if mR<R[i]
      then
        mR:=R[i];
      if mG<G[i]
      then
        mG:=G[i];
      if mB<B[i]
      then
        mB:=B[i];
    end;
  for i:=0 to 255
  do
    begin
      I_R.Canvas.MoveTo(i+2,103);
      I_R.Canvas.Pen.Color:=clRed;
      I_R.Canvas.LineTo(i+2,103-Round(R[i]/mR*100));
      I_G.Canvas.MoveTo(i+2,103);
      I_G.Canvas.Pen.Color:=clLime;
      I_G.Canvas.LineTo(i+2,103-Round(G[i]/mG*100));
      I_B.Canvas.MoveTo(i+2,103);
      I_B.Canvas.Pen.Color:=clBlue;
      I_B.Canvas.LineTo(i+2,103-Round(B[i]/mB*100));
      Application.ProcessMessages;
    end;
end;

begin
  I_R.Canvas.Brush.Style:=bsSolid;
  I_R.Canvas.Brush.Color:=clBlack;
  I_R.Canvas.FillRect(I_R.Canvas.ClipRect);
  I_G.Canvas.Brush.Style:=bsSolid;
  I_G.Canvas.Brush.Color:=clBlack;
  I_G.Canvas.FillRect(I_G.Canvas.ClipRect);
  I_B.Canvas.Brush.Style:=bsSolid;
  I_B.Canvas.Brush.Color:=clBlack;
  I_B.Canvas.FillRect(I_B.Canvas.ClipRect);
  Application.ProcessMessages;
  mR:=0;
  mG:=0;
  mB:=0;
  for i:=0 to 255
  do
    begin
      R[i]:=0;
      G[i]:=0;
      B[i]:=0;
    end;
  for x:=0 to 425
  do
    for y:=0 to 425
    do
      begin
        Inc(R[GetRValue(Image1.Canvas.Pixels[x,y])]);
        Inc(G[GetGValue(Image1.Canvas.Pixels[x,y])]);
        Inc(B[GetBValue(Image1.Canvas.Pixels[x,y])]);
        ProgressBar1.Position:=x;
      end;
  RedrowH;
end;

procedure TForm1.B_BWClick(Sender: TObject);
var
  x,y:Integer;
  c:Byte;
begin
  for x:=0 to 425
  do
    begin
      for y:=0 to 425
      do
        begin
          c:=Round((GetRValue(Image1.Canvas.Pixels[x,y])+GetGValue(Image1.Canvas.Pixels[x,y])+GetBValue(Image1.Canvas.Pixels[x,y]))/3);
          Image1.Canvas.Pixels[x,y]:=RGB(c,c,c);
        end;
      Application.ProcessMessages;
    end;
end;

procedure TForm1.B_SavClick(Sender: TObject);
begin
  if SavePictureDialog1.Execute
  then
    Image1.Picture.SaveToFile(SavePictureDialog1.FileName);
end;

procedure TForm1.TBChange(Sender: TObject);
begin
  if not ms
  then
    begin
      ms:=True;
      if (Sender=TB_B) and (TB_B.Position<=TB_W.Position)
      then
        TB_W.Position:=TB_B.Position-1;
      if (Sender=TB_W) and (TB_B.Position<=TB_W.Position)
      then
        TB_B.Position:=TB_W.Position+1;
      ms:=False;
    end;
end;

procedure TForm1.B_ExpComClick(Sender: TObject);
var
  k:Real;
  x,y,tR,tG,tB:Integer;
begin
  k:=256/(TB_B.Position-TB_W.Position);
  if Sender=B_Exp
  then
    for x:=0 to 425
    do
      begin
        for y:=0 to 425
        do
          begin
            tR:=Round(GetRValue(Image1.Canvas.Pixels[x,y])*k-256+TB_B.Position-TB_W.Position);
            tG:=Round(GetGValue(Image1.Canvas.Pixels[x,y])*k-256+TB_B.Position-TB_W.Position);
            tB:=Round(GetBValue(Image1.Canvas.Pixels[x,y])*k-256+TB_B.Position-TB_W.Position);
          if tR>255
          then
            tR:=255
          else
            if tR<0
            then
              tR:=0;
          if tG>255
          then
            tG:=255
          else
            if tG<0
            then
              tG:=0;
          if tB>255
          then
            tB:=255
          else
            if tB<0
            then
              tB:=0;
            Image1.Canvas.Pixels[x,y]:=RGB(tR,tG,tB);
          end;
        Application.ProcessMessages;
      end;
  if Sender=B_Com
  then
    for x:=0 to 425
    do
      begin
        for y:=0 to 425
        do
          begin
            tR:=Round(GetRValue(Image1.Canvas.Pixels[x,y])/k+TB_W.Position);
            tG:=Round(GetGValue(Image1.Canvas.Pixels[x,y])/k+TB_W.Position);
            tB:=Round(GetBValue(Image1.Canvas.Pixels[x,y])/k+TB_W.Position);
            Image1.Canvas.Pixels[x,y]:=RGB(tR,tG,tB);
          end;
        Application.ProcessMessages;
      end;
  B_HCalc.Click;
end;

procedure TForm1.Button3Click(Sender: TObject);

function Median(tN:TMyMat):Cardinal;
var
  i,j,bb:Byte;
  r,g,b:array[1..9] of Byte;
begin
  for i:=1 to 3
  do
    for j:=1 to 3
    do
      begin
        r[i*j]:=GetRValue(tN[j,i]);
        g[i*j]:=GetGValue(tN[j,i]);
        b[i*j]:=GetBValue(tN[j,i]);
      end;
  for i:=1 to 8
  do
    for j:=i+1 to 9
    do
      begin
        if r[i]>r[j]
        then
          begin
            bb:=r[j];
            r[j]:=r[i];
            r[i]:=bb;
          end;
        if g[i]>g[j]
        then
          begin
            bb:=g[j];
            g[j]:=g[i];
            g[i]:=bb;
          end;
        if b[i]>b[j]
        then
          begin
            bb:=b[j];
            b[j]:=b[i];
            b[i]:=bb;
          end;
      end;
  Median:=RGB(r[5],g[5],b[5]);
end;

var
  x,y:Integer;
begin
  for x:=0 to 425
  do
    begin
      for y:=0 to 425
      do
        Image1.Canvas.Pixels[x,y]:=Median(GetN(x,y,OPic));
      PB_M.Position:=x;
      Application.ProcessMessages;
    end;
end;

procedure TForm1.SE_mzChange(Sender: TObject);
var
  i,j:Integer;
begin
  SG_mz.ColCount:=SE_mz.Value+1;
  SG_mz.RowCount:=SE_mz.Value+1;
  SG_XY.RowCount:=SE_mz.Value+1;
  SG_XY.Cells[1,0]:='X';
  SG_XY.Cells[2,0]:='Y';
  SG_XY2.RowCount:=SE_mz.Value+1;
  SG_XY2.Cells[1,0]:='X';
  SG_XY2.Cells[2,0]:='Y';
  mzn:=SE_mz.Value;
  for i:=1 to mzn
  do
    begin
      SG_mz.Cells[0,i]:=IntToStr(i);
      SG_mz.Cells[i,0]:=IntToStr(i);
      SG_XY.Cells[0,i]:=IntToStr(i);
      SG_XY2.Cells[0,i]:=IntToStr(i);
      for j:=1 to mzn
      do
        begin
          SG_XY.Cells[1,i]:=IntToStr(Random(425-40)+20);
          SG_XY.Cells[2,i]:=IntToStr(Random(425-40)+20);
          SG_XY2.Cells[1,i]:='0';
          SG_XY2.Cells[2,i]:='0';
          SG_mz.Cells[j,i]:='0';
        end;
    end;
end;

procedure TForm1.SG_mzMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  xc,xr:Integer;
begin
  SG_mz.MouseToCell(x,y,xc,xr);
  if (xc>0) and (xr>0) and (xr<>xc)
  then
    begin
      SG_mz.Cells[xc,xr]:=IntToStr(1-StrToInt(SG_mz.Cells[xc,xr]));
      SG_mz.Cells[xr,xc]:=IntToStr(1-StrToInt(SG_mz.Cells[xr,xc]));
    end;
end;

procedure TForm1.B_DupClick(Sender: TObject);
var
  i:Integer;
begin
  for i:=1 to mzn
  do
    begin
      SG_XY2.Cells[1,i]:=SG_XY.Cells[1,i];
      SG_XY2.Cells[2,i]:=SG_XY.Cells[2,i];
    end;
end;

procedure TForm1.Image2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  i:Integer;
begin
  case PC_Labs.ActivePageIndex
  of
    9:begin
        for i:=1 to mzn
        do
          if Sqrt(Sqr(x-XY2[i,1])+Sqr(y-XY2[i,2]))<=15
          then
            begin
              num:=i;
              Break;
            end;
      end;
  end;
end;

procedure TForm1.Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  case PC_Labs.ActivePageIndex
  of
    9:begin
        if num=0
        then
          Abort;
        SG_XY2.Cells[1,num]:=IntToStr(x);
        SG_XY2.Cells[2,num]:=IntToStr(y);
        Redraw;
      end;
  end;
end;

procedure TForm1.Image2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case PC_Labs.ActivePageIndex
  of
    9:begin
        if num=0
        then
          Abort;
        SG_XY2.Cells[1,num]:=IntToStr(x);
        SG_XY2.Cells[2,num]:=IntToStr(y);
        Redraw;
        num:=0;
      end;
  end;
end;

procedure TForm1.B_AnimeClick(Sender: TObject);
var
  i:Integer;
begin
  for i:=1 to mzn
  do
    begin
      dXY[i,1]:=(XY2[i,1]-XY[i,1])/SE_Fs.Value;
      dXY[i,2]:=(XY2[i,2]-XY[i,2])/SE_Fs.Value;
    end;
  T_Anime.Tag:=SE_Fs.Value;
  T_Anime.Enabled:=True;
end;

procedure TForm1.T_AnimeTimer(Sender: TObject);
var
  i:Integer;
begin
  if T_Anime.Tag=0
  then
    T_Anime.Enabled:=False;
  T_Anime.Tag:=T_Anime.Tag-1;
  for i:=1 to mzn
  do
    begin
      SG_XY.Cells[1,i]:=IntToStr(Round(StrToInt(SG_XY2.Cells[1,i])-dXY[i,1]*T_Anime.Tag));
      SG_XY.Cells[2,i]:=IntToStr(Round(StrToInt(SG_XY2.Cells[2,i])-dXY[i,2]*T_Anime.Tag));
      Redraw;
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i,j:Integer;
  bs,ss:Integer;
begin
  {> Affine}
  bs:=100;
  ss:=50;
  XYD[1,1]:=-bs; XYD[2,1]:=-bs; XYD[3,1]:=1;
  XYD[1,2]:=+bs; XYD[2,2]:=-bs; XYD[3,2]:=1;
  XYD[1,3]:=+bs; XYD[2,3]:=+bs; XYD[3,3]:=1;
  XYD[1,4]:=-bs; XYD[2,4]:=+bs; XYD[3,4]:=1;

  XYZD[1,1]:=-bs; XYZD[2,1]:=-bs; XYZD[3,1]:=+bs; XYZD[4,1]:=1;
  XYZD[1,2]:=-bs; XYZD[2,2]:=-bs; XYZD[3,2]:=-bs; XYZD[4,2]:=1;
  XYZD[1,3]:=+bs; XYZD[2,3]:=-bs; XYZD[3,3]:=-bs; XYZD[4,3]:=1;
  XYZD[1,4]:=+bs; XYZD[2,4]:=-bs; XYZD[3,4]:=+bs; XYZD[4,4]:=1;
  XYZD[1,5]:=-bs; XYZD[2,5]:=+bs; XYZD[3,5]:=+bs; XYZD[4,5]:=1;
  XYZD[1,6]:=-bs; XYZD[2,6]:=+bs; XYZD[3,6]:=-bs; XYZD[4,6]:=1;
  XYZD[1,7]:=+bs; XYZD[2,7]:=+bs; XYZD[3,7]:=-bs; XYZD[4,7]:=1;
  XYZD[1,8]:=+bs; XYZD[2,8]:=+bs; XYZD[3,8]:=+bs; XYZD[4,8]:=1;

  XYZD[1, 9]:=-ss; XYZD[2, 9]:=-ss; XYZD[3, 9]:=+ss; XYZD[4, 9]:=1;
  XYZD[1,10]:=-ss; XYZD[2,10]:=-ss; XYZD[3,10]:=-ss; XYZD[4,10]:=1;
  XYZD[1,11]:=+ss; XYZD[2,11]:=-ss; XYZD[3,11]:=-ss; XYZD[4,11]:=1;
  XYZD[1,12]:=+ss; XYZD[2,12]:=-ss; XYZD[3,12]:=+ss; XYZD[4,12]:=1;
  XYZD[1,13]:=-ss; XYZD[2,13]:=+ss; XYZD[3,13]:=+ss; XYZD[4,13]:=1;
  XYZD[1,14]:=-ss; XYZD[2,14]:=+ss; XYZD[3,14]:=-ss; XYZD[4,14]:=1;
  XYZD[1,15]:=+ss; XYZD[2,15]:=+ss; XYZD[3,15]:=-ss; XYZD[4,15]:=1;
  XYZD[1,16]:=+ss; XYZD[2,16]:=+ss; XYZD[3,16]:=+ss; XYZD[4,16]:=1;

  dfi:=0;
  dpsi:=0;
  dksi:=0;
  for i:=1 to 4
  do
    for j:=1 to 4
    do
      begin
        Rx[i,j]:=0;
        Ry[i,j]:=0;
        Rz[i,j]:=0;
      end;
  {Affine <}
end;

procedure TForm1.B_StartClick(Sender: TObject);
begin
  T_Aff.Enabled:=True;
end;

procedure TForm1.B_StopClick(Sender: TObject);
begin
  T_Aff.Enabled:=False;
end;

procedure TForm1.RedrawD(d:Byte);
var
  i:Integer;
  cc,ss:Real;
begin
  cc:=Cos(Pi*60/180)/2;
  ss:=Cos(Pi*60/180)/2;
  case d
  of
    2:
      begin
        Line_B(Round(nXYD[1,1])+212,-Round(nXYD[2,1])+212,Round(nXYD[1,2])+212,-Round(nXYD[2,2])+212,Image1);
        Line_B(Round(nXYD[1,3])+212,-Round(nXYD[2,3])+212,Round(nXYD[1,2])+212,-Round(nXYD[2,2])+212,Image1);
        Line_B(Round(nXYD[1,3])+212,-Round(nXYD[2,3])+212,Round(nXYD[1,4])+212,-Round(nXYD[2,4])+212,Image1);
        Line_B(Round(nXYD[1,1])+212,-Round(nXYD[2,1])+212,Round(nXYD[1,4])+212,-Round(nXYD[2,4])+212,Image1);
      end;
    3:
      begin
        Image1.Canvas.Pen.Color:=clBlue;
        Image1.Canvas.MoveTo(Round(nXYZD[1,1]-nXYZD[3,1]*cc)+212,-Round(nXYZD[2,1]-nXYZD[3,1]*ss)+212);
        Image1.Canvas.LineTo(Round(nXYZD[1,2]-nXYZD[3,2]*cc)+212,-Round(nXYZD[2,2]-nXYZD[3,2]*ss)+212);
        Image1.Canvas.LineTo(Round(nXYZD[1,3]-nXYZD[3,3]*cc)+212,-Round(nXYZD[2,3]-nXYZD[3,3]*ss)+212);
        Image1.Canvas.LineTo(Round(nXYZD[1,4]-nXYZD[3,4]*cc)+212,-Round(nXYZD[2,4]-nXYZD[3,4]*ss)+212);
        Image1.Canvas.LineTo(Round(nXYZD[1,1]-nXYZD[3,1]*cc)+212,-Round(nXYZD[2,1]-nXYZD[3,1]*ss)+212);
        Image1.Canvas.MoveTo(Round(nXYZD[1,5]-nXYZD[3,5]*cc)+212,-Round(nXYZD[2,5]-nXYZD[3,5]*ss)+212);
        Image1.Canvas.LineTo(Round(nXYZD[1,6]-nXYZD[3,6]*cc)+212,-Round(nXYZD[2,6]-nXYZD[3,6]*ss)+212);
        Image1.Canvas.LineTo(Round(nXYZD[1,7]-nXYZD[3,7]*cc)+212,-Round(nXYZD[2,7]-nXYZD[3,7]*ss)+212);
        Image1.Canvas.LineTo(Round(nXYZD[1,8]-nXYZD[3,8]*cc)+212,-Round(nXYZD[2,8]-nXYZD[3,8]*ss)+212);
        Image1.Canvas.LineTo(Round(nXYZD[1,5]-nXYZD[3,5]*cc)+212,-Round(nXYZD[2,5]-nXYZD[3,5]*ss)+212);
        for i:=1 to 4
        do
          begin
            Image1.Canvas.MoveTo(Round(nXYZD[1,i]-nXYZD[3,i]*cc)+212,-Round(nXYZD[2,i]-nXYZD[3,i]*ss)+212);
            Image1.Canvas.LineTo(Round(nXYZD[1,i+4]-nXYZD[3,i+4]*cc)+212,-Round(nXYZD[2,i+4]-nXYZD[3,i+4]*ss)+212);
          end;

        Image1.Canvas.Pen.Color:=clLime;
        Image1.Canvas.MoveTo(Round(nXYZD[1,1+8]-nXYZD[3,1+8]*cc)+212,-Round(nXYZD[2,1+8]-nXYZD[3,1+8]*ss)+212);
        Image1.Canvas.LineTo(Round(nXYZD[1,2+8]-nXYZD[3,2+8]*cc)+212,-Round(nXYZD[2,2+8]-nXYZD[3,2+8]*ss)+212);
        Image1.Canvas.LineTo(Round(nXYZD[1,3+8]-nXYZD[3,3+8]*cc)+212,-Round(nXYZD[2,3+8]-nXYZD[3,3+8]*ss)+212);
        Image1.Canvas.LineTo(Round(nXYZD[1,4+8]-nXYZD[3,4+8]*cc)+212,-Round(nXYZD[2,4+8]-nXYZD[3,4+8]*ss)+212);
        Image1.Canvas.LineTo(Round(nXYZD[1,1+8]-nXYZD[3,1+8]*cc)+212,-Round(nXYZD[2,1+8]-nXYZD[3,1+8]*ss)+212);
        Image1.Canvas.MoveTo(Round(nXYZD[1,5+8]-nXYZD[3,5+8]*cc)+212,-Round(nXYZD[2,5+8]-nXYZD[3,5+8]*ss)+212);
        Image1.Canvas.LineTo(Round(nXYZD[1,6+8]-nXYZD[3,6+8]*cc)+212,-Round(nXYZD[2,6+8]-nXYZD[3,6+8]*ss)+212);
        Image1.Canvas.LineTo(Round(nXYZD[1,7+8]-nXYZD[3,7+8]*cc)+212,-Round(nXYZD[2,7+8]-nXYZD[3,7+8]*ss)+212);
        Image1.Canvas.LineTo(Round(nXYZD[1,8+8]-nXYZD[3,8+8]*cc)+212,-Round(nXYZD[2,8+8]-nXYZD[3,8+8]*ss)+212);
        Image1.Canvas.LineTo(Round(nXYZD[1,5+8]-nXYZD[3,5+8]*cc)+212,-Round(nXYZD[2,5+8]-nXYZD[3,5+8]*ss)+212);
        for i:=1 to 4
        do
          begin
            Image1.Canvas.MoveTo(Round(nXYZD[1,i+8]-nXYZD[3,i+8]*cc)+212,-Round(nXYZD[2,i+8]-nXYZD[3,i+8]*ss)+212);
            Image1.Canvas.LineTo(Round(nXYZD[1,i+12]-nXYZD[3,i+12]*cc)+212,-Round(nXYZD[2,i+12]-nXYZD[3,i+12]*ss)+212);
          end;

        Image1.Canvas.Pen.Color:=clMaroon;
        for i:=1 to 8
        do
          begin
            Image1.Canvas.MoveTo(Round(nXYZD[1,i]-nXYZD[3,i]*cc)+212,-Round(nXYZD[2,i]-nXYZD[3,i]*ss)+212);
            Image1.Canvas.LineTo(Round(nXYZD[1,i+8]-nXYZD[3,i+8]*cc)+212,-Round(nXYZD[2,i+8]-nXYZD[3,i+8]*ss)+212);
          end;
      end;
  end;
  Application.ProcessMessages;
end;

procedure TForm1.T_AffTimer(Sender: TObject);
var
  i:Integer;
  sf,sp,sk,cf,cp,ck:Real;
begin
  fi:=fi+dfi;
  psi:=psi+dpsi;
  ksi:=ksi+dksi;
  sf:=Sin(fi);
  sp:=Sin(-psi);
  sk:=Sin(ksi);
  cf:=Cos(fi);
  cp:=Cos(-psi);
  ck:=Cos(ksi);
  ImgClr(Image1);
  case RadioGroup5.ItemIndex
  of
    0:
      begin
        for i:=1 to 4
        do
          begin
            nXYD[1,i]:=XYD[1,i]*cf-XYD[2,i]*sf;
            nXYD[2,i]:=XYD[1,i]*sf+XYD[2,i]*cf;
            nXYD[3,i]:=XYD[3,i];
          end;
        RedrawD(2);
      end;
    1:
      begin
        for i:=1 to 16
        do
          begin
            {>
            if (dfi>dpsi) and (dfi>dksi)
            then
              begin
                nXYZD[1,i]:=XYZD[1,i];
                nXYZD[2,i]:=XYZD[2,i]*cf+XYZD[3,i]*sf;
                nXYZD[3,i]:=-XYZD[2,i]*sf+XYZD[3,i]*cf;
              end
            else
              if (dpsi>dfi) and (dpsi>dksi)
              then
                begin
                  nXYZD[1,i]:=XYZD[1,i]*cp+XYZD[3,i]*sp;
                  nXYZD[2,i]:=XYZD[2,i];
                  nXYZD[3,i]:=-XYZD[1,i]*sp+XYZD[3,i]*cp;
                end
              else
                begin
                  nXYZD[1,i]:=XYZD[1,i]*ck+XYZD[2,i]*sk;
                  nXYZD[2,i]:=-XYZD[1,i]*sk+XYZD[2,i]*ck;
                  nXYZD[3,i]:=XYZD[3,i];
                end;

            {|}
            nXYZD[1,i]:=XYZD[1,i];
            nXYZD[2,i]:=XYZD[2,i]*cf+XYZD[3,i]*sf;
            nXYZD[3,i]:=-XYZD[2,i]*sf+XYZD[3,i]*cf;

            nXYZD[1,i]:=nXYZD[1,i]*cp+nXYZD[3,i]*sp;
            nXYZD[2,i]:=nXYZD[2,i];
            nXYZD[3,i]:=-nXYZD[1,i]*sp+nXYZD[3,i]*cp;

            nXYZD[1,i]:=nXYZD[1,i]*ck+nXYZD[2,i]*sk;
            nXYZD[2,i]:=-nXYZD[1,i]*sk+nXYZD[2,i]*ck;
            nXYZD[3,i]:=nXYZD[3,i];
            {<}
          end;
        RedrawD(3);
      end;
  end;
end;

procedure TForm1.B_IncFiClick(Sender: TObject);
begin
  dfi:=dfi+0.01;
end;

procedure TForm1.B_DecFiClick(Sender: TObject);
begin
  dfi:=dfi-0.01;
end;

procedure TForm1.B_IncPsiClick(Sender: TObject);
begin
  dpsi:=dpsi+0.01;
end;

procedure TForm1.B_DecPsiClick(Sender: TObject);
begin
  dpsi:=dpsi-0.01;
end;

procedure TForm1.B_IncKsiClick(Sender: TObject);
begin
  dksi:=dksi+0.01;
end;

procedure TForm1.B_DecKsiClick(Sender: TObject);
begin
  dksi:=dksi-0.01;
end;

end.

