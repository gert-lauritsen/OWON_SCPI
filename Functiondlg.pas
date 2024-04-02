unit Functiondlg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFunc = class(TForm)
    Bvdc: TButton;
    Bvac: TButton;
    BcurrAC: TButton;
    BDCAmps: TButton;
    BFreq: TButton;
    BPER: TButton;
    BDIODE: TButton;
    BCONT: TButton;
    procedure BvdcClick(Sender: TObject);
    procedure BvacClick(Sender: TObject);
    procedure BcurrACClick(Sender: TObject);
    procedure BDCAmpsClick(Sender: TObject);
    procedure BFreqClick(Sender: TObject);
    procedure BDIODEClick(Sender: TObject);
    procedure BPERClick(Sender: TObject);
    procedure BCONTClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Func: TFunc;

implementation

{$R *.dfm}
uses SCPI;

procedure TFunc.BCONTClick(Sender: TObject);
begin
 Inst.query('CONF:CONT');
end;

procedure TFunc.BcurrACClick(Sender: TObject);
begin
 Inst.query('CONF:CURR:AC auto');
end;

procedure TFunc.BDCAmpsClick(Sender: TObject);
begin
 Inst.query('CONF:CURR:DC auto');

end;

procedure TFunc.BDIODEClick(Sender: TObject);
begin
 Inst.query('CONF:DIOD');
end;

procedure TFunc.BFreqClick(Sender: TObject);
begin
  Inst.query('CONF:FREQ');
end;

procedure TFunc.BPERClick(Sender: TObject);
begin
 Inst.query('CONF:PER');
end;

procedure TFunc.BvacClick(Sender: TObject);
begin
 Inst.query('CONF:VOLT:AC auto');
end;

procedure TFunc.BvdcClick(Sender: TObject);
begin
 Inst.query('CONF:VOLT:DC auto');
end;

end.
