program RICKCheckConnection;

uses
  System.StartUpCopy,
  FMX.Forms,
  RICK.Check.Connection.Intefaces in 'src\RICK.Check.Connection.Intefaces.pas',
  RICK.Check.Connection in 'src\RICK.Check.Connection.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Run;
end.
