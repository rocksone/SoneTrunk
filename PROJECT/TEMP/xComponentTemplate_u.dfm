object _frmComponentTemplate: T_frmComponentTemplate
  Left = 0
  Top = 0
  Caption = '_frmComponentTemplate'
  ClientHeight = 479
  ClientWidth = 941
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 13
  object pcTemplate: TcxPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 935
    Height = 473
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = tsLabelEdits
    Properties.CustomButtons.Buttons = <>
    ExplicitWidth = 931
    ExplicitHeight = 472
    ClientRectBottom = 469
    ClientRectLeft = 4
    ClientRectRight = 931
    ClientRectTop = 24
    object tsLabelEdits: TcxTabSheet
      Caption = 'Label & Edits'
      ImageIndex = 0
      object cxLabel3: TcxLabel
        Left = 19
        Top = 40
        AutoSize = False
        Caption = ' Normal'
        ParentColor = False
        Style.StyleController = dmStyle.styleLabel
        Properties.Alignment.Vert = taVCenter
        Height = 21
        Width = 150
        AnchorY = 51
      end
      object cxTextEdit1: TcxTextEdit
        Left = 175
        Top = 41
        Style.StyleController = dmStyle.stylecEdit
        TabOrder = 2
        Text = 'cxTextEdit1'
        Width = 121
      end
      object cxTextEdit3: TcxTextEdit
        Left = 175
        Top = 96
        Enabled = False
        TabOrder = 9
        Text = 'cxTextEdit1'
        Width = 121
      end
      object cxLabel2: TcxLabel
        Left = 19
        Top = 95
        AutoSize = False
        Caption = ' Disabled'
        ParentColor = False
        Style.StyleController = dmStyle.styleLabel
        Properties.Alignment.Vert = taVCenter
        Height = 21
        Width = 150
        AnchorY = 106
      end
      object cxLabel4: TcxLabel
        Left = 19
        Top = 14
        Caption = 'cxLabel3'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.StyleController = dmStyle.styleTitle
        Style.TextColor = 4605510
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object cxTextEdit2: TcxTextEdit
        Left = 175
        Top = 69
        TabOrder = 6
        Text = 'cxTextEdit1'
        Width = 121
      end
      object cxLabel1: TcxLabel
        Left = 19
        Top = 67
        AutoSize = False
        Caption = ' Requiered'
        ParentColor = False
        Style.LookAndFeel.NativeStyle = True
        Style.StyleController = dmStyle.styleLabel
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        Properties.Alignment.Vert = taVCenter
        Height = 21
        Width = 150
        AnchorY = 78
      end
      object cxComboBox1: TcxComboBox
        Left = 302
        Top = 41
        Style.StyleController = dmStyle.stylecEdit
        TabOrder = 3
        Text = 'cxComboBox1'
        Width = 121
      end
      object cxComboBox2: TcxComboBox
        Left = 302
        Top = 69
        TabOrder = 7
        Text = 'cxComboBox1'
        Width = 121
      end
      object cxComboBox3: TcxComboBox
        Left = 302
        Top = 96
        Enabled = False
        TabOrder = 10
        Text = 'cxComboBox1'
        Width = 121
      end
      object cxLookupComboBox1: TcxLookupComboBox
        Left = 429
        Top = 41
        Properties.ListColumns = <>
        TabOrder = 4
        Width = 145
      end
    end
    object tsPanel: TcxTabSheet
      Caption = 'tsPanel'
      ImageIndex = 1
      ExplicitWidth = 923
      ExplicitHeight = 444
      object pcMain: TcxPageControl
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 220
        Height = 435
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alLeft
        TabOrder = 2
        Properties.ActivePage = tsClientData
        Properties.CustomButtons.Buttons = <>
        Properties.Images = dmStyle.imlNav24
        Properties.NavigatorPosition = npLeftTop
        Properties.Rotate = True
        Properties.TabCaptionAlignment = taLeftJustify
        Properties.TabHeight = 35
        Properties.TabPosition = tpLeft
        Properties.TabWidth = 150
        LookAndFeel.NativeStyle = True
        ExplicitHeight = 434
        ClientRectBottom = 431
        ClientRectLeft = 156
        ClientRectRight = 216
        ClientRectTop = 4
        object tsBaseData: TcxTabSheet
          Caption = 'Stammdaten'
          ImageIndex = 0
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
        end
        object tsClientData: TcxTabSheet
          Caption = 'Kundendaten'
          ImageIndex = 1
          ExplicitHeight = 426
        end
        object tsSupplierData: TcxTabSheet
          Caption = 'Lieferantendaten'
          ImageIndex = 2
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object gbx: TcxGroupBox
            Left = 80
            Top = 152
            Caption = 'gbx'
            TabOrder = 0
            Height = 105
            Width = 185
          end
        end
        object tsComunication: TcxTabSheet
          Caption = 'Komunikation'
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
        end
        object tsInvoiceData: TcxTabSheet
          Caption = 'Rechungsdaten'
          ImageIndex = 4
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
        end
        object tsReports: TcxTabSheet
          Caption = 'Formulare'
          ImageIndex = 5
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
        end
        object tsPayment: TcxTabSheet
          Caption = 'Zahlungskonditionen'
          ImageIndex = 6
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
        end
        object tsAddressData: TcxTabSheet
          Caption = 'Adressdaten'
          ImageIndex = 7
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
        end
        object tsEmployee: TcxTabSheet
          Caption = 'Ansprechpartner'
          ImageIndex = 8
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
        end
        object tsBankdetails: TcxTabSheet
          Caption = 'Bankverbindung'
          ImageIndex = 9
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
        end
        object tsTodo: TcxTabSheet
          Caption = 'Aufgaben / Termine'
          ImageIndex = 10
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
        end
      end
      object cxtbcntrl1: TcxTabControl
        Left = 233
        Top = 3
        Width = 289
        Height = 193
        TabOrder = 0
        Properties.CustomButtons.Buttons = <>
        Properties.Images = dmStyle.imlNav24
        Properties.TabIndex = 1
        Properties.Tabs.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6')
        ClientRectBottom = 189
        ClientRectLeft = 4
        ClientRectRight = 285
        ClientRectTop = 33
      end
      object dxPanel1: TdxPanel
        AlignWithMargins = True
        Left = 648
        Top = 3
        Width = 276
        Height = 439
        Align = alRight
        Frame.Color = clSilver
        Color = 15987699
        TabOrder = 1
        ExplicitLeft = 644
        ExplicitHeight = 438
        object pnlDefault: TdxPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 268
          Height = 97
          Align = alTop
          Frame.Color = clSilver
          Color = clWhite
          TabOrder = 0
        end
        object cxGroupBox1: TcxGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 106
          Align = alTop
          Caption = 'GroupBox'
          ParentBackground = False
          ParentColor = False
          Style.Color = clWhite
          Style.TransparentBorder = True
          TabOrder = 1
          Height = 105
          Width = 268
        end
      end
    end
    object cxTabSheet1: TcxTabSheet
      Caption = 'Grid'
      ImageIndex = 2
      object GD: TcxGrid
        AlignWithMargins = True
        Left = 0
        Top = 3
        Width = 927
        Height = 439
        Margins.Left = 0
        Margins.Right = 0
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        TabOrder = 0
        object TV: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          FindPanel.Behavior = fcbSearch
          FindPanel.DisplayMode = fpdmAlways
          FindPanel.InfoText = 'Geben Sie Text f'#252'r die Suche ein...'
          FindPanel.Layout = fplCompact
          ScrollbarAnnotations.CustomAnnotations = <>
          DataController.DataSource = dmContact.dsClientList
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.DataRowHeight = 25
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 30
          Styles.StyleSheet = dmStyle.GDTV
        end
        object TVVendor: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          FindPanel.DisplayMode = fpdmAlways
          FindPanel.InfoText = 'Geben Sie Text f'#252'r die Suche ein...'
          ScrollbarAnnotations.CustomAnnotations = <>
          DataController.DataSource = dmContact.dsVendorList
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.DataRowHeight = 25
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 30
          Styles.StyleSheet = dmStyle.GDTV
          object TVVendorContactArt: TcxGridDBColumn
            Caption = 'ART'
            DataBinding.FieldName = 'ContactArt'
            RepositoryItem = dmStyle.icbPrivatFirma
            HeaderAlignmentHorz = taCenter
            HeaderHint = 'Art des Liefenten: Privat / Firma'
            MinWidth = 35
            Options.AutoWidthSizable = False
            Width = 35
          end
          object TVVendorMatchCode: TcxGridDBColumn
            Caption = 'SUCHCODE'
            DataBinding.FieldName = 'MatchCode'
            MinWidth = 185
            Width = 185
          end
          object TVVendorContactNr: TcxGridDBColumn
            Caption = 'KD-Nr.'
            DataBinding.FieldName = 'ContactNr'
            DataBinding.IsNullValueType = True
            HeaderHint = 'Kunden-Nr.'
            MinWidth = 60
            Options.AutoWidthSizable = False
            Width = 60
          end
          object TVVendorExternNr: TcxGridDBColumn
            Caption = 'E-KD-Nr.'
            DataBinding.FieldName = 'ExternNr'
            HeaderHint = 'Externe Kunden-Nr.'
            MinWidth = 60
            Options.AutoWidthSizable = False
            Width = 60
          end
          object TVVendorClient: TcxGridDBColumn
            Caption = 'Name'
            DataBinding.FieldName = 'Client'
            DataBinding.IsNullValueType = True
            HeaderHint = 'Lieferantname oder Firmenname'
            MinWidth = 150
            Width = 150
          end
          object TVVendorCounty: TcxGridDBColumn
            Caption = 'LAND'
            DataBinding.FieldName = 'County'
            DataBinding.IsNullValueType = True
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            MinWidth = 60
            Options.AutoWidthSizable = False
            Width = 60
          end
          object TVVendorPC: TcxGridDBColumn
            Caption = 'PLZ'
            DataBinding.FieldName = 'PC'
            DataBinding.IsNullValueType = True
            MinWidth = 50
            Options.AutoWidthSizable = False
            Width = 50
          end
          object TVVendorCity: TcxGridDBColumn
            Caption = 'STADT'
            DataBinding.FieldName = 'City'
            MinWidth = 120
            Options.AutoWidthSizable = False
            Width = 120
          end
          object TVVendorVatIDNr: TcxGridDBColumn
            DataBinding.FieldName = 'VatIDNr'
            MinWidth = 90
            Options.AutoWidthSizable = False
            Width = 90
          end
          object TVVendorTaxNumber: TcxGridDBColumn
            DataBinding.FieldName = 'TaxNumber'
            MinWidth = 90
            Options.AutoWidthSizable = False
            Width = 90
          end
          object TVVendorProcess: TcxGridDBColumn
            Caption = 'VORG'#196'NGE'
            DataBinding.FieldName = 'Process'
            MinWidth = 70
            Options.AutoWidthSizable = False
            Width = 70
          end
          object TVVendorStatus: TcxGridDBColumn
            Caption = '[S]'
            DataBinding.FieldName = 'Status'
            DataBinding.IsNullValueType = True
            RepositoryItem = dmStyle.icbStatus
            HeaderAlignmentHorz = taCenter
            HeaderHint = 'Lieferanten Status'
            MinWidth = 40
            Options.AutoWidthSizable = False
            Width = 40
          end
        end
        object LV: TcxGridLevel
          GridView = TV
        end
      end
    end
  end
  object FDQuery3: TFDQuery
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
    Left = 120
    Top = 216
  end
  object DataSource3: TDataSource
    DataSet = FDQuery3
    Left = 201
    Top = 216
  end
end
