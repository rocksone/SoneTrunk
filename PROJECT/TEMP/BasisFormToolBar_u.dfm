inherited _frmBasisFormToolBar: T_frmBasisFormToolBar
  Caption = '_frmBasisFormToolBar'
  ClientHeight = 495
  ClientWidth = 700
  ExplicitWidth = 718
  ExplicitHeight = 536
  TextHeight = 13
  object act: TActionList [0]
    Images = dmStyle.imlNavToolBar
    Left = 8
    Top = 219
    object actInsert: TAction
      Category = 'Basics'
      Caption = 'Neu'
      ImageIndex = 0
    end
    object actPost: TAction
      Category = 'Basics'
      Caption = 'Speichern'
      ImageIndex = 2
    end
    object actEdit: TAction
      Category = 'Basics'
      Caption = 'Bearbeiten'
      ImageIndex = 3
    end
    object actRefresh: TAction
      Category = 'Basics'
      Caption = 'Aktualisieren'
      ImageIndex = 10
    end
    object actCancel: TAction
      Category = 'Basics'
      Caption = 'Abbrechen'
      ImageIndex = 6
    end
    object actDelete: TAction
      Category = 'Basics'
      Caption = 'L'#246'schen'
      ImageIndex = 9
    end
    object actLanguage: TAction
      Category = 'Extas'
      Caption = 'Sprachen'
      ImageIndex = 17
    end
    object actPrint: TAction
      Category = 'Extas'
      Caption = 'Drucken'
      ImageIndex = 16
    end
    object actExport: TAction
      Category = 'Extas'
      Caption = 'Exportieren'
      ImageIndex = 18
    end
  end
  object bm: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.LargeImages = dmStyle.imlNavToolBar
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 55
    Top = 219
    PixelsPerInch = 96
    DockControlHeights = (
      0
      0
      38
      0)
    object bmBarEdit: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      BorderStyle = bbsNone
      Caption = 'barEdit'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 593
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbInsert'
        end
        item
          Visible = True
          ItemName = 'bbEdit'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbPost'
        end
        item
          Visible = True
          ItemName = 'bbCancel'
        end
        item
          Visible = True
          ItemName = 'bbRefresh'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbDelete'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbPrint'
        end
        item
          Visible = True
          ItemName = 'bbExport'
        end
        item
          Visible = True
          ItemName = 'bbLanguage'
        end>
      OneOnRow = True
      Row = 0
      ShowMark = False
      SizeGrip = False
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = True
    end
    object bbInsert: TdxBarLargeButton
      Action = actInsert
      Category = 0
    end
    object bbEdit: TdxBarLargeButton
      Action = actEdit
      Category = 0
    end
    object bbDelete: TdxBarLargeButton
      Action = actDelete
      Category = 0
    end
    object bbLanguage: TdxBarLargeButton
      Action = actLanguage
      Category = 0
      Visible = ivNever
    end
    object bbPost: TdxBarLargeButton
      Action = actPost
      Category = 0
    end
    object bbCancel: TdxBarLargeButton
      Action = actCancel
      Category = 0
    end
    object bbRefresh: TdxBarLargeButton
      Action = actRefresh
      Category = 0
    end
    object bbPrint: TdxBarLargeButton
      Action = actPrint
      Category = 0
    end
    object bbExport: TdxBarLargeButton
      Action = actExport
      Category = 0
    end
  end
end
