unit BasisDialogToolBarGrid_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasisDialogToolBar_u, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxControls, cxContainer,
  cxEdit, System.Actions, Vcl.ActnList, dxBar, cxClasses, cxLabel, Vcl.StdCtrls,
  cxButtons, Vcl.ExtCtrls, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid;

type
  TfrmBasisDialogToolBarGrid = class(TfrmBasisDialogToolBar)
    GD: TcxGrid;
    LV: TcxGridLevel;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmBasisDialogToolBarGrid: TfrmBasisDialogToolBarGrid;

implementation

uses
  xGlobalVars_u;

{$R *.dfm}

end.
