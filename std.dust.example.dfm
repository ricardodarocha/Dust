object frmExample: TfrmExample
  Left = 0
  Top = 0
  Caption = 'Just an example'
  ClientHeight = 104
  ClientWidth = 246
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Option: TButton
    Left = 24
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Option'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = OptionClick
  end
  object btnResult: TButton
    Left = 24
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Result'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnResultClick
  end
end
