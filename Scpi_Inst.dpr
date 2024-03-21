program Scpi_Inst;

uses
  Vcl.Forms,
  Main1 in 'Main1.pas' {Form1},
  SCPI in 'SCPI.pas' {SerialScpi: TDataModule},
  ConfigFile in 'ConfigFile.pas' {FConfigfile},
  plotdlg in 'plotdlg.pas' {FplotData};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFConfigfile, FConfigfile);
  Application.CreateForm(TFplotData, FplotData);
  //Application.CreateForm(TSerialScpi, SerialScpi);
  Application.Run;
end.
