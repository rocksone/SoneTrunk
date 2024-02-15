unit TaxAreaList_u;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Actions,
  Data.DB,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ActnList,
  BasisFormToolBar_u,
  dxBar,
  cxClasses,
  JvComponentBase,
  JvEnterTab,
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxStyles,
  cxCustomData,
  cxFilter,
  cxData,
  cxDataStorage,
  cxEdit,
  cxNavigator,
  dxDateRanges,
  dxScrollbarAnnotations,
  cxDBData,
  cxGridLevel,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxGridCustomView,
  cxGrid,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  xGlobalVars_u;

type
  TfrmTaxAreaList = class(T_frmBasisFormToolBar)
    GDList: TcxGrid;
    TVList: TcxGridDBTableView;
    LVList: TcxGridLevel;
    qryList: TFDQuery;
    dsList: TDataSource;
    FDS: TFDStoredProc;
    TRS: TFDTransaction;
    qryListTAXAREA_ID: TIntegerField;
    qryListACTIVEX: TSmallintField;
    qryListLANGUAGE_ID: TIntegerField;
    qryListTAXAREA: TWideStringField;
    TVListTAXAREA_ID: TcxGridDBColumn;
    TVListACTIVEX: TcxGridDBColumn;
    TVListLANGUAGE_ID: TcxGridDBColumn;
    TVListTAXAREA: TcxGridDBColumn;
    procedure actEditExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryListBeforeOpen(DataSet: TDataSet);
    procedure TVListCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState;
      var AHandled: Boolean);
  private
    FWinMode: TWinMode;
    FID: Integer;
    procedure CallEditForm;
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmTaxAreaList: TfrmTaxAreaList;

implementation

uses
  dmStyle_u,
  dmDatabase_u,
  TaxAreaEdit_u;

{$R *.dfm}

procedure TfrmTaxAreaList.FormCreate(Sender: TObject);
begin
  inherited;
  qryList.Open();
{$IFDEF DEBUG}
  TVListTAXAREA_ID.Visible := True;
{$ENDIF}
end;

procedure TfrmTaxAreaList.CallEditForm;
var
  SModal: TfrmTaxAreaEdit;
begin
  SModal := TfrmTaxAreaEdit.SetStart(self, FID, FWinMode);
  try
    if SModal.ShowModal = mrok then
      qryList.Refresh;
  finally
    SModal.Free;
  end;
end;

procedure TfrmTaxAreaList.qryListBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qryList.ParamByName('LNG').AsInteger := APP.SYS_LNG_ID;
end;

procedure TfrmTaxAreaList.actEditExecute(Sender: TObject);
begin
  inherited;
  FWinMode := WinModeEdit;
  FID := qryListTAXAREA_ID.AsInteger;
  CallEditForm;
end;

procedure TfrmTaxAreaList.actInsertExecute(Sender: TObject);
begin
  inherited;
  FWinMode := WinModeInsert;
 // FDS.Prepare;
  FDS.Params[0].AsString := 'FIN_TAXAREA';
  FDS.Params[1].AsString := 'TAXAREA_ID';
  FDS.OpenOrExecute;
  FID := FDS.Fields[0].AsInteger;
  FDS.Close;
  CallEditForm;
end;

procedure TfrmTaxAreaList.actRefreshExecute(Sender: TObject);
begin
  inherited;
    qryList.Refresh;
end;

procedure TfrmTaxAreaList.TVListCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  actEdit.Execute;
end;

end.
