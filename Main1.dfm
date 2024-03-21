object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'OWON'
  ClientHeight = 205
  ClientWidth = 347
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = Menu
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DeBugTxt: TMemo
    Left = 98
    Top = 0
    Width = 249
    Height = 205
    Align = alRight
    Lines.Strings = (
      'DeBugTxt')
    TabOrder = 0
    Visible = False
    ExplicitLeft = 504
    ExplicitHeight = 371
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 345
    Height = 205
    Align = alLeft
    Color = clNavy
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = -8
    ExplicitHeight = 278
    object PMeas: TPanel
      Left = 2
      Top = 33
      Width = 343
      Height = 128
      Caption = 'PMeas'
      Color = clBackground
      ParentBackground = False
      TabOrder = 0
      object LValue: TLabel
        Left = 40
        Top = 32
        Width = 127
        Height = 52
        Caption = 'LValue'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -43
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object Timer: TTimer
    Interval = 500
    OnTimer = TimerTimer
    Left = 368
    Top = 144
  end
  object Menu: TPopupMenu
    Left = 202
    Top = 145
    object Plot: TMenuItem
      Caption = 'Plot'
      OnClick = PlotClick
    end
    object MExit: TMenuItem
      Caption = 'Exit'
      OnClick = MExitClick
    end
  end
end
