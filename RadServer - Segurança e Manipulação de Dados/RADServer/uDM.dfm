object dm: Tdm
  OldCreateOrder = False
  Height = 404
  Width = 582
  object connInteli: TFDConnection
    Params.Strings = (
      'Database=qualiCodex'
      'User_Name=root'
      'Password=root'
      'Port=3307'
      'DriverID=MySQL')
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtAnsiString
        TargetDataType = dtWideString
      end>
    Connected = True
    LoginPrompt = False
    Left = 56
    Top = 24
  end
  object CountryTable: TFDQuery
    CachedUpdates = True
    Connection = connInteli
    SQL.Strings = (
      'SELECT * FROM PAISES')
    Left = 56
    Top = 88
    object CountryTablePAI_ID: TIntegerField
      FieldName = 'PAI_ID'
      Origin = 'PAI_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CountryTablePAI_COD_IBGE: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'PAI_COD_IBGE'
      Origin = 'PAI_COD_IBGE'
      Size = 5
    end
    object CountryTablePAI_DESCRICAO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'PAI_DESCRICAO'
      Origin = 'PAI_DESCRICAO'
      Size = 50
    end
    object CountryTablePAI_SIGLA: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'PAI_SIGLA'
      Origin = 'PAI_SIGLA'
      Size = 5
    end
    object CountryTablePAI_CODIGO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'PAI_CODIGO'
      Origin = 'PAI_CODIGO'
      Size = 3
    end
  end
  object FDUpdateSQLCountry: TFDUpdateSQL
    Connection = connInteli
    InsertSQL.Strings = (
      'INSERT INTO inteliconn.paises'
      '(pai_cod_ibge, pai_descricao, pai_sigla, pai_codigo)'
      
        'VALUES (:new_pai_cod_ibge, :new_pai_descricao, :new_pai_sigla, :' +
        'new_pai_codigo)')
    ModifySQL.Strings = (
      'UPDATE inteliconn.paises'
      
        'SET pai_cod_ibge = :new_pai_cod_ibge, pai_descricao = :new_pai_d' +
        'escricao, '
      '  pai_sigla = :new_pai_sigla, pai_codigo = :new_pai_codigo'
      'WHERE pai_id = :old_pai_id')
    DeleteSQL.Strings = (
      'DELETE FROM inteliconn.paises'
      'WHERE pai_id = :old_pai_id')
    FetchRowSQL.Strings = (
      
        'SELECT pai_id, pai_cod_ibge, pai_descricao, pai_sigla, pai_codig' +
        'o'
      'FROM inteliconn.paises'
      'WHERE pai_id = :pai_id')
    Left = 56
    Top = 144
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Console'
    Left = 160
    Top = 24
  end
  object Country2: TFDQuery
    CachedUpdates = True
    Connection = connInteli
    SQL.Strings = (
      'SELECT PAI_ID, PAI_DESCRICAO FROM PAISES')
    Left = 280
    Top = 88
    object Country2PAI_ID: TIntegerField
      FieldName = 'PAI_ID'
      Origin = 'PAI_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Country2PAI_DESCRICAO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'PAI_DESCRICAO'
      Origin = 'PAI_DESCRICAO'
      Size = 50
    end
  end
  object FDUpdateSQLCountry2: TFDUpdateSQL
    Connection = connInteli
    InsertSQL.Strings = (
      'INSERT INTO inteliconn.paises'
      '(pai_cod_ibge, pai_descricao, pai_sigla, pai_codigo)'
      
        'VALUES (:new_pai_cod_ibge, :new_pai_descricao, :new_pai_sigla, :' +
        'new_pai_codigo)')
    ModifySQL.Strings = (
      'UPDATE inteliconn.paises'
      
        'SET pai_cod_ibge = :new_pai_cod_ibge, pai_descricao = :new_pai_d' +
        'escricao, '
      '  pai_sigla = :new_pai_sigla, pai_codigo = :new_pai_codigo'
      'WHERE pai_id = :old_pai_id')
    DeleteSQL.Strings = (
      'DELETE FROM inteliconn.paises'
      'WHERE pai_id = :old_pai_id')
    FetchRowSQL.Strings = (
      
        'SELECT pai_id, pai_cod_ibge, pai_descricao, pai_sigla, pai_codig' +
        'o'
      'FROM inteliconn.paises'
      'WHERE pai_id = :pai_id')
    Left = 280
    Top = 136
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 296
    Top = 24
  end
end
