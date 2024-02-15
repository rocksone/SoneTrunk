unit CommunicationTypeList_u;

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
  TfrmCommunicationTypeList = class(T_frmBasisFormToolBar)
    GDList: TcxGrid;
    TVList: TcxGridDBTableView;
    LVList: TcxGridLevel;
    qryList: TFDQuery;
    dsList: TDataSource;
    FDS: TFDStoredProc;
    TRS: TFDTransaction;
    qryListCOMUNICATIONTYPE_ID: TFDAutoIncField;
    qryListICON: TSmallintField;
    qryListSORDER: TSmallintField;
    qryListACTIVEX: TSmallintField;
    qryListCOMUNICATIONPROTOCOL_ID: TIntegerField;
    qryListCOMUNICATIONTYPE: TWideStringField;
    TVListCOMUNICATIONTYPE_ID: TcxGridDBColumn;
    TVListICON: TcxGridDBColumn;
    TVListSORDER: TcxGridDBColumn;
    TVListACTIVEX: TcxGridDBColumn;
    TVListCOMUNICATIONPROTOCOL_ID: TcxGridDBColumn;
    TVListCOMUNICATIONTYPE: TcxGridDBColumn;
    procedure actEditExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure dxFormClose(Sender: TObject; var Action: TCloseAction);
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
  frmCommunicationTypeList: TfrmCommunicationTypeList;

implementation

uses
  dmStyle_u,
  dmDatabase_u,
  CommunicationTypeEdit_u;

{$R *.dfm}

procedure TfrmCommunicationTypeList.FormCreate(Sender: TObject);
begin
  inherited;
  qryList.Open();
{$IFDEF DEBUG}
  TVListCOMUNICATIONTYPE_ID.Visible := True;
{$ENDIF}
end;

procedure TfrmCommunicationTypeList.CallEditForm;
var
  SModal: TfrmCommunicationEdit;
begin
  SModal := TfrmCommunicationEdit.SetStart(self, FID, FWinMode);
  try
    if SModal.ShowModal = mrok then
      qryList.Refresh;
  finally
    SModal.Free;
  end;
end;

procedure TfrmCommunicationTypeList.qryListBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qryList.ParamByName('LNG').AsInteger := APP.SYS_LNG_ID;
end;

procedure TfrmCommunicationTypeList.actEditExecute(Sender: TObject);
begin
  inherited;
  FWinMode := WinModeEdit;
  FID := qryListCOMUNICATIONTYPE_ID.AsInteger;
  CallEditForm;
end;

procedure TfrmCommunicationTypeList.actInsertExecute(Sender: TObject);
begin
  inherited;
  FWinMode := WinModeInsert;
  FDS.Prepare;
  FDS.Params[0].AsString := 'CON_COMUNICATIONTYPE';
  FDS.Params[1].AsString := 'COMUNICATIONTYPE_ID';
  FDS.OpenOrExecute;
  FID := FDS.Fields[0].AsInteger;
  CallEditForm;
end;

procedure TfrmCommunicationTypeList.actRefreshExecute(Sender: TObject);
begin
  inherited;
  qryList.Refresh;
end;

procedure TfrmCommunicationTypeList.dxFormClose(Sender: TObject; var Action:
    TCloseAction);
begin
  inherited;
  Action := caFree; // Only For MDI
end;

procedure TfrmCommunicationTypeList.TVListCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  actEdit.Execute;
end;

end.
