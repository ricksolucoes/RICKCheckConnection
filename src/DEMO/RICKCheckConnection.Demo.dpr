program RICKCheckConnection.Demo;

uses
  System.StartUpCopy,
  FMX.Forms,
  RICK.Check.Connection.View.Main in 'RICK.Check.Connection.View.Main.pas' {frmDemo};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmDemo, frmDemo);
  Application.Run;
end.
