unit BasisDialogToolBar_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasisDialog, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, cxControls, cxContainer, cxEdit,
  System.Actions, Vcl.ActnList, cxLabel, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls,
  dxBar, cxClasses, cxImage, cxGeometry, dxFramedControl, dxPanel, JvComponentBase, JvEnterTab;

type
  T_frmBasisDialogToolBar = class(T_frmBasisDialog)
    bm1: TdxBarManager;
    barEdit: TdxBar;
    bbInsert: TdxBarLargeButton;
    bbEdit: TdxBarLargeButton;
    bbDelete: TdxBarLargeButton;
    bbLanguage: TdxBarLargeButton;
    act: TActionList;
    actInsert: TAction;
    actEdit: TAction;
    actRefresh: TAction;
    actPost: TAction;
    actCancel: TAction;
    actDelete: TAction;
    bbPost: TdxBarLargeButton;
    actLanguage: TAction;
    bbCancel: TdxBarLargeButton;
    bbRefresh: TdxBarLargeButton;
    bbPrint: TdxBarLargeButton;
    bbExport: TdxBarLargeButton;
    actPrint: TAction;
    actExport: TAction;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  _frmBasisDialogToolBar: T_frmBasisDialogToolBar;

implementation

uses
  dmStyle_u;

{$R *.dfm}

end.
