unit confFile;

interface

uses
  System.SysUtils, System.Classes,Inifiles;

type
  TReadConf = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    Inifile: Tinifile;
  public
    function ReadFloat(Section, Val: ansistring; default: real): real;
    function ReadInt(Section, Val: ansistring; default: integer): integer;
    function ReadStr(Section, Val, default: ansistring): ansistring;
    procedure open;
  end;

var
  Ini: TReadConf;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}
uses forms,Dialogs;

Function TReadConf.ReadInt(Section,Val: ansistring; default: integer): integer;
var StrVar: ansistring;
begin
 try
   StrVar:=inifile.ReadString(Section,val,inttostr(default));
   if pos('//',StrVar)>0 then StrVar:=trim(copy(StrVar,1,pos('///',StrVar)-1)) else StrVar:=trim(StrVar);
   result:=strtoint(StrVar);
 except
   result:=default;
 end;
end;

procedure TReadConf.DataModuleDestroy(Sender: TObject);
begin
 inifile.Free;
end;

procedure TReadConf.open;
var
  filename: string;
begin
try
 filename:=    ChangeFileExt( Application.ExeName, '.INI' );
 if fileexists(filename) then
   Inifile := TIniFile.Create(filename)
 else
   showmessage('No inifile');
except
  showmessage('Error reading inifile');
end;
end;

Function TReadConf.ReadFloat(Section,Val: ansistring; default: real): real;
var StrVar: ansistring;
begin
 try
   StrVar:=inifile.ReadString(Section,val,floattostr(default));
   if pos('//',StrVar)>0 then StrVar:=trim(copy(StrVar,1,pos('///',StrVar)-1)) else StrVar:=trim(StrVar);
   result:=strtofloat(StrVar);
 except
   result:=default;
 end;
end;

Function TReadConf.ReadStr(Section,Val, default: ansistring): ansistring;
var StrVar: ansistring;
begin
 try
   StrVar:=inifile.ReadString(Section,val,default);
   if pos('//',StrVar)>0 then StrVar:=trim(copy(StrVar,1,pos('///',StrVar)-1)) else StrVar:=trim(StrVar);
   result:=StrVar;
 except
   result:=default;
 end;
end;

procedure TReadConf.DataModuleCreate(Sender: TObject);
begin
//Inifile := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
end;

end.
