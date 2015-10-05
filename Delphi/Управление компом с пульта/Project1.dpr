program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  ConTroller in 'ConTroller.pas',
  PortUnit in 'PortUnit.pas',
  UPort in 'UPort.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.ShowMainForm:=False;
  Application.CreateForm(TForm1, Form1);
  Form1.FormActivate(Form1);
  Application.Run;
end.
