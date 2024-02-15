unit BasisFormToolBarGrid_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasisFormToolBar_u, dxBar, cxClasses,
  System.Actions, Vcl.ActnList, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations,
  Data.DB, cxDBData, cxLabel, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid;

type
  TfrmBasisFormToolBarGrid = class(TfrmBasisFormToolBar)
    GD: TcxGrid;
    LV: TcxGridLevel;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmBasisFormToolBarGrid: TfrmBasisFormToolBarGrid;

implementation

{$R *.dfm}

end.
