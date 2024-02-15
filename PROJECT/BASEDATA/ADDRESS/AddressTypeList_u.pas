unit AddressTypeList_u;

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
  TfrmAddressTypeList = class(T_frmBasisFormToolBar)
    GDList: TcxGrid;
    TVList: TcxGridDBTableView;
    LVList: TcxGridLevel;
    qryList: TFDQuery;
    dsList: TDataSource;
    FDS: TFDStoredProc;
    TRS: TFDTransaction;
    qryListADDRESSTYPE_ID: TFDAutoIncField;
    qryListICON: TSmallintField;
    qryListSORDER: TSmallintField;
    qryListADDRESSTYPE: TWideStringField;
    qryListACTIVEX: TSmallintField;
    TVListADDRESSTYPE_ID: TcxGridDBColumn;
    TVListICON: TcxGridDBColumn;
    TVListSORDER: TcxGridDBColumn;
    TVListADDRESSTYPE: TcxGridDBColumn;
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
  frmAddressTypeList: TfrmAddressTypeList;

implementation

uses
  dmStyle_u,
  dmDatabase_u,
  AddressTypeEdit_u;

{$R *.dfm}

procedure TfrmAddressTypeList.FormCreate(Sender: TObject);
begin
  inherited;
  qryList.Open();
{$IFDEF DEBUG}
  TVListADDRESSTYPE_ID.Visible := True;
{$ENDIF}
end;

procedure TfrmAddressTypeList.CallEditForm;
var
  SModal: TdgAddressTypeEdit;
begin
  SModal := TdgAddressTypeEdit.SetStart(self, FID, FWinMode);
  try
    if SModal.ShowModal = mrok then
      qryList.Refresh;
  finally
    SModal.Free;
  end;
end;

procedure TfrmAddressTypeList.qryListBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qryList.ParamByName('LNG').AsInteger := APP.SYS_LNG_ID;
end;

procedure TfrmAddressTypeList.actEditExecute(Sender: TObject);
begin
  inherited;
  FWinMode := WinModeEdit;
  FID := qryListADDRESSTYPE_ID.AsInteger;
  CallEditForm;
end;

procedure TfrmAddressTypeList.actInsertExecute(Sender: TObject);
begin
  inherited;
  FWinMode := WinModeInsert;
  FDS.Prepare;
  FDS.Params[0].AsString := 'CON_ADDRESSTYPE';
  FDS.Params[1].AsString := 'ADDRESSTYPE_ID';
  FDS.OpenOrExecute;
  FID := FDS.Fields[0].AsInteger;
  CallEditForm;
end;

procedure TfrmAddressTypeList.TVListCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  actEdit.Execute;
end;

end.
