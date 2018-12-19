object dm: Tdm
  OldCreateOrder = False
  Height = 561
  Width = 545
  object emsProvider: TEMSProvider
    ApiVersion = '1'
    ApplicationId = 'IntensiveDelphi'
    AppSecret = 'AppIntensive'
    MasterSecret = 'Master'
    LoginResource = 'Users'
    URLHost = '192.168.0.9'
    URLPort = 8080
    Left = 64
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 160
    Top = 24
  end
  object autAcademy: TBackendAuth
    Provider = emsProvider
    LoginPrompt = False
    UserDetails = <>
    DefaultAuthentication = Application
    OnLoggingIn = autAcademyLoggingIn
    Left = 64
    Top = 80
  end
  object endpCountryGET: TBackendEndpoint
    Provider = emsProvider
    Auth = autAcademy
    Params = <>
    Resource = 'country'
    Response = respCountry
    Left = 72
    Top = 160
  end
  object endpCountryACT: TBackendEndpoint
    Provider = emsProvider
    Auth = autAcademy
    Method = rmPOST
    Params = <>
    Resource = 'country'
    Response = respCountry
    Left = 168
    Top = 160
  end
  object respCountry: TRESTResponse
    ContentType = 'application/x-javascript'
    Left = 72
    Top = 256
  end
  object rdsaCountry: TRESTResponseDataSetAdapter
    Dataset = mtbCountry
    FieldDefs = <>
    ResponseJSON = respCountry
    Left = 72
    Top = 312
  end
  object mtbCountry: TFDMemTable
    BeforePost = mtbCountryBeforePost
    AfterPost = mtbCountryAfterPost
    AfterDelete = mtbCountryAfterDelete
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 72
    Top = 368
    object mtbCountryPAI_ID: TIntegerField
      FieldName = 'PAI_ID'
      Origin = 'PAI_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object mtbCountryPAI_COD_IBGE: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'PAI_COD_IBGE'
      Origin = 'PAI_COD_IBGE'
      Size = 5
    end
    object mtbCountryPAI_DESCRICAO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'PAI_DESCRICAO'
      Origin = 'PAI_DESCRICAO'
      Size = 50
    end
    object mtbCountryPAI_SIGLA: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'PAI_SIGLA'
      Origin = 'PAI_SIGLA'
      Size = 5
    end
    object mtbCountryPAI_CODIGO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'PAI_CODIGO'
      Origin = 'PAI_CODIGO'
      Size = 3
    end
  end
  object dtsCountry: TDataSource
    DataSet = mtbCountry
    Left = 72
    Top = 424
  end
  object endpCountry2GET: TBackendEndpoint
    Provider = emsProvider
    Auth = autAcademy
    Params = <>
    Resource = 'country2'
    Response = respCountry2
    Left = 336
    Top = 160
  end
  object endpCountry2CT: TBackendEndpoint
    Provider = emsProvider
    Auth = autAcademy
    Method = rmPOST
    Params = <>
    Resource = 'country2'
    Response = respCountry2
    Left = 433
    Top = 160
  end
  object respCountry2: TRESTResponse
    ContentType = 'application/json'
    ContentEncoding = 'UTF-8'
    Left = 336
    Top = 256
  end
  object rdsaCountry2: TRESTResponseDataSetAdapter
    Dataset = mtbCountry2
    FieldDefs = <>
    ResponseJSON = respCountry2
    Left = 337
    Top = 312
  end
  object mtbCountry2: TFDMemTable
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 336
    Top = 368
    object mtbCountry2PAI_ID: TIntegerField
      FieldName = 'PAI_ID'
      Origin = 'PAI_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object mtbCountry2PAI_DESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PAI_DESCRICAO'
      Origin = 'PAI_DESCRICAO'
      Size = 50
    end
  end
  object dtsCountry2: TDataSource
    DataSet = mtbCountry2
    Left = 337
    Top = 424
  end
  object usrUsers: TBackendUsers
    Provider = emsProvider
    Auth = autAcademy
    Left = 336
    Top = 40
  end
  object pushMessages: TBackendPush
    Provider = emsProvider
    Auth = autAcademy
    Extras = <>
    Left = 424
    Top = 40
  end
end
