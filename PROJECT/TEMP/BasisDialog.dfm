inherited _frmBasisDialog: T_frmBasisDialog
  BorderStyle = bsDialog
  Caption = 'Dialog'
  ClientHeight = 372
  ClientWidth = 792
  Position = poMainFormCenter
  OnKeyPress = FormKeyPress
  ExplicitWidth = 810
  ExplicitHeight = 413
  TextHeight = 13
  object pnlTop: TdxPanel [0]
    Left = 0
    Top = 0
    Width = 792
    Height = 40
    Align = alTop
    Frame.Color = clGray
    Frame.Borders = [bBottom]
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    ExplicitWidth = 796
    object lbFormTitle: TcxLabel
      AlignWithMargins = True
      Left = 15
      Top = 3
      Margins.Left = 15
      Align = alLeft
      Caption = 'lbFormTitle'
      ParentFont = False
      Style.StyleController = dmStyle.styleTitle
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      AnchorY = 20
    end
  end
  object pnlBotton: TdxPanel [1]
    Left = 0
    Top = 332
    Width = 792
    Height = 40
    Align = alBottom
    Frame.Color = clSilver
    Frame.Borders = [bTop]
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
    ExplicitTop = 339
    ExplicitWidth = 465
    object btnCancel: TcxButton
      AlignWithMargins = True
      Left = 693
      Top = 6
      Width = 125
      Height = 27
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Align = alRight
      Caption = '&Abbrechen'
      ModalResult = 2
      OptionsImage.ImageIndex = 2
      OptionsImage.Images = dmStyle.imlButtons
      TabOrder = 1
      ExplicitLeft = 334
    end
    object btnOK: TcxButton
      AlignWithMargins = True
      Left = 562
      Top = 6
      Width = 125
      Height = 27
      Margins.Top = 6
      Margins.Bottom = 6
      Align = alRight
      Caption = '&Speichern'
      ModalResult = 1
      OptionsImage.ImageIndex = 0
      OptionsImage.Images = dmStyle.imlButtons
      TabOrder = 0
      OnClick = actDlgOkExecute
      ExplicitLeft = 203
    end
  end
end
