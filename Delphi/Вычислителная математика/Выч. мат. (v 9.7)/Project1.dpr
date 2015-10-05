program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Matrix in 'Matrix.pas',
  Tri in 'Tri.pas',
  Rim in 'Rim.pas',
  Kram in 'Kram.pas',
  MatInv in 'MatInv.pas',
  MatOper in 'MatOper.pas',
  MatU in 'MatU.pas',
  Gauss in 'Gauss.pas',
  Iteratio in 'Iteratio.pas',
  Zeydel in 'Zeydel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
