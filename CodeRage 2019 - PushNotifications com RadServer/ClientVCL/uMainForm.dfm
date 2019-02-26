object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Client Push VCL'
  ClientHeight = 275
  ClientWidth = 579
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 166
    Width = 157
    Height = 13
    Caption = 'Enviar para o dispositivo (Token)'
  end
  object Label2: TLabel
    Left = 201
    Top = 228
    Width = 51
    Height = 13
    Caption = 'Mensagem'
  end
  object memDados: TMemo
    AlignWithMargins = True
    Left = 10
    Top = 10
    Width = 559
    Height = 105
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Align = alTop
    TabOrder = 0
    WordWrap = False
  end
  object edtTokenUser: TEdit
    Left = 12
    Top = 182
    Width = 559
    Height = 21
    TabOrder = 1
  end
  object btnSendPush: TButton
    Left = 10
    Top = 209
    Width = 185
    Height = 56
    Caption = 'Envia Mensagem Push'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnSendPushClick
  end
  object btnUsers: TButton
    Left = 10
    Top = 121
    Width = 194
    Height = 34
    Caption = 'Devices Conectados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnUsersClick
  end
  object edtMensagem: TEdit
    Left = 201
    Top = 244
    Width = 368
    Height = 21
    TabOrder = 4
  end
  object EMSEdgeService1: TEMSEdgeService
    ModuleVersion = '1'
    Left = 616
    Top = 16
  end
end
