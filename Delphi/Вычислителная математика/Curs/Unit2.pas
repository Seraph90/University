unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    B_1: TButton;
    B_2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure B_1Click(Sender: TObject);
    procedure B_2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm2.B_1Click(Sender: TObject);
begin
  case frm
  of
    1:begin
        g:=1;
        Form1.E_X0.Text:='0,4';
        Form1.E_Y0.Text:='-0,75';
      end;
    2:begin
        h:=1;
        Form1.E_X02.Text:='0,4';
        Form1.E_Y02.Text:='-0,75';
      end;
  end;
  Form2.Close;
end;

procedure TForm2.B_2Click(Sender: TObject);
begin
  case frm
  of
    1:begin
        g:=3;
        Form1.E_X0.Text:='3,4';
        Form1.E_Y0.Text:='2,3';
      end;
    2:begin
        h:=3;
        Form1.E_X02.Text:='3,4';
        Form1.E_Y02.Text:='2,3';
      end;
  end;
  Form2.Close;
end;

end.
