unit SCPI;

interface

uses
  System.SysUtils, System.Classes, VaClasses, VaComm;

type
  TSerialScpi = class(TDataModule)
    Comm: TVaComm;
    procedure CommRxChar(Sender: TObject; Count: Integer);
    procedure DataModuleDestroy(Sender: TObject);
  private
    InBuffer: AnsiString;
    NewRxLine: boolean;
    Function PortBaud(Baudrate: integer): TVaBaudrate;
    Function ChangeSymbol(Str: AnsiString): Ansistring;
  public
    function open_resource(comport: integer; Baudrate: integer = 115200): boolean;
    procedure write(S:AnsiString);
    function query(cmd: AnsiString): ansistring;
  end;

var
  SerialScpi: TSerialScpi;
  Inst: TSerialScpi;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
 uses windows, forms;
{$R *.dfm}
const
CR = #13;
timeout=1000;
Ohm = chr($a6)+chr($b8);
micro = chr($aa)+chr($cc);
grader = chr($a1)+chr($e6);
farent = chr($a8)+chr($48);

function TSerialScpi.ChangeSymbol(Str: AnsiString): Ansistring;
begin
 if pos(micro,str)>0 then begin
   setlength(str,length(str)-3);
   str:=str+'µ';
 end;
 if pos(grader,str)>0 then begin
   setlength(str,length(str)-3);
   str:=str+'°C';
 end;
 if pos(Ohm,str)>0 then begin
   setlength(str,length(str)-3);
   str:=str+'';
 end;
 if pos(farent,str)>0 then begin
   setlength(str,length(str)-3);
   str:=str+'°F';
 end;
 result:=str;
end;

procedure TSerialScpi.CommRxChar(Sender: TObject; Count: Integer);
var
i: integer;
ch: ansichar;
begin
 for i:=1 to count do begin
  Comm.ReadChar(ch);
  if ch<>CR then
  InBuffer:=InBuffer+ch;
  if ch=CR then
    NewRxLine:=true;

 end;

end;

procedure TSerialScpi.DataModuleDestroy(Sender: TObject);
begin
 Comm.Close;
end;

function TSerialScpi.open_resource(comport, Baudrate: integer): boolean;
begin
 result:=true;
   try
    Comm.Close;
    Comm.Baudrate:=PortBaud(Baudrate);
    Comm.PortNum:=comport;
    Comm.Open;
   Except
    result:=false;
   end;
end;

function TSerialScpi.PortBaud(Baudrate: integer): TVaBaudrate;
begin
 case Baudrate of
  9600: result:= br9600;
  14400: result:= br14400;
  19200: result:= br19200;
  38400: result:= br38400;
  56000: result:= br56000;
  57600: result:= br57600;
  115200: result:= br115200;
  128000: result:= br128000;
  256000: result:= br256000;
  else result:=br115200;
 end;
end;

function TSerialScpi.query(cmd: AnsiString): ansistring;
var TimeStart: LongWord;
begin
  write(cmd);
  TimeStart:=GetTickCount ;//wait for respons...
  while ((GetTickCount-TimeStart)<timeout) and (not NewRxLine) do begin
    application.processmessages;
  end;
  if NewRxLine then begin

  result:=ChangeSymbol(InBuffer);
  end
  else result:='';
  InBuffer:='';
end;

procedure TSerialScpi.write(S: AnsiString);
begin
  NewRxLine:=false;
  Comm.WriteText(s+CR);
end;

end.
