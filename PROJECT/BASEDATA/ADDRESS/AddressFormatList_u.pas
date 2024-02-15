unit AddressFormatList_u;

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
  xGlobalVars_u,
  cxBlobEdit,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet;

type
  TfrmAddressFormatList = class(T_frmBasisFormToolBar)
    GDList: TcxGrid;
    TVList: TcxGridDBTableView;
    LVList: TcxGridLevel;
    qryList: TFDQuery;
    dsList: TDataSource;
    TRS: TFDTransaction;
    qryListADDRESSFORMAT_ID: TFDAutoIncField;
    qryListCOUNTRY_ID: TIntegerField;
    qryListDESCRIPTION: TWideStringField;
    qryListADDRESSFORMAT: TWideStringField;
    qryListACTIVEX: TSmallintField;
    qryListCOUNTRY: TWideStringField;
    TVListADDRESSFORMAT_ID: TcxGridDBColumn;
    TVListCOUNTRY_ID: TcxGridDBColumn;
    TVListDESCRIPTION: TcxGridDBColumn;
    TVListADDRESSFORMAT: TcxGridDBColumn;
    TVListACTIVEX: TcxGridDBColumn;
    TVListCOUNTRY: TcxGridDBColumn;
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
  frmAddressFormatList: TfrmAddressFormatList;

implementation

uses
  dmStyle_u,
  dmDatabase_u,
  AddressFormatEdit_u;

{$R *.dfm}

procedure TfrmAddressFormatList.FormCreate(Sender: TObject);
begin
  inherited;
  qryList.Open();
{$IFDEF DEBUG}
  TVListADDRESSFORMAT_ID.Visible := True;
{$ENDIF}
end;

procedure TfrmAddressFormatList.CallEditForm;
var
  SModal: TfrmAddressFormatEdit;
begin
  SModal := TfrmAddressFormatEdit.SetStart(self, FID, FWinMode);
  try
    if SModal.ShowModal = mrok then
      qryList.Refresh;
    if FWinMode = WinModeInsert then
      qryList.Last;
  finally
    SModal.Free;
  end;
end;

procedure TfrmAddressFormatList.qryListBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qryList.ParamByName('LNG').AsInteger := APP.SYS_LNG_ID;
end;

procedure TfrmAddressFormatList.actEditExecute(Sender: TObject);
begin
  inherited;
  FWinMode := WinModeEdit;
  FID := qryListADDRESSFORMAT_ID.AsInteger;
  CallEditForm;
end;

procedure TfrmAddressFormatList.actInsertExecute(Sender: TObject);
begin
  inherited;
  FWinMode := WinModeInsert;
  CallEditForm;
end;

procedure TfrmAddressFormatList.TVListCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  actEdit.Execute;
end;

end.
