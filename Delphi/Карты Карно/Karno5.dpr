program Karno5;

uses
  Forms,
  Karno5Main in 'Karno5Main.pas' {Main};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Минимизация логических функций';
  Application.CreateForm(TMain, Main);
  Application.Run;
end.                                               `
