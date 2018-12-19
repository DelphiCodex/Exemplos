object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Client VCL'
  ClientHeight = 460
  ClientWidth = 700
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 153
    Height = 435
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = -6
    ExplicitTop = -6
    object Label1: TLabel
      Left = 16
      Top = 21
      Width = 22
      Height = 13
      Caption = 'User'
    end
    object Label2: TLabel
      Left = 16
      Top = 74
      Width = 46
      Height = 13
      Caption = 'Password'
    end
    object btnGetCountry: TButton
      Left = 16
      Top = 159
      Width = 121
      Height = 25
      Caption = 'Get Country'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnGetCountryClick
    end
    object btnGetCountry2: TButton
      Left = 16
      Top = 190
      Width = 121
      Height = 25
      Caption = 'Get Country 2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnGetCountry2Click
    end
    object edtUser: TEdit
      Left = 16
      Top = 40
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object edtPass: TEdit
      Left = 16
      Top = 93
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object btnLogin: TButton
      Left = 16
      Top = 128
      Width = 121
      Height = 25
      Caption = 'Login'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btnLoginClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 153
    Top = 0
    Width = 327
    Height = 435
    Align = alClient
    DataSource = dm.dtsCountry
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PAI_ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAI_COD_IBGE'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAI_DESCRICAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAI_SIGLA'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAI_CODIGO'
        Width = 64
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 435
    Width = 700
    Height = 25
    Align = alBottom
    TabOrder = 2
  end
  object DBGrid2: TDBGrid
    Left = 480
    Top = 0
    Width = 220
    Height = 435
    Align = alRight
    DataSource = dm.dtsCountry2
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PAI_ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAI_DESCRICAO'
        Visible = True
      end>
  end
end
