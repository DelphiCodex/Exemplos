object dm: Tdm
  OldCreateOrder = False
  Height = 561
  Width = 545
  object emsCodeRage: TEMSProvider
    AndroidPush.GCMAppID = '330409365884'
    ApiVersion = '1'
    ApplicationId = 'ApplicationID'
    AppSecret = 'AppSecret'
    MasterSecret = 'MasterSecret'
    URLHost = '192.168.50.84'
    URLPort = 8080
    Left = 56
    Top = 104
  end
  object pushMessages: TBackendPush
    Provider = emsCodeRage
    Extras = <>
    Left = 152
    Top = 104
  end
end
