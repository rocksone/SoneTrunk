unit IndustrialSectorList_u;

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
  TfrmIndustrialSectorList = class(T_frmBasisFormToolBar)
    GDList: TcxGrid;
    TVList: TcxGridDBTableView;
    LVList: TcxGridLevel;
    qryList: TFDQuery;
    dsList: TDataSource;
    FDS: TFDStoredProc;
    TRS: TFDTransaction;
    qryListINDUSTRYSECTORS_ID: TFDAutoIncField;
    qryListCODE: TIntegerField;
    qryListACTIVEX: TSmallintField;
    qryListINDUSTRYSECTOR: TWideStringField;
    TVListINDUSTRYSECTORS_ID: TcxGridDBColumn;
    TVListCODE: TcxGridDBColumn;
    TVListACTIVEX: TcxGridDBColumn;
    TVListINDUSTRYSECTOR: TcxGridDBColumn;
    procedure actEditExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
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
  frmIndustrialSectorList: TfrmIndustrialSectorList;

implementation

uses
  dmStyle_u,
  dmDatabase_u,
  IndustrialSectorEdit_u;

{$R *.dfm}

procedure TfrmIndustrialSectorList.FormCreate(Sender: TObject);
begin
  inherited;
  qryList.Open();
{$IFDEF DEBUG}
  TVListINDUSTRYSECTORS_ID.Visible := True;
{$ENDIF}
end;

procedure TfrmIndustrialSectorList.CallEditForm;
var
  SModal: TfrmIndustrialSectorEdit;
begin
  SModal := TfrmIndustrialSectorEdit.SetStart(self, FID, FWinMode);
  try
    if SModal.ShowModal = mrok then
      qryList.Refresh;
  finally
    SModal.Free;
  end;
end;

procedure TfrmIndustrialSectorList.qryListBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qryList.ParamByName('LNG').AsInteger := APP.SYS_LNG_ID;
end;

procedure TfrmIndustrialSectorList.actEditExecute(Sender: TObject);
begin
  inherited;
  FWinMode := WinModeEdit;
  FID := qryListINDUSTRYSECTORS_ID.AsInteger;
  CallEditForm;
end;

procedure TfrmIndustrialSectorList.actInsertExecute(Sender: TObject);
begin
  inherited;
  FWinMode := WinModeInsert;
  FDS.Prepare;
  FDS.Params[0].AsString := 'CON_INDUSTRYSECTORS';
  FDS.Params[1].AsString := 'INDUSTRYSECTORS_ID';
  FDS.OpenOrExecute;
  FID := FDS.Fields[0].AsInteger;
  FDS.Close;
  CallEditForm;
end;

procedure TfrmIndustrialSectorList.TVListCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  actEdit.Execute;
end;

end.
