inherited frmBasisDialogToolBarGrid: TfrmBasisDialogToolBarGrid
  Caption = 'frmBasisDialogToolBarGrid'
  ClientHeight = 403
  ClientWidth = 780
  ExplicitWidth = 796
  ExplicitHeight = 442
  TextHeight = 13
  inherited pnlBotton: TPanel
    Top = 370
    Width = 780
    ExplicitTop = 373
    ExplicitWidth = 792
    inherited btnOK: TcxButton
      Left = 587
      ExplicitLeft = 583
    end
    inherited btnCancel: TcxButton
      Left = 693
      ExplicitLeft = 689
    end
  end
  inherited pnlTop: TPanel
    Width = 780
    ExplicitWidth = 784
    inherited lbFormTitle: TcxLabel
      AnchorY = 16
    end
  end
  object GD: TcxGrid [2]
    AlignWithMargins = True
    Left = 0
    Top = 74
    Width = 780
    Height = 293
    Margins.Left = 0
    Margins.Right = 0
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    TabOrder = 6
    ExplicitWidth = 792
    ExplicitHeight = 296
    object LV: TcxGridLevel
    end
  end
  inherited bm1: TdxBarManager
    PixelsPerInch = 96
  end
end
