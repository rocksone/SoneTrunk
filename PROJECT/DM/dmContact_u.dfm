object dmContact: TdmContact
  Height = 705
  Width = 1130
  object qrySaludation: TFDQuery
    Connection = dmDatabase.FDConnection
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SizeMax = 16
        SizeMin = 16
        SourceDataType = dtByteString
        TargetDataType = dtGUID
      end>
    SQL.Strings = (
      'select '
      '    con_saludation.saludation_id,'
      '    con_saludationres.saludation,'
      '    con_saludationres.lettersalutation,'
      '    con_saludation.gender'
      ''
      'from con_saludation'
      
        '   inner join con_saludationres on (con_saludation.saludation_id' +
        ' = con_saludationres.saludation_id)'
      ''
      'where '
      '    con_saludationres.language_id = :LNG and   '
      '    con_saludation.activex = 1')
    Left = 48
    Top = 624
    ParamData = <
      item
        Name = 'LNG'
        DataType = ftInteger
        ParamType = ptInput
        Value = 32
      end>
  end
  object dsSaludation: TDataSource
    DataSet = qrySaludation
    Left = 128
    Top = 624
  end
  object qryAddressType: TFDQuery
    BeforeOpen = qryAddressTypeBeforeOpen
    Connection = dmDatabase.FDConnection
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SizeMax = 16
        SizeMin = 16
        SourceDataType = dtByteString
        TargetDataType = dtGUID
      end>
    SQL.Strings = (
      'Select AT.ICON, ATR.Title From con_AddressType AT'
      ''
      
        'INNER JOIN con_AddressTypeRes ATR ON ATR.AddressType_ID = AT.Add' +
        'ressType_ID'
      ''
      'where ATR.Language_ID = :LNG and  AT.Active ')
    Left = 24
    Top = 240
    ParamData = <
      item
        Name = 'LNG'
        DataType = ftInteger
        ParamType = ptInput
        Value = 32
      end>
  end
  object dsAddressType: TDataSource
    DataSet = qryAddressType
    Left = 120
    Top = 240
  end
  object qryLanguage: TFDQuery
    BeforeOpen = qryLanguageBeforeOpen
    Connection = dmDatabase.FDConnection
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SizeMax = 16
        SizeMin = 16
        SourceDataType = dtByteString
        TargetDataType = dtGUID
      end>
    SQL.Strings = (
      'select '
      '    geo_language.language_id,'
      ' geo_languageres.language    as Language'
      'from geo_languageres'
      
        '   inner join geo_language on (geo_languageres.iso639_1 = geo_la' +
        'nguage.iso639_1)'
      'where '
      '  geo_language.activex = 1 and '
      '  geo_languageres.language_id = :LNG'
      '')
    Left = 284
    Top = 24
    ParamData = <
      item
        Name = 'LNG'
        DataType = ftInteger
        ParamType = ptInput
        Value = 32
      end>
  end
  object dsLanguage: TDataSource
    DataSet = qryLanguage
    Left = 364
    Top = 24
  end
  object qryVendorList: TFDQuery
    BeforeOpen = qryVendorListBeforeOpen
    Connection = dmDatabase.FDConnection
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SizeMax = 16
        SizeMin = 16
        SourceDataType = dtByteString
        TargetDataType = dtGUID
      end>
    SQL.Strings = (
      'select *  from VW_CON_CONTACT_LIST'
      'where '
      'CONTACTTYPE = 0'
      'and  MANDANT_ID = :MANDANT'
      '')
    Left = 40
    Top = 79
    ParamData = <
      item
        Name = 'MANDANT'
        DataType = ftBytes
        ParamType = ptInput
        Size = 16
        Value = Null
      end>
    object qryVendorListCONTACT_ID: TGuidField
      FieldName = 'CONTACT_ID'
      Origin = 'CONTACT_ID'
      FixedChar = True
      Size = 38
    end
    object qryVendorListMANDANT_ID: TGuidField
      FieldName = 'MANDANT_ID'
      Origin = 'MANDANT_ID'
      FixedChar = True
      Size = 38
    end
    object qryVendorListMATCHCODE: TWideStringField
      FieldName = 'MATCHCODE'
      Origin = 'MATCHCODE'
      Size = 100
    end
    object qryVendorListCONTACTART: TSmallintField
      FieldName = 'CONTACTART'
      Origin = 'CONTACTART'
    end
    object qryVendorListCONTACTTYPE: TSmallintField
      FieldName = 'CONTACTTYPE'
      Origin = 'CONTACTTYPE'
    end
    object qryVendorListPURPOSE: TSmallintField
      FieldName = 'PURPOSE'
      Origin = 'PURPOSE'
    end
    object qryVendorListISO3166_1A3: TWideStringField
      FieldName = 'ISO3166_1A3'
      Origin = 'ISO3166_1A3'
      FixedChar = True
      Size = 3
    end
    object qryVendorListCONTACT: TWideStringField
      FieldName = 'CONTACT'
      Origin = 'CONTACT'
      Size = 201
    end
    object qryVendorListPOSTALCODE: TWideStringField
      FieldName = 'POSTALCODE'
      Origin = 'POSTALCODE'
      Size = 10
    end
    object qryVendorListCITY: TWideStringField
      FieldName = 'CITY'
      Origin = 'CITY'
      Size = 50
    end
    object qryVendorListSTREET1: TWideStringField
      FieldName = 'STREET1'
      Origin = 'STREET1'
      Size = 100
    end
    object qryVendorListVATIDNR: TWideStringField
      FieldName = 'VATIDNR'
      Origin = 'VATIDNR'
      Size = 40
    end
    object qryVendorListINTERNNR: TWideStringField
      FieldName = 'INTERNNR'
      Origin = 'INTERNNR'
      Size = 30
    end
    object qryVendorListEXTERNNR: TWideStringField
      FieldName = 'EXTERNNR'
      Origin = 'EXTERNNR'
      Size = 30
    end
    object qryVendorListTAXNUMBER: TWideStringField
      FieldName = 'TAXNUMBER'
      Origin = 'TAXNUMBER'
      Size = 40
    end
    object qryVendorListPROCESS: TIntegerField
      FieldName = 'PROCESS'
      Origin = 'PROCESS'
    end
    object qryVendorListSTATUX: TSmallintField
      FieldName = 'STATUX'
      Origin = 'STATUX'
    end
  end
  object dsVendorList: TDataSource
    DataSet = qryVendorList
    Left = 128
    Top = 79
  end
  object dsClientList: TDataSource
    DataSet = qryClientList
    Left = 128
    Top = 16
  end
  object qryContry: TFDQuery
    BeforeOpen = qryContryBeforeOpen
    OnNewRecord = qryContryNewRecord
    Connection = dmDatabase.FDConnection
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SizeMax = 16
        SizeMin = 16
        SourceDataType = dtByteString
        TargetDataType = dtGUID
      end>
    SQL.Strings = (
      'SELECT DISTINCT '
      '    GEO_COUNTRY.COUNTRY_ID,'
      '    GEO_COUNTRYRES.COUNTRY,'
      '    GEO_CONTINENTRES.CONTINENT'
      ''
      ' '
      'FROM GEO_COUNTRY'
      
        '  INNER JOIN GEO_COUNTRYRES ON (GEO_COUNTRY.COUNTRY_ID = GEO_COU' +
        'NTRYRES.COUNTRY_ID)'
      
        '  INNER JOIN GEO_CONTINENT ON (GEO_COUNTRY.CONTINENT_ID = GEO_CO' +
        'NTINENT.CONTINENT_ID)'
      
        '  INNER JOIN GEO_CONTINENTRES ON (GEO_CONTINENT.CONTINENT_ID = G' +
        'EO_CONTINENTRES.CONTINENT_ID)'
      ''
      'WHERE  GEO_COUNTRYRES.LANGUAGE_ID = :LNG and'
      '       GEO_CONTINENTRES.LANGUAGE_ID = :LNG and'
      '       GEO_COUNTRY.ACTIVEX = 1'
      ''
      'ORDER BY  GEO_COUNTRY.SORDER   ')
    Left = 280
    Top = 96
    ParamData = <
      item
        Name = 'LNG'
        DataType = ftInteger
        ParamType = ptInput
        Value = 32
      end>
    object qryContryCOUNTRY_ID: TFDAutoIncField
      FieldName = 'COUNTRY_ID'
      Origin = 'COUNTRY_ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryContryCOUNTRY: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'COUNTRY'
      Origin = 'COUNTRY'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryContryCONTINENT: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'CONTINENT'
      Origin = 'CONTINENT'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
  end
  object dsCountry: TDataSource
    DataSet = qryContry
    Left = 360
    Top = 96
  end
  object qryState: TFDQuery
    BeforeOpen = qryStateBeforeOpen
    Connection = dmDatabase.FDConnection
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SizeMax = 16
        SizeMin = 16
        SourceDataType = dtByteString
        TargetDataType = dtGUID
      end>
    SQL.Strings = (
      'Select *'
      'from VW_GEO_STATE_SELECT'
      '     where '
      '(COUNTRY_ID = :FCOUNTRY_ID or :FCOUNTRY_ID = 0)'
      '               ')
    Left = 280
    Top = 168
    ParamData = <
      item
        Name = 'FCOUNTRY_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 57
      end>
  end
  object dsState: TDataSource
    DataSet = qryState
    Left = 360
    Top = 168
  end
  object qryClientList: TFDQuery
    BeforeOpen = qryClientListBeforeOpen
    Connection = dmDatabase.FDConnection
    FetchOptions.AssignedValues = [evRecordCountMode]
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SizeMax = 16
        SizeMin = 16
        SourceDataType = dtByteString
        TargetDataType = dtGUID
      end>
    SQL.Strings = (
      'select *  from VW_CON_CONTACT_LIST'
      'where '
      'CONTACTTYPE = 0'
      'and  MANDANT_ID = :MANDANT'
      '')
    Left = 40
    Top = 16
    ParamData = <
      item
        Name = 'MANDANT'
        DataType = ftGuid
        ParamType = ptInput
        Value = Null
      end>
    object qryClientListCONTACT_ID: TGuidField
      FieldName = 'CONTACT_ID'
      Origin = 'CONTACT_ID'
      FixedChar = True
      Size = 38
    end
    object qryClientListMANDANT_ID: TGuidField
      FieldName = 'MANDANT_ID'
      Origin = 'MANDANT_ID'
      FixedChar = True
      Size = 38
    end
    object qryClientListMATCHCODE: TWideStringField
      FieldName = 'MATCHCODE'
      Origin = 'MATCHCODE'
      Size = 100
    end
    object qryClientListCONTACTART: TSmallintField
      FieldName = 'CONTACTART'
      Origin = 'CONTACTART'
    end
    object qryClientListCONTACTTYPE: TSmallintField
      FieldName = 'CONTACTTYPE'
      Origin = 'CONTACTTYPE'
    end
    object qryClientListPURPOSE: TSmallintField
      FieldName = 'PURPOSE'
      Origin = 'PURPOSE'
    end
    object qryClientListISO3166_1A3: TWideStringField
      FieldName = 'ISO3166_1A3'
      Origin = 'ISO3166_1A3'
      FixedChar = True
      Size = 3
    end
    object qryClientListCONTACT: TWideStringField
      FieldName = 'CONTACT'
      Origin = 'CONTACT'
      Size = 201
    end
    object qryClientListPOSTALCODE: TWideStringField
      FieldName = 'POSTALCODE'
      Origin = 'POSTALCODE'
      Size = 10
    end
    object qryClientListCITY: TWideStringField
      FieldName = 'CITY'
      Origin = 'CITY'
      Size = 50
    end
    object qryClientListSTREET1: TWideStringField
      FieldName = 'STREET1'
      Origin = 'STREET1'
      Size = 100
    end
    object qryClientListVATIDNR: TWideStringField
      FieldName = 'VATIDNR'
      Origin = 'VATIDNR'
      Size = 40
    end
    object qryClientListINTERNNR: TWideStringField
      FieldName = 'INTERNNR'
      Origin = 'INTERNNR'
      Size = 30
    end
    object qryClientListEXTERNNR: TWideStringField
      FieldName = 'EXTERNNR'
      Origin = 'EXTERNNR'
      Size = 30
    end
    object qryClientListTAXNUMBER: TWideStringField
      FieldName = 'TAXNUMBER'
      Origin = 'TAXNUMBER'
      Size = 40
    end
    object qryClientListPROCESS: TIntegerField
      FieldName = 'PROCESS'
      Origin = 'PROCESS'
    end
    object qryClientListSTATUX: TSmallintField
      FieldName = 'STATUX'
      Origin = 'STATUX'
    end
  end
  object qryTitles: TFDQuery
    BeforeOpen = qryTitlesBeforeOpen
    Connection = dmDatabase.FDConnection
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SizeMax = 16
        SizeMin = 16
        SourceDataType = dtByteString
        TargetDataType = dtGUID
      end>
    SQL.Strings = (
      'SELECT '
      '    CON_TITLE.TITLE_ID,'
      '    CON_TITLERES.TITLE'
      ''
      'FROM CON_TITLE'
      
        '   INNER JOIN CON_TITLERES ON (CON_TITLE.TITLE_ID = CON_TITLERES' +
        '.TITLE_ID)'
      'WHERE   '
      '    CON_TITLERES.LANGUAGE_ID = :LNG AND   '
      '    CON_TITLE.activex = 1')
    Left = 632
    Top = 16
    ParamData = <
      item
        Name = 'LNG'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryTitlesTITLE_ID: TFDAutoIncField
      FieldName = 'TITLE_ID'
      Origin = 'TITLE_ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryTitlesTITLE: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'TITLE'
      Origin = 'TITLE'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object dsTitles: TDataSource
    DataSet = qryTitles
    Left = 712
    Top = 16
  end
  object qryAddress: TFDQuery
    Connection = dmDatabase.FDConnection
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SizeMax = 16
        SizeMin = 16
        SourceDataType = dtByteString
        TargetDataType = dtGUID
      end>
    SQL.Strings = (
      'Select * from con_Address')
    Left = 40
    Top = 560
    object qryAddressADDRESS_ID: TGuidField
      FieldName = 'ADDRESS_ID'
      Origin = 'ADDRESS_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 38
    end
    object qryAddressCONTACT_ID: TGuidField
      FieldName = 'CONTACT_ID'
      Origin = 'CONTACT_ID'
      FixedChar = True
      Size = 38
    end
    object qryAddressADDRESSTYPE_ID: TIntegerField
      FieldName = 'ADDRESSTYPE_ID'
      Origin = 'ADDRESSTYPE_ID'
    end
    object qryAddressCOUNTRY_ID: TIntegerField
      FieldName = 'COUNTRY_ID'
      Origin = 'COUNTRY_ID'
    end
    object qryAddressPOSTALCODE_ID: TIntegerField
      FieldName = 'POSTALCODE_ID'
      Origin = 'POSTALCODE_ID'
    end
    object qryAddressPOSTALCODE: TWideStringField
      FieldName = 'POSTALCODE'
      Origin = 'POSTALCODE'
      Size = 10
    end
    object qryAddressCITY: TWideStringField
      FieldName = 'CITY'
      Origin = 'CITY'
      Size = 50
    end
    object qryAddressSTREET1: TWideStringField
      FieldName = 'STREET1'
      Origin = 'STREET1'
      Size = 100
    end
    object qryAddressSTREET2: TWideStringField
      FieldName = 'STREET2'
      Origin = 'STREET2'
      Size = 100
    end
    object qryAddressADDITIONAL: TWideStringField
      FieldName = 'ADDITIONAL'
      Origin = 'ADDITIONAL'
      Size = 200
    end
    object qryAddressSORDER: TSmallintField
      FieldName = 'SORDER'
      Origin = 'SORDER'
    end
    object qryAddressACTIVEX: TSmallintField
      FieldName = 'ACTIVEX'
      Origin = 'ACTIVEX'
      Required = True
    end
    object qryAddressUSER_CREATE_ID: TGuidField
      FieldName = 'USER_CREATE_ID'
      Origin = 'USER_CREATE_ID'
      FixedChar = True
      Size = 38
    end
    object qryAddressUSER_UPDATE_ID: TGuidField
      FieldName = 'USER_UPDATE_ID'
      Origin = 'USER_UPDATE_ID'
      FixedChar = True
      Size = 38
    end
    object qryAddressUSER_CREATE: TSQLTimeStampField
      FieldName = 'USER_CREATE'
      Origin = 'USER_CREATE'
    end
    object qryAddressUSER_UPDATE: TSQLTimeStampField
      FieldName = 'USER_UPDATE'
      Origin = 'USER_UPDATE'
    end
  end
  object dsAddress: TDataSource
    DataSet = qryAddress
    Left = 136
    Top = 560
  end
  object FDSPostalCode: TFDStoredProc
    Connection = dmDatabase.FDConnection
    StoredProcName = 'SP_GEO_GET_POSTALCODE'
    Left = 282
    Top = 250
    ParamData = <
      item
        Position = 1
        Name = 'LNG'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 1
        Name = 'LAND'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'PLZ'
        DataType = ftWideString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 3
        Name = 'POSTALCODE_ID'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 4
        Name = 'POSTALCODE'
        DataType = ftWideString
        ParamType = ptOutput
        Size = 10
      end
      item
        Position = 5
        Name = 'CITY'
        DataType = ftWideString
        ParamType = ptOutput
        Size = 50
      end
      item
        Position = 6
        Name = 'STATE_ID'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 7
        Name = 'COUNTRY_ID'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 9
        Name = 'COUNTRY'
        DataType = ftWideString
        ParamType = ptOutput
        Size = 50
      end
      item
        Position = 10
        Name = 'STATE'
        DataType = ftWideString
        ParamType = ptOutput
        Size = 50
      end>
    object FDSPostalCodePOSTALCODE_ID: TIntegerField
      FieldName = 'POSTALCODE_ID'
      Origin = 'POSTALCODE_ID'
    end
    object FDSPostalCodePOSTALCODE: TWideStringField
      FieldName = 'POSTALCODE'
      Origin = 'POSTALCODE'
      Size = 10
    end
    object FDSPostalCodeCITY: TWideStringField
      FieldName = 'CITY'
      Origin = 'CITY'
      Size = 50
    end
    object FDSPostalCodeSTATE_ID: TIntegerField
      FieldName = 'STATE_ID'
      Origin = 'STATE_ID'
    end
    object FDSPostalCodeCOUNTRY_ID: TIntegerField
      FieldName = 'COUNTRY_ID'
      Origin = 'COUNTRY_ID'
    end
    object FDSPostalCodeSTATE: TWideStringField
      FieldName = 'STATE'
      Origin = 'STATE'
      Size = 50
    end
    object FDSPostalCodeCOUNTRY: TWideStringField
      FieldName = 'COUNTRY'
      Origin = 'COUNTRY'
      Size = 50
    end
  end
  object FDQuery1: TFDQuery
    Connection = dmDatabase.FDConnection
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SizeMax = 16
        SizeMin = 16
        SourceDataType = dtByteString
        TargetDataType = dtGUID
      end>
    Left = 816
    Top = 616
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 896
    Top = 616
  end
  object FDQuery2: TFDQuery
    Connection = dmDatabase.FDConnection
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SizeMax = 16
        SizeMin = 16
        SourceDataType = dtByteString
        TargetDataType = dtGUID
      end>
    Left = 800
    Top = 528
  end
  object DataSource2: TDataSource
    DataSet = FDQuery2
    Left = 880
    Top = 528
  end
  object qryIndustry: TFDQuery
    BeforeOpen = qryIndustryBeforeOpen
    Connection = dmDatabase.FDConnection
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SizeMax = 16
        SizeMin = 16
        SourceDataType = dtByteString
        TargetDataType = dtGUID
      end>
    SQL.Strings = (
      'SELECT '
      '    CON_INDUSTRYSECTORS.INDUSTRYSECTORS_ID,'
      '    CON_INDUSTRYSECTORSRES.INDUSTRYSECTOR'
      'FROM CON_INDUSTRYSECTORS'
      
        '   INNER JOIN CON_INDUSTRYSECTORSRES ON (CON_INDUSTRYSECTORS.IND' +
        'USTRYSECTORS_ID = CON_INDUSTRYSECTORSRES.INDUSTRYSECTORS_ID)'
      'WHERE'
      '     CON_INDUSTRYSECTORSRES.language_id = :LNG and   '
      '     CON_INDUSTRYSECTORS.activex = 1   ')
    Left = 920
    Top = 120
    ParamData = <
      item
        Name = 'LNG'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryIndustryINDUSTRYSECTORS_ID: TFDAutoIncField
      FieldName = 'INDUSTRYSECTORS_ID'
      Origin = 'INDUSTRYSECTORS_ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryIndustryINDUSTRYSECTOR: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'INDUSTRYSECTOR'
      Origin = 'INDUSTRYSECTOR'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
  end
  object dsIndustry: TDataSource
    DataSet = qryIndustry
    Left = 1000
    Top = 120
  end
  object qryTaxArea: TFDQuery
    BeforeOpen = qryTaxAreaBeforeOpen
    Connection = dmDatabase.FDConnection
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SizeMax = 16
        SizeMin = 16
        SourceDataType = dtByteString
        TargetDataType = dtGUID
      end>
    SQL.Strings = (
      'SELECT '
      '    FIN_TAXAREA.TAXAREA_ID,'
      '    FIN_TAXAREARES.TAXAREA'
      'FROM FIN_TAXAREA'
      
        '   INNER JOIN FIN_TAXAREARES ON (FIN_TAXAREA.TAXAREA_ID = FIN_TA' +
        'XAREARES.TAXAREA_ID)'
      '   '
      '   '
      'where '
      '     FIN_TAXAREARES.language_id = :LNG and   '
      '     FIN_TAXAREA.activex = 1'
      '  ')
    Left = 920
    Top = 40
    ParamData = <
      item
        Name = 'LNG'
        DataType = ftInteger
        ParamType = ptInput
        Value = 32
      end>
    object qryTaxAreaTAXAREA_ID: TFDAutoIncField
      FieldName = 'TAXAREA_ID'
      Origin = 'TAXAREA_ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryTaxAreaTAXAREA: TWideStringField
      FieldName = 'TAXAREA'
      Origin = 'TAXAREA'
      Size = 40
    end
  end
  object dsTaxArea: TDataSource
    DataSet = qryTaxArea
    Left = 1000
    Top = 40
  end
  object FDQuery3: TFDQuery
    Connection = dmDatabase.FDConnection
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SizeMax = 16
        SizeMin = 16
        SourceDataType = dtByteString
        TargetDataType = dtGUID
      end>
    Left = 880
    Top = 424
  end
  object DataSource3: TDataSource
    DataSet = FDQuery3
    Left = 960
    Top = 424
  end
  object qryPostalCode: TFDQuery
    BeforeOpen = qryPostalCodeBeforeOpen
    Connection = dmDatabase.FDConnection
    FormatOptions.AssignedValues = [fvMapRules, fvSE2Null]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SizeMax = 16
        SizeMin = 16
        SourceDataType = dtByteString
        TargetDataType = dtGUID
      end>
    FormatOptions.StrsEmpty2Null = True
    SQL.Strings = (
      'SELECT '
      '    PC.POSTALCODE_ID,'
      '    PC.STATE_ID,'
      '    PC.COUNTRY_ID,'
      '    PC.POSTALCODE,'
      '    PC.CITY,'
      '    PC.LATITUDE,'
      '    PC.LONGITUDE,'
      '    GEO_COUNTRYRES.COUNTRY,'
      '    GEO_COUNTRYRES.LANGUAGE_ID,'
      '    GEO_STATE.STATE'
      'FROM GEO_POSTALCODE PC'
      
        '   INNER JOIN GEO_COUNTRY ON (PC.COUNTRY_ID = GEO_COUNTRY.COUNTR' +
        'Y_ID)'
      
        '   INNER JOIN GEO_COUNTRYRES ON (GEO_COUNTRY.COUNTRY_ID = GEO_CO' +
        'UNTRYRES.COUNTRY_ID)'
      '   INNER JOIN GEO_STATE ON (PC.STATE_ID = GEO_STATE.STATE_ID)'
      'WHERE '
      '((PC.POSTALCODE= :FCodePostal) or (:FCodePostal is null  )) and'
      '   (GEO_COUNTRYRES.LANGUAGE_ID = :LNG_ID)'
      '   and((PC.COUNTRY_ID = :FCOUNTRY_ID) or (:FCOUNTRY_ID = 0))'
      '   '
      'ORDER BY  PC.POSTALCODE  '
      '')
    Left = 280
    Top = 320
    ParamData = <
      item
        Name = 'FCODEPOSTAL'
        DataType = ftString
        ParamType = ptInput
        Size = 10
        Value = ''
      end
      item
        Name = 'LNG_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 32
      end
      item
        Name = 'FCOUNTRY_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 57
      end>
    object qryPostalCodePOSTALCODE_ID: TIntegerField
      FieldName = 'POSTALCODE_ID'
      Origin = 'POSTALCODE_ID'
    end
    object qryPostalCodeLANGUAGE_ID: TIntegerField
      FieldName = 'LANGUAGE_ID'
      Origin = 'LANGUAGE_ID'
    end
    object qryPostalCodeSTATE_ID: TIntegerField
      FieldName = 'STATE_ID'
      Origin = 'STATE_ID'
    end
    object qryPostalCodeCOUNTRY_ID: TIntegerField
      FieldName = 'COUNTRY_ID'
      Origin = 'COUNTRY_ID'
    end
    object qryPostalCodePOSTALCODE: TWideStringField
      FieldName = 'POSTALCODE'
      Origin = 'POSTALCODE'
      Size = 10
    end
    object qryPostalCodeCITY: TWideStringField
      FieldName = 'CITY'
      Origin = 'CITY'
      Size = 50
    end
    object qryPostalCodeSTATE: TWideStringField
      FieldName = 'STATE'
      Origin = 'STATE'
      Size = 50
    end
    object qryPostalCodeCOUNTRY: TWideStringField
      FieldName = 'COUNTRY'
      Origin = 'COUNTRY'
      Size = 50
    end
    object qryPostalCodeLATITUDE: TFMTBCDField
      FieldName = 'LATITUDE'
      Origin = 'LATITUDE'
      Precision = 18
      Size = 6
    end
    object qryPostalCodeLONGITUDE: TFMTBCDField
      FieldName = 'LONGITUDE'
      Origin = 'LONGITUDE'
      Precision = 18
      Size = 6
    end
  end
end
