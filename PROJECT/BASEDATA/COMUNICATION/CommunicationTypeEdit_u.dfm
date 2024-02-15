inherited frmCommunicationEdit: TfrmCommunicationEdit
  Caption = 'frmCommunicationEdit'
  ClientHeight = 501
  ClientWidth = 780
  OnCloseQuery = FormCloseQuery
  ExplicitWidth = 794
  ExplicitHeight = 541
  TextHeight = 13
  inherited pnlTop: TdxPanel
    Width = 780
    ExplicitWidth = 776
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
      OnClick = btnAddResClick
    end
  end
  inherited pnlBotton: TdxPanel
    Top = 461
    Width = 780
    TabOrder = 3
    ExplicitTop = 460
    ExplicitWidth = 776
    inherited btnCancel: TcxButton
      Left = 649
      ExplicitLeft = 645
    end
    inherited btnOK: TcxButton
      Left = 518
      ExplicitLeft = 514
    end
  end
  object GDRES: TcxGrid [2]
    AlignWithMargins = True
    Left = 3
    Top = 239
    Width = 774
    Height = 219
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitWidth = 770
    ExplicitHeight = 218
    object TVRES: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      FindPanel.InfoText = 'Geben Sie Text f'#252'r die Suche ein...'
      FindPanel.Layout = fplCompact
      ScrollbarAnnotations.CustomAnnotations = <>
      OnCellClick = TVRESCellClick
      DataController.DataSource = dsRes
      DataController.DetailKeyFieldNames = 'GROUP_ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.DataRowHeight = 25
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 30
      Styles.HotTrack = dmStyle.gdIncSearch
      Styles.StyleSheet = dmStyle.GDTV
      object TVRESCOMUNICATIONTYPERES_ID: TcxGridDBColumn
        DataBinding.FieldName = 'COMUNICATIONTYPERES_ID'
        Width = 161
      end
      object TVRESCOMUNICATIONTYPE_ID: TcxGridDBColumn
        DataBinding.FieldName = 'COMUNICATIONTYPE_ID'
        Width = 140
      end
      object TVRESLANGUAGE_ID: TcxGridDBColumn
        DataBinding.FieldName = 'LANGUAGE'
        Width = 189
      end
      object TVRESCOMUNICATIONTYPE: TcxGridDBColumn
        DataBinding.FieldName = 'COMUNICATIONTYPE'
        Width = 282
      end
    end
    object LVRES: TcxGridLevel
      GridView = TVRES
    end
  end
  object cxGroupBox1: TcxGroupBox [3]
    AlignWithMargins = True
    Left = 3
    Top = 43
    Align = alTop
    Caption = 'Anrede'
    ParentBackground = False
    ParentColor = False
    Style.Color = clWhite
    Style.TransparentBorder = True
    TabOrder = 1
    ExplicitWidth = 770
    Height = 190
    Width = 774
    object lbGENDER: TcxLabel
      Left = 15
      Top = 25
      AutoSize = False
      Caption = ' Icon'
      ParentColor = False
      Style.StyleController = dmStyle.styleLabel
      Properties.Alignment.Vert = taVCenter
      Height = 21
      Width = 150
      AnchorY = 36
    end
    object icbGENDER: TcxDBImageComboBox
      Left = 171
      Top = 25
      RepositoryItem = dmStyle.icbCommunicationType
      DataBinding.DataField = 'ICON'
      DataBinding.DataSource = dsList
      Properties.ImmediatePost = True
      Properties.Items = <>
      TabOrder = 1
      Width = 150
    end
    object lbACTIVEX: TcxLabel
      Left = 15
      Top = 79
      AutoSize = False
      Caption = ' Aktiv'
      ParentColor = False
      Style.StyleController = dmStyle.styleLabel
      Properties.Alignment.Vert = taVCenter
      Height = 21
      Width = 150
      AnchorY = 90
    end
    object cxDBImageComboBox1: TcxDBImageComboBox
      Left = 171
      Top = 79
      RepositoryItem = dmStyle.icbActive
      DataBinding.DataField = 'ACTIVEX'
      DataBinding.DataSource = dsList
      Properties.ImmediatePost = True
      Properties.Items = <>
      TabOrder = 7
      Width = 85
    end
    object lbSORDER: TcxLabel
      Left = 15
      Top = 52
      AutoSize = False
      Caption = ' Sortierung'
      ParentColor = False
      Style.StyleController = dmStyle.styleLabel
      Properties.Alignment.Vert = taVCenter
      Height = 21
      Width = 150
      AnchorY = 63
    end
    object seSORDER: TcxDBSpinEdit
      Left = 171
      Top = 52
      DataBinding.DataField = 'SORDER'
      DataBinding.DataSource = dsList
      TabOrder = 5
      Width = 121
    end
    object cxLabel1: TcxLabel
      Left = 334
      Top = 25
      AutoSize = False
      Caption = ' Icon'
      ParentColor = False
      Style.StyleController = dmStyle.styleLabel
      Properties.Alignment.Vert = taVCenter
      Height = 21
      Width = 150
      AnchorY = 36
    end
    object cxDBImageComboBox2: TcxDBImageComboBox
      Left = 490
      Top = 25
      RepositoryItem = dmStyle.icbCommunicationProt
      DataBinding.DataField = 'COMUNICATIONPROTOCOL_ID'
      DataBinding.DataSource = dsList
      Properties.ImmediatePost = True
      Properties.Items = <>
      TabOrder = 3
      Width = 150
    end
  end
  inherited asTab: TJvEnterAsTab
    Left = 14
    Top = 444
  end
  object qryList: TFDQuery
    BeforeOpen = qryListBeforeOpen
    Connection = dmDatabase.FDConnection
    UpdateOptions.KeyFields = 'COMUNICATIONTYPE_ID'
    SQL.Strings = (
      'SELECT '
      '    COMUNICATIONTYPE_ID,'
      '    COMUNICATIONPROTOCOL_ID,'
      '    ICON,'
      '    SORDER,'
      '    ACTIVEX'
      '    '
      'FROM CON_COMUNICATIONTYPE'
      'WHERE COMUNICATIONTYPE_ID = :ID'
      ''
      '  ')
    Left = 88
    Top = 177
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object qryListCOMUNICATIONTYPE_ID: TFDAutoIncField
      FieldName = 'COMUNICATIONTYPE_ID'
      Origin = 'COMUNICATIONTYPE_ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryListCOMUNICATIONPROTOCOL_ID: TIntegerField
      FieldName = 'COMUNICATIONPROTOCOL_ID'
      Origin = 'COMUNICATIONPROTOCOL_ID'
    end
    object qryListICON: TSmallintField
      FieldName = 'ICON'
      Origin = 'ICON'
    end
    object qryListSORDER: TSmallintField
      FieldName = 'SORDER'
      Origin = 'SORDER'
    end
    object qryListACTIVEX: TSmallintField
      FieldName = 'ACTIVEX'
      Origin = 'ACTIVEX'
      Required = True
    end
  end
  object dsList: TDataSource
    DataSet = qryList
    Left = 88
    Top = 238
  end
  object qryRes: TFDQuery
    BeforeOpen = qryResBeforeOpen
    MasterSource = dsList
    MasterFields = 'COMUNICATIONTYPE_ID'
    DetailFields = 'COMUNICATIONTYPE_ID'
    Connection = dmDatabase.FDConnection
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.KeyFields = 'COMUNICATIONTYPERES_ID'
    SQL.Strings = (
      'SELECT '
      '    COMUNICATIONTYPERES_ID,'
      '    COMUNICATIONTYPE_ID,'
      '    LANGUAGE_ID,'
      '    COMUNICATIONTYPE'
      'FROM CON_COMUNICATIONTYPERES'
      'WHERE COMUNICATIONTYPE_ID = :COMUNICATIONTYPE_ID'
      '')
    Left = 164
    Top = 174
    ParamData = <
      item
        Name = 'COMUNICATIONTYPE_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object qryResCOMUNICATIONTYPERES_ID: TFDAutoIncField
      FieldName = 'COMUNICATIONTYPERES_ID'
      Origin = 'COMUNICATIONTYPERES_ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryResCOMUNICATIONTYPE_ID: TIntegerField
      FieldName = 'COMUNICATIONTYPE_ID'
      Origin = 'COMUNICATIONTYPE_ID'
    end
    object qryResLANGUAGE_ID: TIntegerField
      FieldName = 'LANGUAGE_ID'
      Origin = 'LANGUAGE_ID'
    end
    object qryResLANGUAGE: TStringField
      FieldKind = fkLookup
      FieldName = 'LANGUAGE'
      LookupDataSet = qryLanguage
      LookupKeyFields = 'LANGUAGE_ID'
      LookupResultField = 'LANGUAGE'
      KeyFields = 'LANGUAGE_ID'
      Size = 50
      Lookup = True
    end
    object qryResCOMUNICATIONTYPE: TWideStringField
      FieldName = 'COMUNICATIONTYPE'
      Origin = 'COMUNICATIONTYPE'
      Size = 75
    end
  end
  object dsRes: TDataSource
    DataSet = qryRes
    Left = 164
    Top = 238
  end
  object qryLanguage: TFDQuery
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
      'SELECT'
      '  GEO_LANGUAGE.LANGUAGE_ID,'
      '  GEO_LANGUAGERES.LANGUAGE AS LANGUAGE'
      'FROM GEO_LANGUAGERES'
      
        'INNER JOIN GEO_LANGUAGE ON (GEO_LANGUAGERES.ISO639_1 = GEO_LANGU' +
        'AGE.ISO639_1)'
      'WHERE GEO_LANGUAGE.ACTIVEX = 1 AND'
      '      GEO_LANGUAGERES.LANGUAGE_ID = :LNG'
      '')
    Left = 348
    Top = 176
    ParamData = <
      item
        Name = 'LNG'
        DataType = ftInteger
        ParamType = ptInput
        Value = 32
      end>
    object qryLanguageLANGUAGE_ID: TFDAutoIncField
      FieldName = 'LANGUAGE_ID'
      Origin = 'LANGUAGE_ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryLanguageLANGUAGE: TWideStringField
      FieldName = 'LANGUAGE'
      Origin = 'LANGUAGE'
      Size = 50
    end
  end
  object dsLanguage: TDataSource
    DataSet = qryLanguage
    Left = 348
    Top = 240
  end
  object qryCheckLangRes: TFDQuery
    BeforeOpen = qryCheckLangResBeforeOpen
    MasterSource = dsList
    MasterFields = 'COMUNICATIONTYPE_ID'
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
      'SELECT'
      ' count( GEO_LANGUAGE.LANGUAGE_ID)'
      'FROM GEO_LANGUAGE'
      'WHERE GEO_LANGUAGE.LANGUAGE_ID NOT IN'
      '  ('
      '   SELECT  CON_COMUNICATIONTYPERES.LANGUAGE_ID'
      '   FROM  CON_COMUNICATIONTYPERES'
      '   WHERE  CON_COMUNICATIONTYPERES.COMUNICATIONTYPE_ID = :ID'
      '  )'
      '  AND'
      '  GEO_LANGUAGE.ACTIVEX = 1'
      ''
      ''
      '  ')
    Left = 248
    Top = 174
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object dsCheckLangRes: TDataSource
    DataSet = qryCheckLangRes
    Left = 248
    Top = 238
  end
  object FDS: TFDStoredProc
    Connection = dmDatabase.FDConnection
    StoredProcName = 'SP_SYS_ADD_MISSINGRES_LNG'
    Left = 13
    Top = 175
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
end
