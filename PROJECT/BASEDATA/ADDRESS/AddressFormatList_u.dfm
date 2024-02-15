inherited frmAddressFormatList: TfrmAddressFormatList
  Caption = 'frmAddressFormatList'
  ClientHeight = 504
  ClientWidth = 1082
  FormStyle = fsMDIChild
  Visible = True
  ExplicitWidth = 1096
  ExplicitHeight = 544
  TextHeight = 13
  object GDList: TcxGrid [0]
    AlignWithMargins = True
    Left = 3
    Top = 41
    Width = 1076
    Height = 460
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitWidth = 1072
    ExplicitHeight = 459
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
      object TVListADDRESSFORMAT_ID: TcxGridDBColumn
        DataBinding.FieldName = 'ADDRESSFORMAT_ID'
        Width = 125
      end
      object TVListCOUNTRY_ID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRY_ID'
        Width = 78
      end
      object TVListCOUNTRY: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRY'
        Width = 66
      end
      object TVListDESCRIPTION: TcxGridDBColumn
        DataBinding.FieldName = 'DESCRIPTION'
        Width = 132
      end
      object TVListADDRESSFORMAT: TcxGridDBColumn
        DataBinding.FieldName = 'ADDRESSFORMAT'
        PropertiesClassName = 'TcxBlobEditProperties'
        Width = 653
      end
      object TVListACTIVEX: TcxGridDBColumn
        DataBinding.FieldName = 'ACTIVEX'
        Width = 20
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
    UpdateOptions.KeyFields = 'ADDRESSFORMAT_ID'
    SQL.Strings = (
      'SELECT '
      '    CON_ADDRESSFORMAT.ADDRESSFORMAT_ID,'
      '    CON_ADDRESSFORMAT.COUNTRY_ID,'
      '    CON_ADDRESSFORMAT.DESCRIPTION,'
      '    CON_ADDRESSFORMAT.ADDRESSFORMAT,'
      '    CON_ADDRESSFORMAT.ACTIVEX,'
      '    GEO_COUNTRYRES.COUNTRY'
      ''
      'FROM GEO_COUNTRYRES'
      
        '   INNER JOIN GEO_COUNTRY ON (GEO_COUNTRYRES.COUNTRY_ID = GEO_CO' +
        'UNTRY.COUNTRY_ID)'
      
        '   INNER JOIN CON_ADDRESSFORMAT ON (GEO_COUNTRY.COUNTRY_ID = CON' +
        '_ADDRESSFORMAT.COUNTRY_ID)'
      'WHERE '
      ' '
      '   GEO_COUNTRY.ACTIVEX = 1 and'
      '   GEO_COUNTRYRES.LANGUAGE_ID = :LNG')
    Left = 245
    Top = 446
    ParamData = <
      item
        Name = 'LNG'
        DataType = ftInteger
        ParamType = ptInput
        Value = 57
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
      FieldName = 'ACTIVEX'
      Origin = 'ACTIVEX'
      Required = True
    end
    object qryListCOUNTRY: TWideStringField
      FieldName = 'COUNTRY'
      Origin = 'COUNTRY'
      Size = 50
    end
  end
  object dsList: TDataSource
    DataSet = qryList
    Left = 292
    Top = 446
  end
  object TRS: TFDTransaction
    Connection = dmDatabase.FDConnection
    Left = 198
    Top = 446
  end
end
