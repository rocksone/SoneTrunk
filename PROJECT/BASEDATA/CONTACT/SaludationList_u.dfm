inherited frmSaludationList: TfrmSaludationList
  Caption = 'frmSaludationList'
  ClientHeight = 503
  ClientWidth = 1078
  FormStyle = fsMDIChild
  Visible = True
  ExplicitWidth = 1092
  ExplicitHeight = 543
  TextHeight = 13
  object GDSaludation: TcxGrid [0]
    AlignWithMargins = True
    Left = 3
    Top = 41
    Width = 1072
    Height = 459
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitWidth = 1068
    ExplicitHeight = 458
    object TVSaludation: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      FindPanel.DisplayMode = fpdmAlways
      FindPanel.InfoText = 'Geben Sie Text f'#252'r die Suche ein...'
      ScrollbarAnnotations.CustomAnnotations = <>
      OnCellDblClick = TVSaludationCellDblClick
      DataController.DataSource = dsSaludation
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.DataRowHeight = 25
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 30
      Styles.StyleSheet = dmStyle.GDTV
      object TVSaludationSALUDATION_ID: TcxGridDBColumn
        DataBinding.FieldName = 'SALUDATION_ID'
        Visible = False
        VisibleForCustomization = False
        Width = 107
      end
      object TVSaludationGENDER: TcxGridDBColumn
        Caption = 'GESCHLECHT'
        DataBinding.FieldName = 'GENDER'
        RepositoryItem = dmStyle.icbGender
        Width = 94
      end
      object TVSaludationSALUDATION: TcxGridDBColumn
        Caption = 'ANREDE'
        DataBinding.FieldName = 'SALUDATION'
        Width = 238
      end
      object TVSaludationLETTERSALUTATION: TcxGridDBColumn
        Caption = 'BRIEFANREDE'
        DataBinding.FieldName = 'LETTERSALUTATION'
        Width = 588
      end
      object TVSaludationACTIVEX: TcxGridDBColumn
        Caption = 'AKTIV'
        DataBinding.FieldName = 'ACTIVEX'
        RepositoryItem = dmStyle.icbActive
        Width = 59
      end
    end
    object LVSaludation: TcxGridLevel
      GridView = TVSaludation
    end
  end
  inherited act: TActionList
    inherited actInsert: TAction
      OnExecute = actInsertExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
  end
  inherited bm: TdxBarManager
    PixelsPerInch = 96
    inherited bbPost: TdxBarLargeButton
      Visible = ivNever
    end
    inherited bbCancel: TdxBarLargeButton
      Visible = ivNever
    end
  end
  object qrySaludationList: TFDQuery
    BeforeOpen = qrySaludationListBeforeOpen
    Connection = dmDatabase.FDConnection
    Transaction = FDTransaction1
    UpdateOptions.KeyFields = 'SALUDATION_ID'
    SQL.Strings = (
      'select '
      '    con_saludation.saludation_id,'
      '    con_saludationres.saludation,'
      '    con_saludationres.lettersalutation,'
      '    con_saludation.gender,'
      '    con_saludation.activex'
      ''
      'from con_saludation'
      
        '   inner join con_saludationres on (con_saludation.saludation_id' +
        ' = con_saludationres.saludation_id)'
      ''
      'where '
      '    con_saludationres.language_id = :LNG and   '
      '    con_saludation.activex = 1'
      '  ')
    Left = 233
    Top = 334
    ParamData = <
      item
        Name = 'LNG'
        DataType = ftInteger
        ParamType = ptInput
        Value = 32
      end>
    object qrySaludationListSALUDATION_ID: TFDAutoIncField
      FieldName = 'SALUDATION_ID'
      Origin = 'SALUDATION_ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qrySaludationListSALUDATION: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'SALUDATION'
      Origin = 'SALUDATION'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object qrySaludationListLETTERSALUTATION: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'LETTERSALUTATION'
      Origin = 'LETTERSALUTATION'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qrySaludationListGENDER: TSmallintField
      FieldName = 'GENDER'
      Origin = 'GENDER'
    end
    object qrySaludationListACTIVEX: TSmallintField
      FieldName = 'ACTIVEX'
      Origin = 'ACTIVEX'
      Required = True
    end
  end
  object dsSaludation: TDataSource
    DataSet = qrySaludationList
    Left = 319
    Top = 334
  end
  object FDS: TFDStoredProc
    Connection = dmDatabase.FDConnection
    StoredProcName = 'SP_SYS_ADD_BASEDATA'
    Left = 176
    Top = 224
    ParamData = <
      item
        Position = 1
        Name = 'TABLENAME'
        DataType = ftWideString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 2
        Name = 'FIELDNAME'
        DataType = ftWideString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 3
        Name = 'V_ID'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object FDTransaction1: TFDTransaction
    Connection = dmDatabase.FDConnection
    Left = 312
    Top = 224
  end
end
