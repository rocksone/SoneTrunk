unit PositionList_u;

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
  TfrmPositionList = class(T_frmBasisFormToolBar)
    GDList: TcxGrid;
    TVList: TcxGridDBTableView;
    LVList: TcxGridLevel;
    qryList: TFDQuery;
    dsList: TDataSource;
    FDS: TFDStoredProc;
    TRS: TFDTransaction;
    qryListPOSITION_ID: TFDAutoIncField;
    qryListPOSITIONX: TWideStringField;
    qryListACTIVEX: TSmallintField;
    TVListPOSITION_ID: TcxGridDBColumn;
    TVListPOSITIONX: TcxGridDBColumn;
    TVListACTIVEX: TcxGridDBColumn;
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
  frmPositionList: TfrmPositionList;

implementation

uses
  dmStyle_u,
  dmDatabase_u,
  PositionEdit_u;

{$R *.dfm}

procedure TfrmPositionList.FormCreate(Sender: TObject);
begin
  inherited;
  qryList.Open();
{$IFDEF DEBUG}
  TVListPOSITION_ID.Visible := True;
{$ENDIF}
end;

procedure TfrmPositionList.CallEditForm;
var
  SModal: TfrmPositionEdit;
begin
  SModal := TfrmPositionEdit.SetStart(self, FID, FWinMode);
  try
    if SModal.ShowModal = mrok then
      qryList.Refresh;
  finally
    SModal.Free;
  end;
end;

procedure TfrmPositionList.qryListBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qryList.ParamByName('LNG').AsInteger := APP.SYS_LNG_ID;
end;

procedure TfrmPositionList.actEditExecute(Sender: TObject);
begin
  inherited;
  FWinMode := WinModeEdit;
  FID := qryListPOSITION_ID.AsInteger;
  CallEditForm;
end;

procedure TfrmPositionList.actInsertExecute(Sender: TObject);
begin
  inherited;
  FWinMode := WinModeInsert;
  FDS.Prepare;
  FDS.Params[0].AsString := 'CON_POSITION';
  FDS.Params[1].AsString := 'POSITION_ID';
  FDS.OpenOrExecute;
  FID := FDS.Fields[0].AsInteger;
  FDS.Close;
  CallEditForm;
end;

procedure TfrmPositionList.TVListCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  actEdit.Execute;
end;

end.
