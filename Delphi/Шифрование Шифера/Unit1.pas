unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  TForm1 = class(TForm)
    SG_C: TStringGrid;
    E_PC: TEdit;
    B_FT: TButton;
    B_C: TButton;
    B_DC: TButton;
    E_T: TEdit;
    E_C: TEdit;
    E_DC: TEdit;
    procedure B_FTClick(Sender: TObject);
    procedure B_CClick(Sender: TObject);
    procedure B_DCClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  x, y: Array['A'..'Z'] of Byte;

implementation

{$R *.dfm}

procedure TForm1.B_FTClick(Sender: TObject);
var
  s, ns: String;
  i, j: Integer;
  c: Char;
  Letters: Set of Char;
begin
  Letters:=['A'..'Z']-['Q'];
  s:=UpperCase(E_PC.Text);
  ns:='';
  j:=1;
  while j<=Length(s)
  do
    begin
      if s[j] in Letters
      then
        begin
          ns:=ns+s[j];
          Letters:=Letters-[s[j]];
        end;
      Inc(j);
    end;
  for c:='A' to 'Z'
  do
    if c in Letters
    then
      begin
        ns:=ns+c;
        Letters:=Letters-[c];
      end;
  for i:=1 to 25
  do
    begin
    end;
  for i:=1 to 5
  do
    for j:=1 to 5
    do
      begin
        SG_C.Cells[i-1, j-1]:=ns[i+(j-1)*5];
        x[ns[i+(j-1)*5]]:=i-1;
        y[ns[i+(j-1)*5]]:=j-1;
      end;
end;

procedure TForm1.B_CClick(Sender: TObject);
var
  s, ns: String;
  i, j: Integer;
begin
  s:=UpperCase(E_T.Text);
  j:=1;
  for i:=1 to Length(s)
  do
    if s[i]<>' '
    then
      begin
        SetLength(ns,Length(ns)+1);
        ns[j]:=s[i];
        Inc(j);
      end;
  s:=UpperCase(ns);
  i:=1;
  ns:='';
  while i<Length(s)
  do
    begin
      if s[i]=s[i+1]
      then
        begin
          ns:=ns+s[i]+'X';
          Inc(i);
        end
      else
        begin
          ns:=ns+s[i]+s[i+1];
          Inc(i,2);
        end;
    end;
  if i=Length(s)
  then
    begin
      ShowMessage('Achung!!!');
      Abort;
    end;
  s:=ns;
  ns:='';
  for i:=1 to (Length(s) div 2)
  do
    begin
      if (x[s[2*i-1]]<>x[s[2*i]]) and (y[s[2*i-1]]<>y[s[2*i]])
      then
        ns:=ns+SG_C.Cells[x[s[2*i]], y[s[2*i-1]]]+SG_C.Cells[x[s[2*i-1]], y[s[2*i]]]
      else
        if x[s[2*i-1]]=x[s[2*i]]
        then
          ns:=ns+SG_C.Cells[x[s[2*i]],(y[s[2*i-1]]+1) mod 5]+SG_C.Cells[x[s[2*i]],(y[s[2*i]]+1) mod 5]
        else
          ns:=ns+SG_C.Cells[(x[s[2*i-1]]+1) mod 5, y[s[2*i-1]]]+SG_C.Cells[(x[s[2*i]]+1) mod 5, y[s[2*i]]];
    end;
  E_C.Text:=ns;
end;

procedure TForm1.B_DCClick(Sender: TObject);
var
  s, ns: String;
  i, j: Integer;
begin
  s:=E_C.Text;
  ns:='';
  for i:=1 to (Length(s) div 2)
  do
    begin
      if (x[s[2*i-1]]<>x[s[2*i]]) and (y[s[2*i-1]]<>y[s[2*i]])
      then
        ns:=ns+SG_C.Cells[x[s[2*i]], y[s[2*i-1]]]+SG_C.Cells[x[s[2*i-1]], y[s[2*i]]]
      else
        if x[s[2*i-1]]=x[s[2*i]]
        then
          ns:=ns+SG_C.Cells[x[s[2*i]],(y[s[2*i-1]]+4) mod 5]+SG_C.Cells[x[s[2*i]],(y[s[2*i]]+4) mod 5]
        else
          ns:=ns+SG_C.Cells[(x[s[2*i-1]]+4) mod 5, y[s[2*i-1]]]+SG_C.Cells[(x[s[2*i]]+4) mod 5, y[s[2*i]]];
    end;
  E_DC.Text:=ns;
end;

end.
