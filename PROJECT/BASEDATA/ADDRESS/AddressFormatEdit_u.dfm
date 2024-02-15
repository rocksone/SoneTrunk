inherited frmAddressFormatEdit: TfrmAddressFormatEdit
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmAddressFormatEdit'
  ClientHeight = 345
  ClientWidth = 776
  OnCloseQuery = FormCloseQuery
  ExplicitWidth = 790
  ExplicitHeight = 385
  TextHeight = 13
  inherited pnlTop: TdxPanel
    Width = 776
    ExplicitWidth = 772
    inherited lbFormTitle: TcxLabel
      AnchorY = 20
    end
    object btnAddRes: TcxButton
      Left = 560
      Top = 8
      Width = 221
      Height = 25
      Caption = 'Fehlende Spachen hinzuf'#252'gen'
      OptionsImage.ImageIndex = 12
      OptionsImage.Images = dmStyle.imlButtons
      SpeedButtonOptions.CanBeFocused = False
      TabOrder = 1
      Visible = False
    end
  end
  inherited pnlBotton: TdxPanel
    Top = 305
    Width = 776
    TabOrder = 2
    ExplicitTop = 304
    ExplicitWidth = 772
    inherited btnCancel: TcxButton
      Left = 645
      ExplicitLeft = 641
    end
    inherited btnOK: TcxButton
      Left = 514
      ExplicitLeft = 510
    end
  end
  object cxGroupBox1: TcxGroupBox [2]
    AlignWithMargins = True
    Left = 3
    Top = 43
    Align = alClient
    Caption = 'Anrede'
    ParentBackground = False
    ParentColor = False
    Style.Color = clWhite
    Style.TransparentBorder = True
    TabOrder = 1
    ExplicitWidth = 766
    ExplicitHeight = 258
    DesignSize = (
      770
      259)
    Height = 259
    Width = 770
    object lbGENDER: TcxLabel
      Left = 15
      Top = 25
      AutoSize = False
      Caption = ' Land'
      ParentColor = False
      Style.StyleController = dmStyle.styleLabel
      Properties.Alignment.Vert = taVCenter
      Height = 21
      Width = 150
      AnchorY = 36
    end
    object lbACTIVEX: TcxLabel
      Left = 15
      Top = 227
      AutoSize = False
      Caption = ' Aktiv'
      ParentColor = False
      Style.StyleController = dmStyle.styleLabel
      Properties.Alignment.Vert = taVCenter
      Height = 21
      Width = 150
      AnchorY = 238
    end
    object cxDBImageComboBox1: TcxDBImageComboBox
      Left = 171
      Top = 227
      RepositoryItem = dmStyle.icbActive
      DataBinding.DataField = 'ACTIVEX'
      DataBinding.DataSource = dsList
      Properties.ImmediatePost = True
      Properties.Items = <>
      TabOrder = 7
      Width = 85
    end
    object cxLabel1: TcxLabel
      Left = 15
      Top = 52
      AutoSize = False
      Caption = ' Beschreibung'
      ParentColor = False
      Style.StyleController = dmStyle.styleLabel
      Properties.Alignment.Vert = taVCenter
      Height = 21
      Width = 150
      AnchorY = 63
    end
    object edSTREET1: TcxDBTextEdit
      Left = 171
      Top = 53
      DataBinding.DataField = 'DESCRIPTION'
      DataBinding.DataSource = dsList
      Style.StyleController = dmStyle.stylecEdit
      TabOrder = 4
      Width = 368
    end
    object LB_Formula: TcxMCListBox
      AlignWithMargins = True
      Left = 546
      Top = 52
      Width = 212
      Height = 195
      Margins.Top = 34
      Margins.Right = 10
      Margins.Bottom = 10
      TabStop = False
      Align = alRight
      HeaderSections = <
        item
          Text = 'Descripci'#243'n'
          Width = 88
        end
        item
          AllowResize = False
          Text = 'Variable'
          Width = 125
        end>
      Items.Strings = (
        'Direccion1;$ADR1$'
        'Direccion2;$ADR2$'
        'Codigo postal;$PC$'
        'Ciudad;$CITY$'
        'Distrito;$DISTRICT$'
        'Provincia;$PROVINCE$'
        'Departamento;$DEPARTMENT$'
        'Pais;$COUNTY$')
      ShowHeader = False
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 3
      OnDblClick = LB_FormulaDblClick
      ExplicitLeft = 542
      ExplicitHeight = 194
    end
    object DBE_Memo: TcxDBRichEdit
      Left = 15
      Top = 79
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'ADDRESSFORMAT'
      DataBinding.DataSource = dsList
      Properties.PlainText = True
      Properties.ScrollBars = ssVertical
      Style.LookAndFeel.NativeStyle = True
      Style.StyleController = dmStyle.stylecEdit
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      StyleReadOnly.LookAndFeel.NativeStyle = True
      TabOrder = 5
      ExplicitWidth = 516
      Height = 142
      Width = 520
    end
    object cbbCOUNTRY_ID: TcxDBLookupComboBox
      Left = 171
      Top = 25
      DataBinding.DataField = 'COUNTRY_ID'
      DataBinding.DataSource = dsList
      Properties.KeyFieldNames = 'COUNTRY_ID'
      Properties.ListColumns = <
        item
          FieldName = 'COUNTRY'
        end>
      Properties.ListSource = dsCountry
      Style.StyleController = dmStyle.stylecEdit
      TabOrder = 1
      Width = 140
    end
  end
  inherited asTab: TJvEnterAsTab
    Top = 212
  end
  object qryList: TFDQuery
    BeforeOpen = qryListBeforeOpen
    Connection = dmDatabase.FDConnection
    UpdateOptions.KeyFields = 'ADDRESSFORMAT_ID'
    SQL.Strings = (
      'SELECT '
      '   ADDRESSFORMAT_ID,'
      '   COUNTRY_ID,'
      '   DESCRIPTION,'
      '   ADDRESSFORMAT,'
      '   ACTIVEX'
      ''
      'FROM CON_ADDRESSFORMAT'
      'WHERE ADDRESSFORMAT_ID = :ID  ')
    Left = 136
    Top = 210
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryListADDRESSFORMAT_ID: TFDAutoIncField
      FieldName = 'ADDRESSFORMAT_ID'
      Origin = 'ADDRESSFORMAT_ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryListCOUNTRY_ID: TIntegerField
      FieldName = 'COUNTRY_ID'
      Origin = 'COUNTRY_ID'
    end
    object qryListDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Origin = 'DESCRIPTION'
      Size = 100
    end
    object qryListADDRESSFORMAT: TWideStringField
      FieldName = 'ADDRESSFORMAT'
      Origin = 'ADDRESSFORMAT'
      Size = 500
    end
    object qryListACTIVEX: TSmallintField
      AutoGenerateValue = arAutoInc
      FieldName = 'ACTIVEX'
      Origin = 'ACTIVEX'
      Required = True
    end
  end
  object dsList: TDataSource
    DataSet = qryList
    Left = 176
    Top = 207
  end
  object FDS: TFDStoredProc
    Connection = dmDatabase.FDConnection
    StoredProcName = 'SP_SYS_ADD_MISSINGRES_LNG'
    Left = 77
    Top = 208
    ParamData = <
      item
        Position = 1
        Name = 'TABLENAME'
        DataType = ftWideString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 2
        Name = 'FIELDNAME'
        DataType = ftWideString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 3
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qryContry: TFDQuery
    BeforeOpen = qryContryBeforeOpen
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
      'ORDER BY  GEO_COUNTRY.SORDER, GEO_COUNTRYRES.COUNTRY   ')
    Left = 232
    Top = 208
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
    Left = 312
    Top = 208
  end
end
