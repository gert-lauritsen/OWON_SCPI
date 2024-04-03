object Func: TFunc
  Left = 0
  Top = 0
  Caption = 'Functions'
  ClientHeight = 135
  ClientWidth = 182
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Bvdc: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'DC Volt'
    TabOrder = 0
    OnClick = BvdcClick
  end
  object Bvac: TButton
    Left = 8
    Top = 39
    Width = 75
    Height = 25
    Caption = 'AC Volt'
    TabOrder = 1
    OnClick = BvacClick
  end
  object BcurrAC: TButton
    Left = 8
    Top = 70
    Width = 75
    Height = 25
    Caption = 'AC Amps'
    TabOrder = 2
    OnClick = BcurrACClick
  end
  object BDCAmps: TButton
    Left = 8
    Top = 101
    Width = 75
    Height = 25
    Caption = 'DC Amps'
    TabOrder = 3
    OnClick = BDCAmpsClick
  end
  object BFreq: TButton
    Left = 89
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Frequency'
    TabOrder = 4
    OnClick = BFreqClick
  end
  object BPER: TButton
    Left = 89
    Top = 39
    Width = 75
    Height = 25
    Caption = 'Periode'
    TabOrder = 5
    OnClick = BPERClick
  end
  object BDIODE: TButton
    Left = 89
    Top = 70
    Width = 75
    Height = 25
    Caption = 'Diode'
    TabOrder = 6
    OnClick = BDIODEClick
  end
  object BCONT: TButton
    Left = 89
    Top = 101
    Width = 75
    Height = 25
    Caption = 'Continuity'
    TabOrder = 7
    OnClick = BCONTClick
  end
end
