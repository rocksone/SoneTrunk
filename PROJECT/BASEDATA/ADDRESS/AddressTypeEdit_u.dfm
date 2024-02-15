inherited dgAddressTypeEdit: TdgAddressTypeEdit
  Caption = 'TypeEdit'
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
    Top = 167
    Width = 774
    Height = 291
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitWidth = 770
    ExplicitHeight = 290
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
      object TVRESADDRESSTYPERES_ID: TcxGridDBColumn
        DataBinding.FieldName = 'ADDRESSTYPERES_ID'
        Width = 126
      end
      object TVRESADDRESSTYPE_ID: TcxGridDBColumn
        DataBinding.FieldName = 'ADDRESSTYPE_ID'
        Width = 119
      end
      object TVRESLANGUAGE_ID: TcxGridDBColumn
        DataBinding.FieldName = 'LANGUAGE'
        Width = 116
      end
      object TVRESADDRESSTYPE: TcxGridDBColumn
        DataBinding.FieldName = 'ADDRESSTYPE'
        Width = 411
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
    Height = 118
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
      RepositoryItem = dmStyle.icbAdresseType
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
      TabOrder = 5
      Width = 85
    end
    object cxLabel1: TcxLabel
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
    object cxDBSpinEdit1: TcxDBSpinEdit
      Left = 171
      Top = 52
      DataBinding.DataField = 'SORDER'
      DataBinding.DataSource = dsList
      TabOrder = 3
      Width = 121
    end
  end
  inherited asTab: TJvEnterAsTab
    Left = 14
    Top = 444
  end
  object qryList: TFDQuery
    BeforeOpen = qryListBeforeOpen
    Connection = dmDatabase.FDConnection
    UpdateOptions.KeyFields = 'ADDRESSTYPE_ID'
    SQL.Strings = (
      'SELECT '
      '    CON_ADDRESSTYPE.ADDRESSTYPE_ID,'
      '    CON_ADDRESSTYPE.ICON,'
      '    CON_ADDRESSTYPE.SORDER,'
      ''
      '    CON_ADDRESSTYPE.ACTIVEX'
      'FROM CON_ADDRESSTYPE'
      ''
      'WHERE '
      ''
      'CON_ADDRESSTYPE.ADDRESSTYPE_ID = :ID'
      ''
      'ORDER BY CON_ADDRESSTYPE.SORDER  ')
    Left = 88
    Top = 202
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryListADDRESSTYPE_ID: TFDAutoIncField
      FieldName = 'ADDRESSTYPE_ID'
      Origin = 'ADDRESSTYPE_ID'
      ReadOnly = True
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
    Top = 263
  end
  object qryRes: TFDQuery
    BeforeOpen = qryResBeforeOpen
    MasterSource = dsList
    MasterFields = 'ADDRESSTYPE_ID'
    Connection = dmDatabase.FDConnection
    UpdateOptions.KeyFields = 'ADDRESSTYPERES_ID'
    SQL.Strings = (
      'SELECT '
      '    CON_ADDRESSTYPERES.ADDRESSTYPERES_ID,'
      '    CON_ADDRESSTYPERES.ADDRESSTYPE_ID,'
      '    CON_ADDRESSTYPERES.LANGUAGE_ID,'
      '    CON_ADDRESSTYPERES.ADDRESSTYPE'
      'FROM CON_ADDRESSTYPERES'
      'WHERE  CON_ADDRESSTYPERES.ADDRESSTYPE_ID =  :ADDRESSTYPE_ID')
    Left = 164
    Top = 199
    ParamData = <
      item
        Name = 'ADDRESSTYPE_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryResADDRESSTYPERES_ID: TFDAutoIncField
      FieldName = 'ADDRESSTYPERES_ID'
      Origin = 'ADDRESSTYPERES_ID'
      ReadOnly = True
    end
    object qryResADDRESSTYPE_ID: TIntegerField
      FieldName = 'ADDRESSTYPE_ID'
      Origin = 'ADDRESSTYPE_ID'
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
    object qryResADDRESSTYPE: TWideStringField
      FieldName = 'ADDRESSTYPE'
      Origin = 'ADDRESSTYPE'
      Size = 75
    end
  end
  object dsRes: TDataSource
    DataSet = qryRes
    Left = 164
    Top = 263
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
    Top = 201
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
    Top = 265
  end
  object qryCheckLangRes: TFDQuery
    BeforeOpen = qryCheckLangResBeforeOpen
    MasterSource = dsList
    MasterFields = 'ADDRESSTYPE_ID'
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
      '   SELECT  CON_ADDRESSTYPERES.LANGUAGE_ID'
      '   FROM  CON_ADDRESSTYPERES'
      '   WHERE  CON_ADDRESSTYPERES.ADDRESSTYPE_ID = :ID'
      '  )'
      '  AND'
      '  GEO_LANGUAGE.ACTIVEX = 1'
      '')
    Left = 248
    Top = 199
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
    Top = 263
  end
  object FDS: TFDStoredProc
    Connection = dmDatabase.FDConnection
    StoredProcName = 'SP_SYS_ADD_MISSINGRES_LNG'
    Left = 13
    Top = 200
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
