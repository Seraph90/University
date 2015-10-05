unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Grids, ExtCtrls, Math, IWControl,
  IWCompButton, XPMan, Buttons, Spin,
  Matrix, Tri, Rim, Kram, MatInv, MatOper, MatU, Gauss, Iteratio, Zeydel;

type
  TForm1 = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    P_Tri: TPanel;
      SG_A: TStringGrid;
      SG_Ai: TStringGrid;
      SG_E: TStringGrid;
      SG_U: TStringGrid;
      SG_Ui: TStringGrid;
      SG_D: TStringGrid;
      SG_Di: TStringGrid;
      B_FM: TButton;
      B_C: TButton;
      B_DetA: TButton;
      B_R: TButton;
      B_E: TButton;
      B_Inv: TButton;
      B_InvTri: TButton;
    P_Rim: TPanel;
      SG_A2: TStringGrid;
      SG_Ai2: TStringGrid;
      SG_E2: TStringGrid;
      B_FM2: TButton;
      B_C2: TButton;
      B_DetA2: TButton;
    B_Exit: TButton;
    B_Inv2: TButton;
    SB_Tri: TSpeedButton;
    SB_Rim: TSpeedButton;
    XPManifest1: TXPManifest;
    SG_UE: TStringGrid;
    SG_DE: TStringGrid;
    SB_Kram: TSpeedButton;
    P_Kram: TPanel;
    SG_A3: TStringGrid;
    SG_B3: TStringGrid;
    SG_R3: TStringGrid;
    Label1: TLabel;
    E_n: TEdit;
    UpDown1: TUpDown;
    B_DetA3: TButton;
    B_FM3: TButton;
    B_Solve3: TButton;
    B_C3: TButton;
    SG_P3: TStringGrid;
    B_P3: TButton;
    B_P2: TButton;
    SB_MatInv: TSpeedButton;
    P_MatInv: TPanel;
    SG_A4: TStringGrid;
    SG_B4: TStringGrid;
    SG_R4: TStringGrid;
    B_DetA4: TButton;
    B_FM4: TButton;
    B_Solve4: TButton;
    B_C4: TButton;
    SG_P4: TStringGrid;
    B_P4: TButton;
    SG_Ai4: TStringGrid;
    SG_E4: TStringGrid;
    B_Inv4: TButton;
    SB_M: TSpeedButton;
    P_M: TPanel;
    B_FM5: TButton;
    B_C5: TButton;
    SG_A5: TStringGrid;
    SG_B5: TStringGrid;
    SG_R5: TStringGrid;
    B_M: TButton;
    P_MU: TPanel;
    SG_A6: TStringGrid;
    SG_B6: TStringGrid;
    B_DetA6: TButton;
    B_FM6: TButton;
    B_Solve6: TButton;
    B_C6: TButton;
    B_P6: TButton;
    SG_P6: TStringGrid;
    SG_X6: TStringGrid;
    B_Inv6: TButton;
    SG_Ai6: TStringGrid;
    SG_E6: TStringGrid;
    SB_MU: TSpeedButton;
    P_Gauss: TPanel;
    SG_A7: TStringGrid;
    SG_B7: TStringGrid;
    SG_R7: TStringGrid;
    Button2: TButton;
    B_R7: TButton;
    B_: TButton;
    SG_P7: TStringGrid;
    SG_T7: TStringGrid;
    SG_N7: TStringGrid;
    SB_Gauss: TSpeedButton;
    SG_FN: TStringGrid;
    SB_I: TSpeedButton;
    P_I: TPanel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    SG_A8: TStringGrid;
    SG_B8: TStringGrid;
    SG_X8: TStringGrid;
    B_FM8: TButton;
    B_Solve8: TButton;
    B_C8: TButton;
    SG_N8: TStringGrid;
    B_P8: TButton;
    SG_I8: TStringGrid;
    E_e8: TEdit;
    Label49: TLabel;
    SG_P8: TStringGrid;
    Label50: TLabel;
    SB_Z: TSpeedButton;
    P_Z: TPanel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    SG_A9: TStringGrid;
    SG_B9: TStringGrid;
    SG_X9: TStringGrid;
    B_FM9: TButton;
    B_Solve9: TButton;
    B_C9: TButton;
    SG_N9: TStringGrid;
    B_P9: TButton;
    SG_Z9: TStringGrid;
    E_e9: TEdit;
    SG_P9: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure E_nChange(Sender: TObject);
    procedure B_EClick(Sender: TObject);
    procedure B_FMClick(Sender: TObject);
    procedure B_DetAClick(Sender: TObject);
    procedure B_DetA2Click(Sender: TObject);
    procedure B_RClick(Sender: TObject);
    procedure B_InvTriClick(Sender: TObject);
    procedure B_InvClick(Sender: TObject);
    procedure SBClick(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure B_DetA8Click(Sender: TObject);
    procedure B_Solve3Click(Sender: TObject);
    procedure B_P3Click(Sender: TObject);
    procedure B_Inv2Click(Sender: TObject);
    procedure B_P2Click(Sender: TObject);
    procedure B_DetA4Click(Sender: TObject);
    procedure B_Inv4Click(Sender: TObject);
    procedure B_Solve4Click(Sender: TObject);
    procedure B_P4Click(Sender: TObject);
    procedure B_MClick(Sender: TObject);
    procedure B_DetA6Click(Sender: TObject);
    procedure B_Inv6Click(Sender: TObject);
    procedure B_Solve6Click(Sender: TObject);
    procedure B_P6Click(Sender: TObject);
    procedure B_P9Click(Sender: TObject);
    procedure B_R7Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure B_Solve8Click(Sender: TObject);
    procedure B_P8Click(Sender: TObject);
    procedure B_Solve9Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  H=170;

var
  Form1:TForm1;
  Z:TMyMat;

  //function NOTM(tA:TMyMat; n1,n2:Integer; Num:Byte):Real;


implementation

{$R *.dfm}


{
function NOTM(tA:TMyMat; n1,n2:Integer; Num:Byte):Real;
var
  i,j:Integer;
  mx,bmx:Real;
begin
  mx:=0;
  case Num
  of
    1:begin
        for j:=1 to n2
        do
          mx:=mx+abs(tA[j,1]);
        for i:=2 to n1
        do
          begin
            bmx:=0;
            for j:=1 to n2
            do
              bmx:=bmx+abs(tA[j,i]);
            if bmx>mx
            then
              mx:=bmx;
          end;
      end;
    2:begin
        for i:=1 to n1
        do
          mx:=mx+abs(tA[1,i]);
        for j:=2 to n2
        do
          begin
            bmx:=0;
            for i:=1 to n1
            do
              bmx:=bmx+abs(tA[j,i]);
            if bmx>mx
            then
              mx:=bmx;
          end;
      end;
    3:begin
        for i:=1 to n1
        do
          for j:=1 to n2
          do
            mx:=mx+sqr(abs(tA[j,i]));
        mx:=sqrt(mx);
      end;
  end;
  NOTM:=mx;
end;
}

procedure TForm1.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  if Button=btNext
  then
    E_n.Text:=IntToStr(StrToInt(E_n.Text)+1)
  else
    E_n.Text:=IntToStr(StrToInt(E_n.Text)-1);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i,j:Integer;
begin
  for i:=1 to 10
  do
    for j:=1 to 10
    do
      Z[j,i]:=0;
  SBClick(Form1);
  n:=SG_A.ColCount;
  n2:=SG_A2.ColCount;
  n3:=SG_A3.ColCount;
  n4:=SG_A4.ColCount;
  n5:=SG_A5.ColCount;
  n6:=SG_A6.ColCount;
  n7:=SG_A7.ColCount;
  n8:=SG_A8.ColCount;
  n9:=SG_A9.ColCount;

  SG_A.Cells[0,0]:='5';
  SG_A.Cells[1,0]:='-4';
  SG_A.Cells[2,0]:='0';
  SG_A.Cells[3,0]:='2';
  SG_A.Cells[0,1]:='-1';
  SG_A.Cells[1,1]:='1';
  SG_A.Cells[2,1]:='1';
  SG_A.Cells[3,1]:='-1';
  SG_A.Cells[0,2]:='2';
  SG_A.Cells[1,2]:='3';
  SG_A.Cells[2,2]:='1';
  SG_A.Cells[3,2]:='-6';
  SG_A.Cells[0,3]:='1';
  SG_A.Cells[1,3]:='0';
  SG_A.Cells[2,3]:='2';
  SG_A.Cells[3,3]:='-1';

  SG_A2.Cells[0,0]:='5';
  SG_A2.Cells[1,0]:='-4';
  SG_A2.Cells[2,0]:='0';
  SG_A2.Cells[3,0]:='2';
  SG_A2.Cells[0,1]:='-1';
  SG_A2.Cells[1,1]:='1';
  SG_A2.Cells[2,1]:='1';
  SG_A2.Cells[3,1]:='-1';
  SG_A2.Cells[0,2]:='2';
  SG_A2.Cells[1,2]:='3';
  SG_A2.Cells[2,2]:='1';
  SG_A2.Cells[3,2]:='-6';
  SG_A2.Cells[0,3]:='1';
  SG_A2.Cells[1,3]:='0';
  SG_A2.Cells[2,3]:='2';
  SG_A2.Cells[3,3]:='-1';

  SG_A3.Cells[0,0]:='2';
  SG_A3.Cells[1,0]:='1';
  SG_A3.Cells[2,0]:='-5';
  SG_A3.Cells[3,0]:='1';
  SG_A3.Cells[0,1]:='1';
  SG_A3.Cells[1,1]:='-3';
  SG_A3.Cells[2,1]:='0';
  SG_A3.Cells[3,1]:='-6';
  SG_A3.Cells[0,2]:='0';
  SG_A3.Cells[1,2]:='2';
  SG_A3.Cells[2,2]:='-1';
  SG_A3.Cells[3,2]:='2';
  SG_A3.Cells[0,3]:='1';
  SG_A3.Cells[1,3]:='4';
  SG_A3.Cells[2,3]:='-7';
  SG_A3.Cells[3,3]:='6';
  SG_B3.Cells[0,0]:='8';
  SG_B3.Cells[0,1]:='9';
  SG_B3.Cells[0,2]:='-5';
  SG_B3.Cells[0,3]:='0';

  SG_A4.Cells[0,0]:='0';
  SG_A4.Cells[1,0]:='1';
  SG_A4.Cells[2,0]:='1';
  SG_A4.Cells[0,1]:='1';
  SG_A4.Cells[1,1]:='0';
  SG_A4.Cells[2,1]:='-3';
  SG_A4.Cells[0,2]:='2';
  SG_A4.Cells[1,2]:='-3';
  SG_A4.Cells[2,2]:='5';
  SG_B4.Cells[0,0]:='5';
  SG_B4.Cells[0,1]:='-8';
  SG_B4.Cells[0,2]:='11';

  SG_A5.Cells[0,0]:='5';
  SG_A5.Cells[1,0]:='3';
  SG_A5.Cells[2,0]:='-1';
  SG_A5.Cells[0,1]:='2';
  SG_A5.Cells[1,1]:='0';
  SG_A5.Cells[2,1]:='4';
  SG_A5.Cells[0,2]:='3';
  SG_A5.Cells[1,2]:='5';
  SG_A5.Cells[2,2]:='-1';
  SG_B5.Cells[0,0]:='1';
  SG_B5.Cells[1,0]:='4';
  SG_B5.Cells[2,0]:='16';
  SG_B5.Cells[0,1]:='-3';
  SG_B5.Cells[1,1]:='-2';
  SG_B5.Cells[2,1]:='0';
  SG_B5.Cells[0,2]:='5';
  SG_B5.Cells[1,2]:='7';
  SG_B5.Cells[2,2]:='2';

  SG_A6.Cells[0,0]:='0';
  SG_A6.Cells[1,0]:='1';
  SG_A6.Cells[2,0]:='1';
  SG_A6.Cells[0,1]:='1';
  SG_A6.Cells[1,1]:='0';
  SG_A6.Cells[2,1]:='-3';
  SG_A6.Cells[0,2]:='2';
  SG_A6.Cells[1,2]:='-3';
  SG_A6.Cells[2,2]:='5';
  SG_B6.Cells[0,0]:='2';
  SG_B6.Cells[1,0]:='0';
  SG_B6.Cells[2,0]:='0';
  SG_B6.Cells[0,1]:='-2';
  SG_B6.Cells[1,1]:='0';
  SG_B6.Cells[2,1]:='0';
  SG_B6.Cells[0,2]:='4';
  SG_B6.Cells[1,2]:='0';
  SG_B6.Cells[2,2]:='0';

  SG_A7.Cells[0,0]:='7,9';
  SG_A7.Cells[1,0]:='5,6';
  SG_A7.Cells[2,0]:='5,7';
  SG_A7.Cells[3,0]:='-7,2';
  SG_A7.Cells[0,1]:='8,5';
  SG_A7.Cells[1,1]:='-4,8';
  SG_A7.Cells[2,1]:='0,8';
  SG_A7.Cells[3,1]:='3,5';
  SG_A7.Cells[0,2]:='4,3';
  SG_A7.Cells[1,2]:='4,2';
  SG_A7.Cells[2,2]:='-3,2';
  SG_A7.Cells[3,2]:='9,3';
  SG_A7.Cells[0,3]:='3,2';
  SG_A7.Cells[1,3]:='-1,4';
  SG_A7.Cells[2,3]:='-8,9';
  SG_A7.Cells[3,3]:='3,3';
  SG_B7.Cells[0,0]:='6,68';
  SG_B7.Cells[0,1]:='9,95';
  SG_B7.Cells[0,2]:='8,6';
  SG_B7.Cells[0,3]:='1';
  SG_T7.Cells[1,0]:='X1';
  SG_T7.Cells[2,0]:='X2';
  SG_T7.Cells[3,0]:='X3';
  SG_T7.Cells[4,0]:='X4';
  SG_T7.Cells[5,0]:='B';
  SG_T7.Cells[6,0]:='S';
  SG_T7.Cells[7,0]:='S''';
  SG_T7.Cells[0,1]:='0';
  SG_T7.Cells[0,6]:='1';
  SG_T7.Cells[0,10]:='2';
  SG_T7.Cells[0,13]:='3';
  SG_T7.Cells[0,15]:='0X';

  SG_A8.Cells[0,0]:='45';
  SG_A8.Cells[1,0]:='-18';
  SG_A8.Cells[2,0]:='36';
  SG_A8.Cells[0,1]:='31';
  SG_A8.Cells[1,1]:='23';
  SG_A8.Cells[2,1]:='-12';
  SG_A8.Cells[0,2]:='18';
  SG_A8.Cells[1,2]:='25';
  SG_A8.Cells[2,2]:='46';
  SG_B8.Cells[0,0]:='-17';
  SG_B8.Cells[0,1]:='36';
  SG_B8.Cells[0,2]:='22';
  SG_I8.Cells[0,1]:='1';
  SG_I8.Cells[0,2]:='2';
  SG_I8.Cells[0,3]:='3';

  SG_A9.Cells[0,0]:='45';
  SG_A9.Cells[1,0]:='-18';
  SG_A9.Cells[2,0]:='36';
  SG_A9.Cells[0,1]:='31';
  SG_A9.Cells[1,1]:='23';
  SG_A9.Cells[2,1]:='-12';
  SG_A9.Cells[0,2]:='18';
  SG_A9.Cells[1,2]:='25';
  SG_A9.Cells[2,2]:='46';
  SG_B9.Cells[0,0]:='-17';
  SG_B9.Cells[0,1]:='36';
  SG_B9.Cells[0,2]:='22';
  SG_Z9.Cells[0,1]:='1';
  SG_Z9.Cells[0,2]:='2';
  SG_Z9.Cells[0,3]:='3';
end;

procedure TForm1.E_nChange(Sender: TObject);
var
  i,j:Integer;
begin
  if P_Tri.Visible
  then
    begin
      n:=StrToInt(E_n.Text);
      SG_A.ColCount:=n;
      SG_A.RowCount:=n;
      SG_Ai.ColCount:=n;
      SG_Ai.RowCount:=n;
      SG_D.ColCount:=n;
      SG_D.RowCount:=n;
      SG_Di.ColCount:=n;
      SG_Di.RowCount:=n;
      SG_DE.ColCount:=n;
      SG_DE.RowCount:=n;
      SG_U.ColCount:=n;
      SG_U.RowCount:=n;
      SG_Ui.ColCount:=n;
      SG_Ui.RowCount:=n;
      SG_UE.ColCount:=n;
      SG_UE.RowCount:=n;
      SG_E.ColCount:=n;
      SG_E.RowCount:=n;
      for i:=1 to n
      do
        for j:=1 to n
        do
          begin
            SG_A.Cells[i-1,j-1]:='0';
            SG_Ai.Cells[i-1,j-1]:='0';
            SG_D.Cells[i-1,j-1]:='0';
            SG_Di.Cells[i-1,j-1]:='0';
            SG_DE.Cells[i-1,j-1]:='0';
            SG_U.Cells[i-1,j-1]:='0';
            SG_Ui.Cells[i-1,j-1]:='0';
            SG_UE.Cells[i-1,j-1]:='0';
            SG_E.Cells[i-1,j-1]:='0';
          end;
    end;
  if P_Rim.Visible
  then
    begin
      n2:=StrToInt(E_n.Text);
      SG_A2.ColCount:=n2;
      SG_A2.RowCount:=n2;
      SG_Ai2.ColCount:=n2;
      SG_Ai2.RowCount:=n2;
      SG_E2.ColCount:=n2;
      SG_E2.RowCount:=n2;
      for i:=1 to n2
      do
        for j:=1 to n2
        do
          begin
            SG_A2.Cells[i-1,j-1]:='0';
            SG_Ai2.Cells[i-1,j-1]:='0';
            SG_E2.Cells[i-1,j-1]:='0';
          end;
    end;
  if P_Kram.Visible
  then
    begin
      n3:=StrToInt(E_n.Text);
      SG_A3.ColCount:=n3;
      SG_A3.RowCount:=n3;
      SG_B3.ColCount:=1;
      SG_B3.RowCount:=n3;
      SG_R3.ColCount:=1;
      SG_R3.RowCount:=n3;
      SG_P3.ColCount:=1;
      SG_P3.RowCount:=n3;
      for i:=1 to n3
      do
        begin
            SG_B3.Cells[0,i-1]:='0';
            SG_R3.Cells[0,i-1]:='0';
            SG_P3.Cells[0,i-1]:='0';
          for j:=1 to n3
          do
            SG_A3.Cells[i-1,j-1]:='0';
        end;
    end;
  if P_MatInv.Visible
  then
    begin
      n4:=StrToInt(E_n.Text);
      SG_A4.ColCount:=n4;
      SG_A4.RowCount:=n4;
      SG_Ai4.ColCount:=n4;
      SG_Ai4.RowCount:=n4;
      SG_B4.ColCount:=1;
      SG_B4.RowCount:=n4;
      SG_E4.ColCount:=n4;
      SG_E4.RowCount:=n4;
      SG_R4.ColCount:=1;
      SG_R4.RowCount:=n4;
      SG_P4.ColCount:=1;
      SG_P4.RowCount:=n4;
      for i:=1 to n4
      do
        begin
            SG_B4.Cells[0,i-1]:='0';
            SG_R4.Cells[0,i-1]:='0';
            SG_P4.Cells[0,i-1]:='0';
          for j:=1 to n4
          do
            begin
              SG_A4.Cells[i-1,j-1]:='0';
              SG_Ai4.Cells[i-1,j-1]:='0';
              SG_E4.Cells[i-1,j-1]:='0';
            end;
        end;
    end;
  if P_M.Visible
  then
    begin
      n5:=StrToInt(E_n.Text);
      SG_A5.ColCount:=n5;
      SG_A5.RowCount:=n5;
      SG_B5.ColCount:=n5;
      SG_B5.RowCount:=n5;
      SG_R3.ColCount:=n5;
      SG_R3.RowCount:=n5;
      for i:=1 to n3
      do
        for j:=1 to n3
        do
          begin
            SG_A5.Cells[j-1,i-1]:='0';
            SG_B5.Cells[j-1,i-1]:='0';
            SG_R5.Cells[j-1,i-1]:='0';
          end;
    end;
  if P_MU.Visible
  then
    begin
      n6:=StrToInt(E_n.Text);
      SG_A6.ColCount:=n6;
      SG_A6.RowCount:=n6;
      SG_Ai6.ColCount:=n6;
      SG_Ai6.RowCount:=n6;
      SG_B6.ColCount:=n6;
      SG_B6.RowCount:=n6;
      SG_E6.ColCount:=n6;
      SG_E6.RowCount:=n6;
      SG_P6.ColCount:=n6;
      SG_P6.RowCount:=n6;
      SG_X6.ColCount:=n6;
      SG_X6.RowCount:=n6;
      for i:=1 to n6
      do
        for j:=1 to n6
        do
          begin
            SG_A6.Cells[i-1,j-1]:='0';
            SG_Ai6.Cells[i-1,j-1]:='0';
            SG_B6.Cells[i-1,j-1]:='0';
            SG_E6.Cells[i-1,j-1]:='0';
            SG_P6.Cells[i-1,j-1]:='0';
            SG_X6.Cells[i-1,j-1]:='0';
          end;
    end;
  {
  if P_Gauss.Visible
  then
    begin
      n7:=StrToInt(E_n.Text);
      SG_A7.ColCount:=n7;
      SG_A7.RowCount:=n7;
      SG_B7.ColCount:=1;
      SG_B7.RowCount:=n7;
      SG_R7.ColCount:=1;
      SG_R7.RowCount:=n7;
      SG_P7.ColCount:=1;
      SG_P7.RowCount:=n7;
      SG_N7.ColCount:=1;
      SG_N7.RowCount:=n7;
      for i:=1 to n7
      do
        begin
            SG_B7.Cells[0,i-1]:='0';
            SG_R7.Cells[0,i-1]:='0';
            SG_P7.Cells[0,i-1]:='0';
            SG_N7.Cells[0,i-1]:='0';
          for j:=1 to n7
          do
            begin
              SG_A7.Cells[i-1,j-1]:='0';
            end;
        end;
      SG_T7.ColCount:=n7+4;
      SG_T7.RowCount:=n7*n7+1;
      k:=1;
      for i:=1 to n7
      do
        begin
          SG_T7.Cells[i,0]:='X'+IntToStr(i);
          for j:=1 to n7
          do
            begin
              SG_T7.Cells[0,k]:=IntToStr(i);
              Inc(k);
            end;
        end;
          SG_T7.Cells[n7+1,0]:='B';
          SG_T7.Cells[n7+2,0]:='S';
          SG_T7.Cells[n7+3,0]:='S''';
    end;
  }
  if P_I.Visible
  then
    begin
      n8:=StrToInt(E_n.Text);
      SG_A8.ColCount:=n8;
      SG_A8.RowCount:=n8;
      SG_B8.ColCount:=1;
      SG_B8.RowCount:=n8;
      SG_X8.ColCount:=1;
      SG_X8.RowCount:=n8;
      SG_N8.ColCount:=1;
      SG_N8.RowCount:=n8;
      SG_P8.ColCount:=1;
      SG_P8.RowCount:=n8;
      SG_I8.ColCount:=2;
      SG_I8.RowCount:=n8+1;
      for i:=1 to n8
      do
        begin
            SG_B8.Cells[0,i-1]:='0';
            SG_X8.Cells[0,i-1]:='0';
            SG_N8.Cells[0,i-1]:='0';
            SG_P8.Cells[0,i-1]:='0';
          for j:=1 to n9
          do
            begin
              SG_A8.Cells[i-1,j-1]:='0';
              SG_I8.Cells[0,j]:=IntToStr(j);
            end;
        end;
    end;
  if P_Z.Visible
  then
    begin
      n9:=StrToInt(E_n.Text);
      SG_A9.ColCount:=n9;
      SG_A9.RowCount:=n9;
      SG_B9.ColCount:=1;
      SG_B9.RowCount:=n9;
      SG_X9.ColCount:=1;
      SG_X9.RowCount:=n9;
      SG_N9.ColCount:=1;
      SG_N9.RowCount:=n9;
      SG_P9.ColCount:=1;
      SG_P9.RowCount:=n9;
      SG_Z9.ColCount:=2;
      SG_Z9.RowCount:=n9+1;
      for i:=1 to n9
      do
        begin
            SG_B9.Cells[0,i-1]:='0';
            SG_X9.Cells[0,i-1]:='0';
            SG_N9.Cells[0,i-1]:='0';
            SG_P9.Cells[0,i-1]:='0';
          for j:=1 to n9
          do
            begin
              SG_A9.Cells[i-1,j-1]:='0';
              SG_Z9.Cells[0,j]:=IntToStr(j);
            end;
        end;
    end;
end;

procedure TForm1.B_FMClick(Sender: TObject);
var
  i,j:Integer;
begin
  if P_Tri.Visible
  then
    for i:=1 to n
    do
      for j:=1 to n
      do
        SG_A.Cells[j-1,i-1]:=FloatToStr(Random(11)-5);
  if P_Rim.Visible
  then
    for i:=1 to n2
    do
      for j:=1 to n2
      do
        SG_A2.Cells[j-1,i-1]:=FloatToStr(Random(11)-5);
  if P_Kram.Visible
  then
    for i:=1 to n3
    do
      begin
        SG_B3.Cells[0,i-1]:=FloatToStr(Random(11)-5);
        for j:=1 to n3
        do
          SG_A3.Cells[j-1,i-1]:=FloatToStr(Random(11)-5);
      end;
  if P_MatInv.Visible
  then
    for i:=1 to n4
    do
      begin
        SG_B4.Cells[0,i-1]:=FloatToStr(Random(11)-5);
        for j:=1 to n4
        do
          SG_A4.Cells[j-1,i-1]:=FloatToStr(Random(11)-5);
      end;
  if P_M.Visible
  then
    for i:=1 to n5
    do
      for j:=1 to n5
      do
        begin
          SG_A5.Cells[j-1,i-1]:=FloatToStr(Random(11)-5);
          SG_B5.Cells[j-1,i-1]:=FloatToStr(Random(11)-5);
        end;
  if P_MU.Visible
  then
    for i:=1 to n6
    do
      for j:=1 to n6
      do
        begin
          SG_A6.Cells[j-1,i-1]:=FloatToStr(Random(11)-5);
          SG_B6.Cells[j-1,i-1]:=FloatToStr(Random(11)-5);
        end;
  if P_Gauss.Visible
  then
    for i:=1 to n7
    do
      begin
        SG_B7.Cells[0,i-1]:=FloatToStr(Random(11)-5);
        for j:=1 to n7
        do
          SG_A7.Cells[j-1,i-1]:=FloatToStr(Random(11)-5);
      end;
  if P_I.Visible
  then
    begin
      E_nChange(Form1);
      for i:=1 to n8
        do
          begin
            SG_B8.Cells[0,i-1]:=FloatToStr(Random(11)-5);
            for j:=1 to n8
            do
              SG_A8.Cells[j-1,i-1]:=FloatToStr(Random(11)-5);
          end;
    end;
end;

procedure TForm1.B_DetAClick(Sender: TObject);
var
  i:Integer;
  ts:TMySet;
begin
  ts:=[];
  for i:=1 to n
  do
    ts:=ts+[i];
  A:=ReadMat(n,n,SG_A);
  DetA:=Determinate(A,n,ts,1);
  Caption:='| A | = '+FloatToStr(DetA);
end;

procedure TForm1.B_RClick(Sender: TObject);
begin
  if DetA=0
  then
    begin
      Caption:='Детерминант равен 0';
      Exit;
    end;
  DisPart(ReadMat(n,n,SG_A),U,D,n);
  WriteMat(D,1,1,n,n,SG_D,-3);
  WriteMat(U,1,1,n,n,SG_U,-3);
end;

procedure TForm1.B_InvTriClick(Sender: TObject);
begin
  Di:=MatInD(D,n);
  Ui:=MatInU(U,n);
  WriteMat(Di,1,1,n,n,SG_Di,-3);
  WriteMat(Ui,1,1,n,n,SG_Ui,-3);
end;

procedure TForm1.B_InvClick(Sender: TObject);
begin
  Ai:=MultMat(Ui,Di,n,n,n);
  WriteMat(Ai,1,1,n,n,SG_Ai,-3);
end;

procedure TForm1.B_EClick(Sender: TObject);
begin
  E:=MultMat(Ai,A,n,n,n);
  WriteMat(E,1,1,n,n,SG_E,0);
  UE:=MultMat(U,Ui,n,n,n);
  WriteMat(UE,1,1,n,n,SG_UE,0);
  DE:=MultMat(D,Di,n,n,n);
  WriteMat(DE,1,1,n,n,SG_DE,0);
end;

procedure TForm1.B_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.SBClick(Sender: TObject);
begin
  P_Tri.Visible:=False;
  P_Rim.Visible:=False;
  P_Kram.Visible:=False;
  P_MatInv.Visible:=False;
  P_M.Visible:=False;
  P_MU.Visible:=False;
  P_Gauss.Visible:=False;
  P_I.Visible:=False;
  P_Z.Visible:=False;
  UpDown1.Visible:=not SB_Gauss.Down;
  if SB_Tri.Down
  then
    begin
      Caption:='Обращение матрицы через треугольные';
      E_n.Text:=IntToStr(SG_A.ColCount);
      P_Tri.Visible:=True;
      Height:=P_Tri.Height+H;
      Width:=P_Tri.Width+5;
      UpDown1.Position:=SG_A.ColCount;
    end;
  if SB_Rim.Down
  then
    begin
      Caption:='Обращение матрицы методом окаймления';
      E_n.Text:=IntToStr(SG_A2.ColCount);
      P_Rim.Visible:=True;
      Height:=P_Rim.Height+H;
      Width:=P_Rim.Width+5;
      UpDown1.Position:=SG_A2.ColCount;
    end;
  if SB_Kram.Down
  then
    begin
      Caption:='Решение системы методом Крамера';
      E_n.Text:=IntToStr(SG_A3.ColCount);
      P_Kram.Visible:=True;
      Height:=P_Kram.Height+H;
      Width:=P_Rim.Width+5;
      UpDown1.Position:=SG_A3.ColCount;
    end;
  if SB_MatInv.Down
  then
    begin
      Caption:='Решение системы методом обратной матрицы';
      E_n.Text:=IntToStr(SG_A4.ColCount);
      P_MatInv.Visible:=True;
      Height:=P_MatInv.Height+H;
      Width:=P_Rim.Width+5;
      UpDown1.Position:=SG_A4.ColCount;
    end;
  if SB_M.Down
  then
    begin
      Caption:='Выполнение дейсвий над матрицами';
      E_n.Text:=IntToStr(SG_A5.ColCount);
      P_M.Visible:=True;
      Height:=P_M.Height+H;
      Width:=P_Rim.Width+5;
      UpDown1.Position:=SG_A5.ColCount;
    end;
  if SB_MU.Down
  then
    begin
      Caption:='Решение матричного уравнения';
      E_n.Text:=IntToStr(SG_A6.ColCount);
      P_MU.Visible:=True;
      Height:=P_MU.Height+H+5;
      Width:=P_Rim.Width+5;
      UpDown1.Position:=SG_A6.ColCount;
    end;
  if SB_Gauss.Down
  then
    begin
      Caption:='Решение системы методом Гаусса';
      E_n.Text:=IntToStr(SG_A7.ColCount);
      P_Gauss.Visible:=True;
      Height:=P_Gauss.Height+H;
      Width:=P_Gauss.Width+5;
      UpDown1.Position:=SG_A7.ColCount;
    end;
  if SB_I.Down
  then
    begin
      Caption:='Решение системы методом итераций';
      E_n.Text:=IntToStr(SG_A8.ColCount);
      P_I.Visible:=True;
      Height:=P_I.Height+H;
      Width:=P_Rim.Width+5;
      UpDown1.Position:=SG_A8.ColCount;
    end;
  if SB_Z.Down
  then
    begin
      Caption:='Решение системы методом Зейделя';
      E_n.Text:=IntToStr(SG_A9.ColCount);
      P_Z.Visible:=True;
      Height:=P_Z.Height+H;
      Width:=P_Rim.Width+5;
      UpDown1.Position:=SG_A9.ColCount;
    end;
end;

procedure TForm1.B_DetA2Click(Sender: TObject);
var
  i:Integer;
  ts:TMySet;
begin
  ts:=[];
  for i:=1 to n2
  do
    ts:=ts+[i];
  A2:=ReadMat(n2,n2,SG_A2);
  DetA2:=Determinate(A2,n2,ts,1);
  Caption:='| A | = '+FloatToStr(DetA2);
end;

procedure TForm1.B_DetA8Click(Sender: TObject);
var
  i:Integer;
  ts:TMySet;
begin
  ts:=[];
  for i:=1 to n3
  do
    ts:=ts+[i];
  A3:=ReadMat(n3,n3,SG_A3);
  DetA3:=Determinate(A3,n3,ts,1);
  Caption:='| A | = '+FloatToStr(DetA3);
end;

procedure TForm1.B_Solve3Click(Sender: TObject);
var
  i,k:Integer;
  ts:TMySet;
  tA:TMyMat;
begin
  ts:=[];
  A3:=ReadMat(n3,n3,SG_A3);
  B3:=ReadMat(1,n3,SG_B3);
  for k:=1 to n3
  do
    ts:=ts+[k];
  for k:=1 to n3
  do
    begin
      tA:=A3;
      for i:=1 to n3
      do
        tA[k,i]:=B3[1,i];
      DetK[k]:=Determinate(tA,n3,ts,1);
    end;
  //Caption:='';
  for i:=1 to n3
  do
    begin
      SG_R3.Cells[0,i-1]:=FloatToStr(RoundTo(DetK[i]/DetA3,-3));
    //  Caption:=Caption+' '+FloatToStr(RoundTo(DetK[i],-3));
    end;
  R3:=ReadMat(1,n3,SG_R3);
end;

procedure TForm1.B_P3Click(Sender: TObject);
begin
  WriteMat(MultMat(A3,R3,n3,n3,1),1,1,1,n3,SG_P3,-3);
end;

procedure TForm1.B_Inv2Click(Sender: TObject);
begin
  WriteMat(MatRimInv(A2,n2),1,1,n2,n2,SG_Ai2,-3);
end;

procedure TForm1.B_P2Click(Sender: TObject);
begin
  A2:=ReadMat(n2,n2,SG_A2);
  Ai2:=ReadMat(n2,n2,SG_Ai2);
  WriteMat(MultMat(A2,Ai2,n2,n2,n2),1,1,n2,n2,SG_E2,0);
end;

procedure TForm1.B_DetA4Click(Sender: TObject);
var
  i:Integer;
  ts:TMySet;
begin
  ts:=[];
  for i:=1 to n4
  do
    ts:=ts+[i];
  A4:=ReadMat(n4,n4,SG_A4);
  DetA4:=Determinate(A4,n4,ts,1);
  Caption:='| A | = '+FloatToStr(DetA4);
end;

procedure TForm1.B_Inv4Click(Sender: TObject);
var
  r,i:Integer;
begin
  r:=1;
  if A4[1,1]=0
  then
    for i:=1 to n4
    do
      if A4[1,i]<>0
      then
        r:=i;
  Ai4:=CSch(MatRimInv(RSch(A4,1,r,n4),n4),1,r,n4);
  WriteMat(Ai4,1,1,n4,n4,SG_Ai4,-3);
end;

procedure TForm1.B_Solve4Click(Sender: TObject);
begin
  B4:=ReadMat(1,n4,SG_B4);
  WriteMat(MultMat(Ai4,B4,n4,n4,1),1,1,1,n4,SG_R4,-3);
end;

procedure TForm1.B_P4Click(Sender: TObject);
begin
  WriteMat(MultMat(A4,ReadMat(1,n4,SG_R4),n4,n4,1),1,1,1,n4,SG_P4,-3);
  WriteMat(MultMat(A4,Ai4,n4,n4,n4),1,1,n4,n4,SG_E4,0);
end;

procedure TForm1.B_MClick(Sender: TObject);
begin
  A5:=ReadMat(n5,n5,SG_A5);
  B5:=ReadMat(n5,n5,SG_B5);
  WriteMat(SumMat(MatDiv(SubMat(A5,MatDiv(B5,n5,n5,2),n5,n5),n5,n5,0.5),MultMat(A5,B5,n5,n5,n5),n5,n5),1,1,n5,n5,SG_R5,-3);
end;

procedure TForm1.B_DetA6Click(Sender: TObject);
var
  i:Integer;
  ts:TMySet;
begin
  ts:=[];
  for i:=1 to n6
  do
    ts:=ts+[i];
  A6:=ReadMat(n6,n6,SG_A6);
  DetA6:=Determinate(A6,n6,ts,1);
  Caption:='| A | = '+FloatToStr(DetA6);
end;

procedure TForm1.B_Inv6Click(Sender: TObject);
var
  r,i:Integer;
begin
  r:=1;
  if A6[1,1]=0
  then
    for i:=1 to n6
    do
      if A6[1,i]<>0
      then
        r:=i;
  Ai6:=CSch(MatRimInv(RSch(A6,1,r,n6),n6),1,r,n6);
  WriteMat(Ai6,1,1,n6,n6,SG_Ai6,-3);
end;

procedure TForm1.B_Solve6Click(Sender: TObject);
begin
  B6:=ReadMat(n6,n6,SG_B6);
  WriteMat(MultMat(Ai6,B6,n6,n6,n6),1,1,n6,n6,SG_X6,-3);
end;

procedure TForm1.B_P6Click(Sender: TObject);
begin
  X:=ReadMat(n6,n6,SG_X6);
  WriteMat(MultMat(A6,X,n6,n6,n6),1,1,n6,n6,SG_P6,-3);
  WriteMat(MultMat(A6,Ai6,n6,n6,n6),1,1,n6,n6,SG_E6,0);
end;

procedure TForm1.B_P9Click(Sender: TObject);
var
  A,X,R:TMyMat;
begin
  A:=ReadMat(n9,n9,SG_A9);
  X:=ReadMat(1,n9,SG_X9);
  R:=MultMat(A,X,n9,n9,1);
  WriteMat(R,1,1,1,n9,SG_P9,-2);
end;

procedure TForm1.B_R7Click(Sender: TObject);
var
  i,j:Integer;
  ts:TMySet;
begin
  A7:=ReadMat(n7,n7,SG_A7);
  B7:=ReadMat(1,n7,SG_B7);
  ts:=[];
  for i:=1 to n7
  do
    begin
      ts:=ts+[i];
      AB7[n7+1,i]:=B7[1,i];
      for j:=1 to n7
      do
        AB7[j,i]:=A7[j,i];
    end;
  DetA7:=Determinate(A7,n7,ts,1);
  if DetA7=0
  then
    begin
      Application.MessageBox('Определитель равен 0!','Ошибка',0);
      exit;
    end
  else
    begin
      Ao7:=AB7;
      ForwardWay(Ao7,n7,SG_T7);
      At7:=AB7;
      for i:=1 to n7
      do
        for j:=1 to n7
        do
          At7[n7+1,i]:=At7[n7+1,i]+At7[j,i];  {за столбец своб. членов Е}
      ForwardWay2(At7,n7);
      BackwardWay2(At7,n7);
      for i:=1 to n7
      do
        Ao7[n7+2,i]:=At7[i,n7+1];
      BackwardWay(Ao7,n7,SG_T7);         {обратный ход}
      At7:=AB7;
      for i:=1 to n7
      do
        begin                              {невязки}
          At7[n7+1,i]:=0;
          for j:=1 to n7
          do
            At7[n7+1,i]:=At7[n7+1,i]+AB7[j,i]*Ao7[n7+1,j];
          At7[n7+1,i]:=AB7[n7+1,i]-At7[n7+1,i];
        end;
      for i:=1 to n7
      do
        SG_N7.Cells[0,i-1]:=FloatToStr(RoundTo(At7[n7+1,i],-4));
      ForwardWay2(At7,n7);
      for i:=1 to n7
      do
        At7[n7+2,i]:=0;
      BackwardWay2(At7,n7);
                                                 {поправки}
      for i:=1 to n7
      do
        SG_P7.Cells[0,i-1]:=FloatToStr(RoundTo(At7[n7+1,i],-4));
      for i:=1 to n7
      do
        begin                                      {уточненные корни}
          x[1,i]:=Ao7[n7+1,i]+At7[n7+1,i];
          SG_R7.Cells[0,i-1]:=FloatToStr(RoundTo(x[1,i],-4));
        end;
      At7:=AB7;
      for i:=1 to n7
      do
        begin
          At7[n7+1,i]:=0;
          for j:=1 to n7
          do
            At7[n7+1,i]:=At7[n7+1,i]+AB7[j,i]*x[1,j];
          At7[n7+1,i]:=AB7[n7+1,i]-At7[n7+1,i];
        end;
      for i:=1 to n7
      do                           {невязки уточненных корней}
        SG_FN.Cells[0,i-1]:=FloatToStr(RoundTo(At7[n7+1,i],-4));
    end;
  for i:=1 to n7
  do
    SG_T7.Cells[n7+2,i+14]:=FloatToStr(RoundTo(1+StrToFloat(SG_T7.Cells[n7+1,i+14]),-4));
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  i:Integer;
  ts:TMySet;
begin
  ts:=[];
  for i:=1 to n8
  do
    ts:=ts+[i];
  A8:=ReadMat(n8,n8,SG_A8);
  DetA8:=Determinate(A8,n8,ts,1);
  Caption:='| A | = '+FloatToStr(DetA8);
end;

procedure TForm1.B_Solve8Click(Sender: TObject);
var
  i,j,k{,col,ncol}:Integer;
  sx,chk,mx,bmx:Real;
  s:TMySet;
  Q,D,X,N,X0:TMyMat;
begin
  A8:=ReadMat(n8,n8,SG_A8);
  s:=[];
  for i:=1 to n8
  do
    begin
      A8[n8+1,i]:=StrToFloat(SG_B8.Cells[0,i-1]);
      s:=s+[i];
    end;
  e8:=StrToFloat(E_e8.Text);
  DetA8:=Determinate(A8,n8,s,1);
  if DetA8=0
  then
    begin
      ShowMessage('Матрица вырожденная');
      Exit;
    end;
  {!
  for col:=1 to n8
  do
    begin
      for i:=col to n8
      do
        if a[col,i]<>0
        then
          break;
      ncol:=i;
      if col<>ncol
      then
        A8:=RSch(A8,col,ncol,n8);
    end;
  !}
  for i:=1 to n8
  do
    begin
      Bt8[1,i]:=A8[n8+1,i]/A8[i,i];
      for j:=1 to n8
      do
        if i<>j
          then
            Al8[j,i]:=(-1)*(A8[j,i]/A8[i,i])
          else
            Al8[i,i]:=0;
    end;
  NAl8:=NOTM(Al8,n8,n8,2);
  NA8:=NOTM(A8,n8,n8,2);
  NBt8:=NOTM(Bt8,n8,1,2);
  SG_I8.Cells[0,0]:=FloatToStr(NAl8);
  if NAl8>=1
  then
    begin
      Ai8:=MatRimInv(A8,n8);
      sx:=1/sqr(NA8*n8*50);
      for i:=1 to n8
      do
        for j:=1 to n8
        do
          begin
            Q[j,i]:=sx;
            D[j,i]:=Q[j,i]-Ai8[j,i];
          end;
      Al8:=MultMat(Q,A8,n8,n8,n8);
      for i:=1 to n8
      do
        begin
          sx:=0;
          for j:=1 to n8
          do
            sx:=sx+D[j,i]*A8[n8+1,j];
         Bt8[1,i]:=sx*(-1);
        end;
      NAl8:=NOTM(Al8,n8,n8,2);
      NBt8:=NOTM(Bt8,n8,1,2);
    end;
  chk:=NBt8/(1-NAl8);
  k:=0;
  X0:=Bt8;
  repeat
    Inc(k);
    for i:=1 to n8
    do
      begin
        sx:=0;
        for j:=1 to n8
        do
          sx:=sx+Al8[j,i]*X[1,i];
        X0[1,i]:=sx+Bt8[1,i];
      end;
    X:=X0;
    chk:=chk*NAl8;
    SG_I8.ColCount:=SG_I8.ColCount+1;
    SG_I8.Cells[k,0]:=IntToStr(k);
    for i:=1 to n8
    do
      //SG_I8.Cells[k,i]:=FloatToStr(X0[1,i]);
      SG_I8.Cells[k,i]:=FloatToStr(RoundTo(X0[1,i],-9));
  until Abs(chk)<e8;
  SG_I8.ColCount:=SG_I8.ColCount-1;
  for i:=1 to n8
  do
    begin
      sx:=0;
      for j:=1 to n8
      do
        sx:=sx+A8[j,i]*X[1,j];
      N[1,i]:=RoundTo(A8[n8+1,i]-sx,-9);
      SG_X8.Cells[0,i-1]:=FloatToStr(RoundTo(X[1,i],-7));
      SG_N8.Cells[0,i-1]:=FloatToStr(RoundTo(N[1,i],-7));
      {
      N[1,i]:=A8[n8+1,i]-sx;
      SG_X8.Cells[0,i-1]:=FloatToStr(X[1,i]);
      SG_N8.Cells[0,i-1]:=FloatToStr(N[1,i]);
      }
    end;
end;

procedure TForm1.B_P8Click(Sender: TObject);
var
  A,X,R:TMyMat;
begin
  A:=ReadMat(n8,n8,SG_A8);
  X:=ReadMat(1,n8,SG_X8);
  R:=MultMat(A,X,n8,n8,1);
  WriteMat(R,1,1,1,n8,SG_P8,-2);
end;

procedure TForm1.B_Solve9Click(Sender: TObject);
var
  i,j,k:Integer;
  sx,chk:Real;
  s:TMySet;
  X,N,X0,At:TMyMat;
begin
  A9:=ReadMat(n9,n9,SG_A9);
  B9:=ReadMat(1,n9,SG_B9);
  s:=[];
  for i:=1 to n9
  do
    s:=s+[i];
  DetA9:=Determinate(A9,n9,s,1);
  if DetA9=0
  then
    begin
      ShowMessage('Матрица вырожденная');
      Exit;
    end;
  At:=TransMat(A9,n9);
  A9:=MultMat(At,A9,n9,n9,n9);
  B9:=MultMat(At,B9,n9,n9,1);
  e9:=StrToFloat(E_e9.Text);
  for i:=1 to n9
  do
    begin
      Bt9[1,i]:=B9[1,i]/A9[i,i];
      for j:=1 to n9
      do
        if i<>j
          then
            Al9[j,i]:=(-1)*(A9[j,i]/A9[i,i])
          else
            Al9[j,i]:=0;
    end;
  NAl9:=NOTM(Al9,n9,n9,2);
  NBt9:=NOTM(Bt9,n9,1,2);
  chk:=NBt9/(1-NAl9);
  k:=0;
  X0:=Bt9;
  X:=Z;
  repeat
    Inc(k);
    for i:=1 to n9
    do
      begin
        X0[1,i]:=Bt9[1,i];
        for j:=1 to i-1
        do
          X0[1,i]:=X0[1,i]+Al9[j,i]*X0[1,j];
        for j:=i to n9
        do
          X0[1,i]:=X0[1,i]+Al9[j,i]*X[1,j];
      end;
    X:=X0;
    chk:=chk*NAl9;
    SG_Z9.ColCount:=SG_Z9.ColCount+1;
    SG_Z9.Cells[k,0]:=IntToStr(k);
    for i:=1 to n9
    do
      SG_Z9.Cells[k,i]:=FloatToStr(X0[1,i]);
      //SG_Z9.Cells[k,i]:=FloatToStr(RoundTo(X0[1,i],-8));
  until chk<e9;
  SG_Z9.ColCount:=SG_Z9.ColCount-1;
  for i:=1 to n9
  do
    begin
      sx:=0;
      for j:=1 to n9
      do
        sx:=sx+A9[j,i]*X[1,j];
      {
      N[1,i]:=RoundTo(A9[n9+1,i]-sx,-9);
      SG_X9.Cells[0,i-1]:=FloatToStr(RoundTo(X[1,i],-6));
      SG_N9.Cells[0,i-1]:=FloatToStr(RoundTo(N[1,i],-6));
      }
      N[1,i]:=B9[1,i]-sx;
      SG_X9.Cells[0,i-1]:=FloatToStr(X[1,i]);
      SG_N9.Cells[0,i-1]:=FloatToStr(N[1,i]);
    end;
end;

end.
