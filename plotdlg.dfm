object FplotData: TFplotData
  Left = 0
  Top = 0
  Caption = 'FplotData'
  ClientHeight = 603
  ClientWidth = 1285
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Chart: TChart
    Left = 0
    Top = 0
    Width = 1285
    Height = 603
    View3D = False
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 448
    ExplicitTop = 200
    ExplicitWidth = 400
    ExplicitHeight = 250
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series1: TFastLineSeries
      Legend.Visible = False
      ShowInLegend = False
      LinePen.Color = 10708548
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
end
