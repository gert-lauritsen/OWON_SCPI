unit Logger;

interface

uses
  System.SysUtils, System.Classes;

type
  TLogFile = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    FileName: string;
    Filepath: string;
  public
    Function NewFileName: string;
    Procedure NewFile;
    Procedure LogValue(Value: real);
  end;

var
  LogFile: TLogFile;

implementation
uses windows, forms;
{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TLogFile.DataModuleCreate(Sender: TObject);
begin
   NewFile;
end;

procedure TLogFile.LogValue(Value: real);
var
  LogFile: TextFile;
begin
  AssignFile (LogFile, Filepath+Filename);
  if FileExists (FileName) then begin
    Append (LogFile); // open existing file
    System.Writeln (LogFile, FormatDateTime('YYYY MM DD HH NN SS ZZZ',now) + ' ' + Floattostrf(Value,ffExponent,6,2));
    CloseFile (LogFile);
  end;
end;

procedure TLogFile.NewFile;
var
  LogFile: TextFile;
begin
  // prepares log file
 // Filename := ChangeFileExt (Application.Exename, '.log');
  Filename := NewFileName;
  AssignFile (LogFile, Filepath+Filename);
  if FileExists (FileName) then
    Append (LogFile) // open existing file
  else
    Rewrite (LogFile); // create a new one
  CloseFile (LogFile);
end;

function TLogFile.NewFileName: string;
begin
  Filepath:=Extractfilepath (Application.Exename);
  FileName:=FormatDateTime('YYYYMMDD_HHNNSS_ZZZ_',now)+'Instrument.log';
  Result:=filename;
end;

end.
