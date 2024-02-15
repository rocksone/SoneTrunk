inherited frmSaludationEdit: TfrmSaludationEdit
  Caption = 'frmSaludationEdit'
  ClientHeight = 502
  ClientWidth = 784
  OnCloseQuery = FormCloseQuery
  ExplicitWidth = 798
  ExplicitHeight = 542
  TextHeight = 13
  inherited pnlTop: TdxPanel
    Width = 784
    ExplicitWidth = 780
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
    Top = 462
    Width = 784
    TabOrder = 3
    ExplicitTop = 461
    ExplicitWidth = 780
    inherited btnCancel: TcxButton
      Left = 653
      ExplicitLeft = 649
    end
    inherited btnOK: TcxButton
      Left = 522
      ExplicitLeft = 518
    end
  end
  object GDSaludation: TcxGrid [2]
    AlignWithMargins = True
    Left = 3
    Top = 135
    Width = 778
    Height = 324
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitWidth = 774
    ExplicitHeight = 323
    object TVSaludation: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      FindPanel.InfoText = 'Geben Sie Text f'#252'r die Suche ein...'
      FindPanel.Layout = fplCompact
      ScrollbarAnnotations.CustomAnnotations = <>
      OnCellClick = TVSaludationCellClick
      DataController.DataSource = dsSaludationRes
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
      object TVSaludationSALUDATIONRES_ID: TcxGridDBColumn
        DataBinding.FieldName = 'SALUDATIONRES_ID'
        Visible = False
        VisibleForCustomization = False
      end
      object TVSaludationSALUDATION_ID: TcxGridDBColumn
        DataBinding.FieldName = 'SALUDATION_ID'
        Visible = False
        VisibleForCustomization = False
      end
      object TVSaludationLANGUAGE_ID: TcxGridDBColumn
        DataBinding.FieldName = 'LANGUAGE_ID'
        Visible = False
        VisibleForCustomization = False
      end
      object TVSaludationLanguage: TcxGridDBColumn
        Caption = 'SPRACHE'
        DataBinding.FieldName = 'Language'
        PropertiesClassName = 'TcxLabelProperties'
        Width = 94
      end
      object TVSaludationSALUDATION: TcxGridDBColumn
        Caption = 'ANREDE'
        DataBinding.FieldName = 'SALUDATION'
        Width = 196
      end
      object TVSaludationLETTERSALUTATION: TcxGridDBColumn
        Caption = 'BRIEFANREDE'
        DataBinding.FieldName = 'LETTERSALUTATION'
        Width = 486
      end
    end
    object LVSaludation: TcxGridLevel
      GridView = TVSaludation
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
    ExplicitWidth = 774
    Height = 86
    Width = 778
    object lbGENDER: TcxLabel
      Left = 15
      Top = 25
      AutoSize = False
      Caption = ' Geschlecht'
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
      RepositoryItem = dmStyle.icbGender
      DataBinding.DataField = 'GENDER'
      DataBinding.DataSource = dsSaludation
      Properties.ImmediatePost = True
      Properties.Items = <>
      TabOrder = 1
      Width = 85
    end
    object lbACTIVEX: TcxLabel
      Left = 15
      Top = 52
      AutoSize = False
      Caption = ' Aktiv'
      ParentColor = False
      Style.StyleController = dmStyle.styleLabel
      Properties.Alignment.Vert = taVCenter
      Height = 21
      Width = 150
      AnchorY = 63
    end
    object cxDBImageComboBox1: TcxDBImageComboBox
      Left = 171
      Top = 52
      RepositoryItem = dmStyle.icbActive
      DataBinding.DataField = 'ACTIVEX'
      DataBinding.DataSource = dsSaludation
      Properties.ImmediatePost = True
      Properties.Items = <>
      TabOrder = 3
      Width = 85
    end
  end
  inherited asTab: TJvEnterAsTab
    Left = 14
    Top = 468
  end
  object qrySaludation: TFDQuery
    BeforeOpen = qrySaludationBeforeOpen
    Connection = dmDatabase.FDConnection
    UpdateOptions.KeyFields = 'SALUDATION_ID'
    SQL.Strings = (
      'select '
      '    con_saludation.saludation_id,'
      '    con_saludation.gender,'
      '    con_saludation.activex'
      'from con_saludation'
      'WHERE SALUDATION_ID = :ID'
      ''
      ''
      '  ')
    Left = 305
    Top = 366
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qrySaludationSALUDATION_ID: TFDAutoIncField
      FieldName = 'SALUDATION_ID'
      Origin = 'SALUDATION_ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qrySaludationGENDER: TSmallintField
      FieldName = 'GENDER'
      Origin = 'GENDER'
    end
    object qrySaludationACTIVEX: TSmallintField
      FieldName = 'ACTIVEX'
      Origin = 'ACTIVEX'
      Required = True
    end
  end
  object dsSaludation: TDataSource
    DataSet = qrySaludation
    Left = 423
    Top = 366
  end
  object qrySaludationRes: TFDQuery
    BeforeOpen = qrySaludationResBeforeOpen
    MasterSource = dsSaludation
    MasterFields = 'SALUDATION_ID'
    Connection = dmDatabase.FDConnection
    UpdateOptions.KeyFields = 'SALUDATIONRES_ID'
    SQL.Strings = (
      'SELECT '
      '   SALUDATIONRES_ID,'
      '   SALUDATION_ID,'
      '   LANGUAGE_ID,'
      '   SALUDATION,'
      '   LETTERSALUTATION'
      ''
      'FROM CON_SALUDATIONRES'
      'WHERE SALUDATION_ID = :SALUDATION_ID'
      '')
    Left = 305
    Top = 414
    ParamData = <
      item
        Name = 'SALUDATION_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qrySaludationResSALUDATIONRES_ID: TFDAutoIncField
      FieldName = 'SALUDATIONRES_ID'
      Origin = 'SALUDATIONRES_ID'
      ReadOnly = True
    end
    object qrySaludationResSALUDATION_ID: TIntegerField
      FieldName = 'SALUDATION_ID'
      Origin = 'SALUDATION_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qrySaludationResLANGUAGE_ID: TIntegerField
      FieldName = 'LANGUAGE_ID'
      Origin = 'LANGUAGE_ID'
    end
    object qrySaludationResSALUDATION: TWideStringField
      FieldName = 'SALUDATION'
      Origin = 'SALUDATION'
      Size = 40
    end
    object qrySaludationResLETTERSALUTATION: TWideStringField
      FieldName = 'LETTERSALUTATION'
      Origin = 'LETTERSALUTATION'
      Size = 100
    end
    object qrySaludationResLANGUAGE: TStringField
      FieldKind = fkLookup
      FieldName = 'LANGUAGE'
      LookupDataSet = qryLanguage
      LookupKeyFields = 'LANGUAGE_ID'
      LookupResultField = 'LANGUAGE'
      KeyFields = 'LANGUAGE_ID'
      Size = 50
      Lookup = True
    end
  end
  object dsSaludationRes: TDataSource
    DataSet = qrySaludationRes
    Left = 423
    Top = 414
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
    Left = 404
    Top = 64
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
    Left = 476
    Top = 64
  end
  object qryCheckLangRes: TFDQuery
    BeforeOpen = qryCheckLangResBeforeOpen
    MasterSource = dsSaludation
    MasterFields = 'SALUDATION_ID'
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
      '   SELECT CON_SALUDATIONRES.LANGUAGE_ID'
      '   FROM CON_SALUDATIONRES'
      '   WHERE CON_SALUDATIONRES.SALUDATION_ID = :ID'
      '  )'
      '  AND'
      '  GEO_LANGUAGE.ACTIVEX = 1'
      ''
      ''
      '  ')
    Left = 96
    Top = 360
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dsCheckLangRes: TDataSource
    DataSet = qryCheckLangRes
    Left = 177
    Top = 360
  end
  object FDSSaludationRes: TFDStoredProc
    Connection = dmDatabase.FDConnection
    StoredProcName = 'SP_SYS_ADD_MISSINGRES_LNG'
    Left = 496
    Top = 320
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
