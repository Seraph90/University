unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XPMan, Buttons, ExtCtrls;

type
  TForm1 = class(TForm)
    E_Res: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button0: TButton;
    B_Div: TButton;
    B_Mul: TButton;
    B_Minus: TButton;
    B_Plus: TButton;
    B_Eq: TButton;
    B_Sign: TButton;
    B_Dot: TButton;
    B_C: TButton;
    XPManifest1: TXPManifest;
    Timer1: TTimer;
    B_Bs: TButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    procedure ButtonNumClick(Sender: TObject);
    procedure B_CClick(Sender: TObject);
    procedure B_DotClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure B_OperClick(Sender: TObject);
    procedure B_SignClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure B_BsClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Dot:Boolean;
  S1,S2:Real;
  Oper,Symb:Char;

implementation

{$R *.dfm}

procedure TForm1.ButtonNumClick(Sender: TObject);
begin
  if Symb=Oper
  then
    begin
      E_Res.Text:='0';
      Dot:=False;
    end;
  Symb:=(Sender as TButton).Caption[1];
  if Form1.E_Res.Text='0'
  then
    Form1.E_Res.Text:=Symb
  else
    Form1.E_Res.Text:=Form1.E_Res.Text+Symb;
end;

procedure TForm1.B_CClick(Sender: TObject);
begin
  E_Res.Text:='0';
  Dot:=False;
  Symb:='C';
  Oper:=' ';
  S1:=0;
  S2:=0;
end;

procedure TForm1.B_DotClick(Sender: TObject);
begin
  if not Dot
  then
    begin
      E_Res.Text:=E_Res.Text+',';
      Dot:=True;
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Dot:=False;
  Oper:=' ';
  Symb:=' ';
end;

procedure TForm1.B_OperClick(Sender: TObject);
begin
  if Oper=' '
  then
    S1:=StrToFloat(E_Res.Text)
  else
    if (Symb in ['0'..'9',',']) or (Sender<>B_Eq)
    then
      S2:=StrToFloat(E_Res.Text);
  if Sender<>B_Eq
  then
    begin
      if (Symb in ['-','+','*','/',' ']) or (Oper=' ')
      then
        begin
          Oper:=(Sender as TButton).Caption[1];
          Symb:=Oper;
          Abort;
        end;
      Oper:=(Sender as TButton).Caption[1];
    end;
  try
    case Oper
    of
      '+':S1:=S1+S2;
      '-':S1:=S1-S2;
      '/':S1:=S1/S2;
      '*':S1:=S1*S2;
    end;
  except
    on EZeroDivide
    do
      begin
        ShowMessage('Значение не определено');
        B_CClick(Form1);
//        Form1.E_Res.Text:='Значение не определено';
//        Abort;
      end;
    on EMathError
    do
      begin
        ShowMessage('Математическая ошибка');
        B_CClick(Form1);
//        Form1.E_Res.Text:='Математическая ошибка';
//        Abort;
      end;
  else
    begin
      ShowMessage('Неизвестная ошибка');
      B_CClick(Form1);
//    Form1.E_Res.Text:='Неизвестная ошибка';
//    Abort;
    end;
  end;
  Symb:=Oper;
  E_Res.Text:=FloatToStr(S1);
end;

procedure TForm1.B_SignClick(Sender: TObject);
begin
  if E_Res.Text='0'
  then
    Abort;
  if E_Res.Text[1]<>'-'
  then
    E_Res.Text:='-'+E_Res.Text
  else
    E_Res.Text:=Copy(E_Res.Text,2,255);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Caption:=FormatDateTime('hh:mm:ss',Time);
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key
  of
    '0':Button0.Click;
    '1':Button1.Click;
    '2':Button2.Click;
    '3':Button3.Click;
    '4':Button4.Click;
    '5':Button5.Click;
    '6':Button6.Click;
    '7':Button7.Click;
    '8':Button8.Click;
    '9':Button9.Click;
    '-':B_Minus.Click;
    '+':B_Plus.Click;
    '*':B_Mul.Click;
    '/':B_Div.Click;
    ',','.':B_Dot.Click;
    #8:B_Bs.Click;
  end;
end;

procedure TForm1.B_BsClick(Sender: TObject);
begin
  if E_Res.Text='0'
  then
    Exit
  else
    if E_Res.Text[1]='-'
    then
      B_SignClick(Form1)
    else
      if Length(E_Res.Text)>1
      then
        E_Res.Text:=Copy(E_Res.Text,0,Length(E_Res.Text)-1)
      else
        B_CClick(Form1);
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  E_Res.Text:='3,141592653589793238462643383';
  if S1=0
  then
    S1:=3.141592653589793238462643383
  else
    S2:=3.141592653589793238462643383;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  try
    S1:=Sqrt(StrToFloat(E_Res.Text));
  except
    on EMathError
    do
      begin
        ShowMessage('Число меньше нуля');
        B_CClick(Form1);
      end;
  end;
  E_Res.Text:=FloatToStr(S1);
end;
procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  S1:=StrToFloat(E_Res.Text)/100;
  E_Res.Text:=FloatToStr(S1);
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
  try
    S1:=1/StrToFloat(E_Res.Text);
  except
    on EZeroDivide
    do
      begin
        ShowMessage('Значение не определено');
        B_CClick(Form1);
      end;
  end;
  E_Res.Text:=FloatToStr(S1);
end;

end.


