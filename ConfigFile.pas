unit ConfigFile;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Inifiles;

type
  TFConfigfile = class(TForm)
  private
    Inifile: Tinifile;
  public
    procedure open;
    function ReadFloat(Section, Val: ansistring; default: real): real;
    function ReadInt(Section, Val: ansistring; default: integer): integer;
    function ReadStr(Section, Val, default: ansistring): ansistring;
  end;

var
  FConfigfile: TFConfigfile;

implementation

{$R *.dfm}
procedure TFConfigfile.open;
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

Function TFConfigfile.ReadInt(Section,Val: ansistring; default: integer): integer;
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

Function TFConfigfile.ReadFloat(Section,Val: ansistring; default: real): real;
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

Function TFConfigfile.ReadStr(Section,Val, default: ansistring): ansistring;
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



end.
