program ServidorRestConnect;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {telaPrincipal} ,
  UDados in 'UDados.pas' {TDados: TDataModule} ,
  ofxreader in 'ofxreader.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'OutBox Connect';
  Application.CreateForm(TtelaPrincipal, telaPrincipal);
  Application.CreateForm(TTDados, TDados);
  Application.Run;

end.
