inherited frmIndustrialSectorEdit: TfrmIndustrialSectorEdit
  Caption = 'Position'
  ClientHeight = 500
  ClientWidth = 776
  OnCloseQuery = FormCloseQuery
  ExplicitWidth = 790
  ExplicitHeight = 540
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
      OnClick = btnAddResClick
    end
  end
  inherited pnlBotton: TdxPanel
    Top = 460
    Width = 776
    TabOrder = 3
    ExplicitTop = 459
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
  object GDRES: TcxGrid [2]
    AlignWithMargins = True
    Left = 3
    Top = 135
    Width = 770
    Height = 322
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitWidth = 766
    ExplicitHeight = 321
    object TVRES: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      FindPanel.InfoText = 'Geben Sie Text f'#252'r die Suche ein...'
      FindPanel.Layout = fplCompact
      ScrollbarAnnotations.CustomAnnotations = <>
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
      object TVRESINDUSTRYSECTORSRES_ID: TcxGridDBColumn
        DataBinding.FieldName = 'INDUSTRYSECTORSRES_ID'
        Width = 154
      end
      object TVRESINDUSTRYSECTORS_ID: TcxGridDBColumn
        DataBinding.FieldName = 'INDUSTRYSECTORS_ID'
        Width = 133
      end
      object TVRESLANGUAGE_ID: TcxGridDBColumn
        DataBinding.FieldName = 'LANGUAGE_ID'
        Width = 85
      end
      object TVRESINDUSTRYSECTOR: TcxGridDBColumn
        DataBinding.FieldName = 'INDUSTRYSECTOR'
        Width = 396
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
    ExplicitWidth = 766
    Height = 86
    Width = 770
    object lbACTIVEX: TcxLabel
      Left = 15
      Top = 25
      AutoSize = False
      Caption = ' Aktiv'
      ParentColor = False
      Style.StyleController = dmStyle.styleLabel
      Properties.Alignment.Vert = taVCenter
      Height = 21
      Width = 150
      AnchorY = 36
    end
    object cxDBImageComboBox1: TcxDBImageComboBox
      Left = 171
      Top = 25
      RepositoryItem = dmStyle.icbActive
      DataBinding.DataField = 'ACTIVEX'
      DataBinding.DataSource = dsList
      Properties.ImmediatePost = True
      Properties.Items = <>
      TabOrder = 1
      Width = 85
    end
  end
  inherited asTab: TJvEnterAsTab
    Left = 14
    Top = 444
  end
  object qryList: TFDQuery
    BeforeOpen = qryListBeforeOpen
    Connection = dmDatabase.FDConnection
    UpdateOptions.KeyFields = 'INDUSTRYSECTORS_ID'
    SQL.Strings = (
      'SELECT '
      '  INDUSTRYSECTORS_ID,'
      '  CODE,'
      '  ACTIVEX'
      'FROM CON_INDUSTRYSECTORS'
      'WHERE '
      '  INDUSTRYSECTORS_ID = :ID'
      ' ')
    Left = 88
    Top = 177
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object qryListINDUSTRYSECTORS_ID: TFDAutoIncField
      FieldName = 'INDUSTRYSECTORS_ID'
      Origin = 'INDUSTRYSECTORS_ID'
    end
    object qryListCODE: TIntegerField
      FieldName = 'CODE'
      Origin = 'CODE'
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
    MasterSource = dsList
    MasterFields = 'INDUSTRYSECTORS_ID'
    Connection = dmDatabase.FDConnection
    UpdateOptions.KeyFields = 'INDUSTRYSECTORSRES_ID'
    SQL.Strings = (
      'SELECT '
      '    INDUSTRYSECTORSRES_ID,'
      '    INDUSTRYSECTORS_ID,'
      '    LANGUAGE_ID,'
      '    INDUSTRYSECTOR'
      'FROM CON_INDUSTRYSECTORSRES'
      'WHERE INDUSTRYSECTORS_ID = :INDUSTRYSECTORS_ID'
      '')
    Left = 164
    Top = 174
    ParamData = <
      item
        Name = 'INDUSTRYSECTORS_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object qryResINDUSTRYSECTORSRES_ID: TFDAutoIncField
      FieldName = 'INDUSTRYSECTORSRES_ID'
      Origin = 'INDUSTRYSECTORSRES_ID'
    end
    object qryResINDUSTRYSECTORS_ID: TIntegerField
      FieldName = 'INDUSTRYSECTORS_ID'
      Origin = 'INDUSTRYSECTORS_ID'
    end
    object qryResLANGUAGE_ID: TIntegerField
      FieldName = 'LANGUAGE_ID'
      Origin = 'LANGUAGE_ID'
    end
    object qryResINDUSTRYSECTOR: TWideStringField
      FieldName = 'INDUSTRYSECTOR'
      Origin = 'INDUSTRYSECTOR'
      Size = 200
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
    MasterFields = 'INDUSTRYSECTORS_ID'
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
      '   SELECT CON_INDUSTRYSECTORSRES.LANGUAGE_ID'
      '   FROM CON_INDUSTRYSECTORSRES'
      '   WHERE CON_INDUSTRYSECTORSRES.INDUSTRYSECTORS_ID = :ID'
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
