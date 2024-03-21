unit Main1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,SCPI, Vcl.ExtCtrls, inifiles,
  Vcl.Menus;

type
  TForm1 = class(TForm)
    DeBugTxt: TMemo;
    Panel1: TPanel;
    PMeas: TPanel;
    LValue: TLabel;
    Timer: TTimer;
    Menu: TPopupMenu;
    Plot: TMenuItem;
    MExit: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure MExitClick(Sender: TObject);
    procedure PlotClick(Sender: TObject);
  private
    Inifile: Tinifile;
    Inst: TSerialScpi;
    function ReadInt(Section, Val: ansistring; default: integer): integer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
uses conffile, ConfigFile, plotdlg;

Function TForm1.ReadInt(Section,Val: ansistring; default: integer): integer;
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

procedure TForm1.FormCreate(Sender: TObject);
begin
FormatSettings.DecimalSeparator:='.';
 Inst:= TSerialScpi.create(self);
 Inifile := TIniFile.Create(ChangeFileExt( Application.ExeName, '.INI' ));
 Inst.open_resource(ReadInt('OWON','COMPORT',0) );
end;

procedure TForm1.MExitClick(Sender: TObject);
begin
close;
end;

procedure TForm1.PlotClick(Sender: TObject);
begin
FplotData.show;
end;

procedure TForm1.TimerTimer(Sender: TObject);
begin
 try
   LValue.Caption:=Inst.query('MEAS1:SHOW?');
   debugtxt.Lines.Add(LValue.Caption);
   FplotData.AddValue(0,strtofloat(trim(Inst.query('MEAS?'))));
 except

 end;
end;

end.
