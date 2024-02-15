inherited frmIndustrialSectorList: TfrmIndustrialSectorList
  Caption = 'frmGroupList'
  ClientHeight = 507
  ClientWidth = 1094
  FormStyle = fsMDIChild
  Visible = True
  ExplicitWidth = 1108
  ExplicitHeight = 547
  TextHeight = 13
  object GDList: TcxGrid [0]
    AlignWithMargins = True
    Left = 3
    Top = 41
    Width = 1088
    Height = 463
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitWidth = 1084
    ExplicitHeight = 462
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
      object TVListINDUSTRYSECTORS_ID: TcxGridDBColumn
        DataBinding.FieldName = 'INDUSTRYSECTORS_ID'
        Width = 145
      end
      object TVListCODE: TcxGridDBColumn
        DataBinding.FieldName = 'CODE'
        Width = 47
      end
      object TVListINDUSTRYSECTOR: TcxGridDBColumn
        DataBinding.FieldName = 'INDUSTRYSECTOR'
        Width = 841
      end
      object TVListACTIVEX: TcxGridDBColumn
        DataBinding.FieldName = 'ACTIVEX'
        Width = 53
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
    UpdateOptions.KeyFields = 'INDUSTRYSECTORS_ID'
    SQL.Strings = (
      'SELECT '
      '    CON_INDUSTRYSECTORS.INDUSTRYSECTORS_ID,'
      '    CON_INDUSTRYSECTORS.CODE,'
      '    CON_INDUSTRYSECTORS.ACTIVEX,'
      '    CON_INDUSTRYSECTORSRES.INDUSTRYSECTOR'
      'FROM CON_INDUSTRYSECTORS'
      
        '   INNER JOIN CON_INDUSTRYSECTORSRES ON (CON_INDUSTRYSECTORS.IND' +
        'USTRYSECTORS_ID = CON_INDUSTRYSECTORSRES.INDUSTRYSECTORS_ID)'
      'WHERE '
      '   CON_INDUSTRYSECTORS.ACTIVEX = 1 and'
      '   CON_INDUSTRYSECTORSRES.LANGUAGE_ID = :LNG '
      
        'ORDER BY CON_INDUSTRYSECTORS.CODE,CON_INDUSTRYSECTORSRES.INDUSTR' +
        'YSECTOR '
      '       ')
    Left = 245
    Top = 446
    ParamData = <
      item
        Name = 'LNG'
        DataType = ftInteger
        ParamType = ptInput
        Value = 32
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
    object qryListINDUSTRYSECTOR: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'INDUSTRYSECTOR'
      Origin = 'INDUSTRYSECTOR'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
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
