object dm: Tdm
  OldCreateOrder = False
  Height = 561
  Width = 545
  object emsCodeRage: TEMSProvider
    AndroidPush.GCMAppID = '9308718778'
    ApiVersion = '1'
    ApplicationId = 'ApplicationID'
    AppSecret = 'AppSecret'
    MasterSecret = 'MasterSecret'
    URLHost = '192.168.50.84'
    URLPort = 8080
    Left = 32
    Top = 40
  end
  object pushMessages: TBackendPush
    Provider = emsCodeRage
    Extras = <>
    Left = 136
    Top = 40
  end
end
