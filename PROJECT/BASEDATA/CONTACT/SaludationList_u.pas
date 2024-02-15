unit SaludationList_u;

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
  TfrmSaludationList = class(T_frmBasisFormToolBar)
    GDSaludation: TcxGrid;
    TVSaludation: TcxGridDBTableView;
    LVSaludation: TcxGridLevel;
    qrySaludationList: TFDQuery;
    dsSaludation: TDataSource;
    qrySaludationListSALUDATION_ID: TFDAutoIncField;
    qrySaludationListSALUDATION: TWideStringField;
    qrySaludationListLETTERSALUTATION: TWideStringField;
    qrySaludationListGENDER: TSmallintField;
    TVSaludationSALUDATION_ID: TcxGridDBColumn;
    TVSaludationSALUDATION: TcxGridDBColumn;
    TVSaludationLETTERSALUTATION: TcxGridDBColumn;
    TVSaludationGENDER: TcxGridDBColumn;
    qrySaludationListACTIVEX: TSmallintField;
    TVSaludationACTIVEX: TcxGridDBColumn;
    FDS: TFDStoredProc;
    FDTransaction1: TFDTransaction;
    procedure actEditExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qrySaludationListBeforeOpen(DataSet: TDataSet);
    procedure TVSaludationCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState;
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
  frmSaludationList: TfrmSaludationList;

implementation

uses
  SaludationEdit_u,
  dmStyle_u,
  dmDatabase_u;

{$R *.dfm}

procedure TfrmSaludationList.actEditExecute(Sender: TObject);
begin
  inherited;
  FWinMode := WinModeEdit;
  FID := qrySaludationListSALUDATION_ID.AsInteger;
  CallEditForm;
end;

procedure TfrmSaludationList.actInsertExecute(Sender: TObject);
begin
  inherited;
  FWinMode := WinModeInsert;
  FDS.Prepare;
  FDS.Params[0].AsString := 'CON_SALUDATION';
  FDS.Params[1].AsString := 'SALUDATION_ID';
  FDS.OpenOrExecute;
  FID := FDS.Fields[0].AsInteger;
  FDS.Close;
  CallEditForm;
end;

procedure TfrmSaludationList.FormCreate(Sender: TObject);
begin
  inherited;
  qrySaludationList.Open();
   {$IFDEF DEBUG}
   TVSaludationSALUDATION_ID.Visible := True;
   {$ELSE}
   TVSaludationSALUDATION_ID.Visible := false;
    {$ENDIF}
end;

procedure TfrmSaludationList.CallEditForm;
var
  SModal: TfrmSaludationEdit;
begin
  SModal := TfrmSaludationEdit.SetStart(self, FID, FWinMode);
  try
    if SModal.ShowModal = mrok then
      qrySaludationList.Refresh;
  finally
    SModal.Free;
  end;
end;

procedure TfrmSaludationList.qrySaludationListBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qrySaludationList.ParamByName('LNG').AsInteger := APP.SYS_LNG_ID;
end;

procedure TfrmSaludationList.TVSaludationCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  actEdit.Execute;
end;

end.
