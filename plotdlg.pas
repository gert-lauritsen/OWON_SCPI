unit plotdlg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart, VCLTee.Series;

type
  TFplotData = class(TForm)
    Chart: TChart;
    Series1: TFastLineSeries;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    Procedure AddValue(Serie: integer; Value: real);
  end;

var
  FplotData: TFplotData;

implementation

{$R *.dfm}



procedure TFplotData.AddValue(Serie: integer; Value: real);
var
i: integer;
begin
 chart.Series[Serie].AddXY(now,Value);
 for I := 0 to chart.SeriesCount-1 do
    while chart.Series[i].XValues.Count>7200 do chart.Series[i].Delete(0);
end;

procedure TFplotData.FormCreate(Sender: TObject);
var
i: integer;
begin
  for i:=0 to Chart.SeriesCount-1 do Chart.Series[i].XValues.DateTime:=true;
  Chart.BottomAxis.DateTimeFormat := 'hh:mm:ss';
  Chart.BottomAxis.Increment := DateTimeStep[dtTenSeconds];
end;

end.
