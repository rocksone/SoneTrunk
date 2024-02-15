inherited frmCommunicationTypeList: TfrmCommunicationTypeList
  Caption = 'frmCommunicationTypeList'
  ClientHeight = 506
  ClientWidth = 1090
  FormStyle = fsMDIChild
  Visible = True
  ExplicitWidth = 1108
  ExplicitHeight = 547
  TextHeight = 13
  object GDList: TcxGrid [0]
    AlignWithMargins = True
    Left = 3
    Top = 41
    Width = 1084
    Height = 462
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitWidth = 1088
    ExplicitHeight = 463
    object TVList: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      FindPanel.DisplayMode = fpdmAlways
      FindPanel.InfoText = 'Geben Sie Text f'#252'r die Suche ein...'
      ScrollbarAnnotations.CustomAnnotations = <>
      OnCellDblClick = TVListCellDblClick
      DataController.DataSource = dsList
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.DataRowHeight = 25
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 30
      Styles.StyleSheet = dmStyle.GDTV
      object TVListCOMUNICATIONTYPE_ID: TcxGridDBColumn
        DataBinding.FieldName = 'COMUNICATIONTYPE_ID'
        Width = 199
      end
      object TVListICON: TcxGridDBColumn
        DataBinding.FieldName = 'ICON'
        RepositoryItem = dmStyle.icbCommunicationType
        Width = 80
      end
      object TVListSORDER: TcxGridDBColumn
        DataBinding.FieldName = 'SORDER'
        Width = 79
      end
      object TVListACTIVEX: TcxGridDBColumn
        DataBinding.FieldName = 'ACTIVEX'
        Width = 81
      end
      object TVListCOMUNICATIONPROTOCOL_ID: TcxGridDBColumn
        DataBinding.FieldName = 'COMUNICATIONPROTOCOL_ID'
        Width = 194
      end
      object TVListCOMUNICATIONTYPE: TcxGridDBColumn
        DataBinding.FieldName = 'COMUNICATIONTYPE'
        Width = 453
      end
    end
    object LVList: TcxGridLevel
      GridView = TVList
    end
  end
  inherited act: TActionList
    Left = 11
    Top = 446
    inherited actInsert: TAction
      OnExecute = actInsertExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
    inherited actRefresh: TAction
      OnExecute = actRefreshExecute
    end
  end
  inherited asTab: TJvEnterAsTab
    Left = 104
    Top = 446
  end
  inherited bm: TdxBarManager
    Left = 57
    Top = 446
    PixelsPerInch = 96
    inherited bbPost: TdxBarLargeButton
      Visible = ivNever
    end
    inherited bbCancel: TdxBarLargeButton
      Visible = ivNever
    end
  end
  object qryList: TFDQuery
    BeforeOpen = qryListBeforeOpen
    Connection = dmDatabase.FDConnection
    Transaction = TRS
    UpdateOptions.KeyFields = 'COMUNICATIONTYPE_ID'
    SQL.Strings = (
      'SELECT '
      '    CON_COMUNICATIONTYPE.COMUNICATIONTYPE_ID,'
      '    CON_COMUNICATIONTYPE.ICON,'
      '    CON_COMUNICATIONTYPE.SORDER,'
      '    CON_COMUNICATIONTYPE.ACTIVEX,'
      '    CON_COMUNICATIONTYPE.COMUNICATIONPROTOCOL_ID,'
      '    CON_COMUNICATIONTYPERES.COMUNICATIONTYPE'
      'FROM CON_COMUNICATIONTYPE'
      
        '   INNER JOIN CON_COMUNICATIONTYPERES ON (CON_COMUNICATIONTYPE.C' +
        'OMUNICATIONTYPE_ID = CON_COMUNICATIONTYPERES.COMUNICATIONTYPE_ID' +
        ')'
      'WHERE '
      '    CON_COMUNICATIONTYPE.ACTIVEX = 1 and'
      '    CON_COMUNICATIONTYPERES.LANGUAGE_ID = :LNG'
      
        'ORDER BY CON_COMUNICATIONTYPE.SORDER, CON_COMUNICATIONTYPERES.CO' +
        'MUNICATIONTYPE')
    Left = 245
    Top = 446
    ParamData = <
      item
        Name = 'LNG'
        DataType = ftInteger
        ParamType = ptInput
        Value = 32
      end>
    object qryListCOMUNICATIONTYPE_ID: TFDAutoIncField
      FieldName = 'COMUNICATIONTYPE_ID'
      Origin = 'COMUNICATIONTYPE_ID'
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
    object qryListCOMUNICATIONPROTOCOL_ID: TIntegerField
      FieldName = 'COMUNICATIONPROTOCOL_ID'
      Origin = 'COMUNICATIONPROTOCOL_ID'
    end
    object qryListCOMUNICATIONTYPE: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'COMUNICATIONTYPE'
      Origin = 'COMUNICATIONTYPE'
      ProviderFlags = []
      ReadOnly = True
      Size = 75
    end
  end
  object dsList: TDataSource
    DataSet = qryList
    Left = 292
    Top = 446
  end
  object FDS: TFDStoredProc
    Connection = dmDatabase.FDConnection
    StoredProcName = 'SP_SYS_ADD_BASEDATA'
    Left = 151
    Top = 446
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
  object TRS: TFDTransaction
    Connection = dmDatabase.FDConnection
    Left = 198
    Top = 446
  end
end
