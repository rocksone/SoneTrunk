inherited frmTitleList: TfrmTitleList
  Caption = 'Titel'
  ClientHeight = 506
  ClientWidth = 1090
  FormStyle = fsMDIChild
  Visible = True
  ExplicitWidth = 1104
  ExplicitHeight = 546
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
    ExplicitWidth = 1080
    ExplicitHeight = 461
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
      object TVListTITLE_ID: TcxGridDBColumn
        DataBinding.FieldName = 'TITLE_ID'
      end
      object TVListTITLE: TcxGridDBColumn
        DataBinding.FieldName = 'TITLE'
      end
      object TVListACTIVEX: TcxGridDBColumn
        DataBinding.FieldName = 'ACTIVEX'
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
    UpdateOptions.KeyFields = 'TITLE_ID'
    SQL.Strings = (
      'SELECT '
      '    CON_TITLE.TITLE_ID,'
      '    CON_TITLE.ACTIVEX,'
      '    CON_TITLERES.LANGUAGE_ID,'
      '    CON_TITLERES.TITLE'
      'FROM CON_TITLE'
      
        '   INNER JOIN CON_TITLERES ON (CON_TITLE.TITLE_ID = CON_TITLERES' +
        '.TITLE_ID)'
      'WHERE '
      '  CON_TITLE.ACTIVEX = 1'
      '  and CON_TITLERES.LANGUAGE_ID = :LNG'
      '    ')
    Left = 245
    Top = 446
    ParamData = <
      item
        Name = 'LNG'
        DataType = ftInteger
        ParamType = ptInput
        Value = 32
      end>
    object qryListTITLE_ID: TFDAutoIncField
      FieldName = 'TITLE_ID'
      Origin = 'TITLE_ID'
      ReadOnly = True
    end
    object qryListTITLE: TWideStringField
      FieldName = 'TITLE'
      Origin = 'TITLE'
      Size = 50
    end
    object qryListACTIVEX: TSmallintField
      FieldName = 'ACTIVEX'
      Origin = 'ACTIVEX'
      Required = True
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
