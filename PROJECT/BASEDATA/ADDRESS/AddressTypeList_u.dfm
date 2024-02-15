inherited frmAddressTypeList: TfrmAddressTypeList
  Caption = 'ADRESSTYP'
  ClientHeight = 505
  ClientWidth = 1086
  FormStyle = fsMDIChild
  Visible = True
  ExplicitWidth = 1100
  ExplicitHeight = 545
  TextHeight = 13
  object GDList: TcxGrid [0]
    AlignWithMargins = True
    Left = 3
    Top = 41
    Width = 1080
    Height = 461
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitWidth = 1076
    ExplicitHeight = 460
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
      object TVListADDRESSTYPE_ID: TcxGridDBColumn
        DataBinding.FieldName = 'ADDRESSTYPE_ID'
        Visible = False
        VisibleForCustomization = False
        Width = 110
      end
      object TVListICON: TcxGridDBColumn
        DataBinding.FieldName = 'ICON'
        RepositoryItem = dmStyle.icbAdresseType
        Width = 68
      end
      object TVListSORDER: TcxGridDBColumn
        DataBinding.FieldName = 'SORDER'
        Width = 112
      end
      object TVListADDRESSTYPE: TcxGridDBColumn
        DataBinding.FieldName = 'ADDRESSTYPE'
        Width = 794
      end
      object TVListACTIVEX: TcxGridDBColumn
        DataBinding.FieldName = 'ACTIVEX'
        RepositoryItem = dmStyle.icbActive
        Width = 112
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
    UpdateOptions.KeyFields = 'ADDRESSTYPE_ID'
    SQL.Strings = (
      'SELECT '
      '    CON_ADDRESSTYPE.ADDRESSTYPE_ID,'
      '    CON_ADDRESSTYPE.ICON,'
      '    CON_ADDRESSTYPE.SORDER,'
      '    CON_ADDRESSTYPERES.ADDRESSTYPE,'
      '    CON_ADDRESSTYPE.ACTIVEX'
      'FROM CON_ADDRESSTYPE'
      
        '   INNER JOIN CON_ADDRESSTYPERES ON (CON_ADDRESSTYPE.ADDRESSTYPE' +
        '_ID = CON_ADDRESSTYPERES.ADDRESSTYPE_ID)'
      'WHERE '
      ''
      'CON_ADDRESSTYPE.ACTIVEX = 1 and'
      'CON_ADDRESSTYPERES.LANGUAGE_ID = :LNG'
      ''
      'ORDER BY CON_ADDRESSTYPE.SORDER')
    Left = 245
    Top = 446
    ParamData = <
      item
        Name = 'LNG'
        DataType = ftInteger
        ParamType = ptInput
        Value = 32
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
      DisplayLabel = 'SORTIERUNG'
      FieldName = 'SORDER'
      Origin = 'SORDER'
    end
    object qryListADDRESSTYPE: TWideStringField
      DisplayLabel = 'ADRESSTYP'
      FieldName = 'ADDRESSTYPE'
      Origin = 'ADDRESSTYPE'
      Size = 75
    end
    object qryListACTIVEX: TSmallintField
      DisplayLabel = 'AKTIV'
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
