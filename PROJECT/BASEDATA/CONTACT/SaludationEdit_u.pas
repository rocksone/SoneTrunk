unit SaludationEdit_u;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.UITypes,
  System.Variants,
  System.Classes,
  Data.DB,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  Vcl.StdCtrls,
  BasisDialog,
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxGeometry,
  dxFramedControl,
  cxContainer,
  cxEdit,
  JvComponentBase,
  JvEnterTab,
  cxButtons,
  cxLabel,
  dxPanel,
  xGlobalVars_u,
  cxStyles,
  cxCustomData,
  cxFilter,
  cxData,
  cxDataStorage,
  cxNavigator,
  dxDateRanges,
  dxScrollbarAnnotations,
  cxDBData,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  cxGroupBox,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  cxDBEdit,
  cxGridLevel,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxClasses,
  cxGridCustomView,
  cxGrid,
  cxTextEdit,
  cxMaskEdit,
  cxDropDownEdit,
  cxImageComboBox;

type
  TfrmSaludationEdit = class(T_frmBasisDialog)
    qrySaludation: TFDQuery;
    dsSaludation: TDataSource;
    lbGENDER: TcxLabel;
    icbGENDER: TcxDBImageComboBox;
    GDSaludation: TcxGrid;
    TVSaludation: TcxGridDBTableView;
    LVSaludation: TcxGridLevel;
    qrySaludationRes: TFDQuery;
    dsSaludationRes: TDataSource;
    qryLanguage: TFDQuery;
    dsLanguage: TDataSource;
    qrySaludationResSALUDATIONRES_ID: TFDAutoIncField;
    qrySaludationResSALUDATION_ID: TIntegerField;
    qrySaludationResLANGUAGE_ID: TIntegerField;
    qrySaludationResSALUDATION: TWideStringField;
    qrySaludationResLETTERSALUTATION: TWideStringField;
    TVSaludationSALUDATIONRES_ID: TcxGridDBColumn;
    TVSaludationSALUDATION_ID: TcxGridDBColumn;
    TVSaludationLANGUAGE_ID: TcxGridDBColumn;
    TVSaludationSALUDATION: TcxGridDBColumn;
    TVSaludationLETTERSALUTATION: TcxGridDBColumn;
    TVSaludationLanguage: TcxGridDBColumn;
    qryLanguageLANGUAGE_ID: TFDAutoIncField;
    qryLanguageLANGUAGE: TWideStringField;
    qrySaludationResLANGUAGE: TStringField;
    cxGroupBox1: TcxGroupBox;
    lbACTIVEX: TcxLabel;
    cxDBImageComboBox1: TcxDBImageComboBox;
    qrySaludationSALUDATION_ID: TFDAutoIncField;
    qrySaludationGENDER: TSmallintField;
    qrySaludationACTIVEX: TSmallintField;
    btnAddRes: TcxButton;
    qryCheckLangRes: TFDQuery;
    dsCheckLangRes: TDataSource;
    FDSSaludationRes: TFDStoredProc;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure qryCheckLangResBeforeOpen(DataSet: TDataSet);
    procedure qrySaludationBeforeOpen(DataSet: TDataSet);
    procedure qrySaludationResBeforeOpen(DataSet: TDataSet);
    procedure TVSaludationCellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState;
      var AHandled: Boolean);
    procedure btnAddResClick(Sender: TObject);
  private
    { Private-Deklarationen }
    FID: Integer;
    FWinMode: TWinMode;
  public
    constructor SetStart(AOwner: TComponent; ID: Integer; WinMode: TWinMode);
    { Public-Deklarationen }
  end;

var
  frmSaludationEdit: TfrmSaludationEdit;

implementation

uses
  xrsDatabase_u, dmStyle_u, xrsResourcestring_u;

{$R *.dfm}

constructor TfrmSaludationEdit.SetStart(AOwner: TComponent; ID: Integer; WinMode: TWinMode);
begin
  inherited Create(AOwner);
  FID := ID;
  FWinMode := WinMode;
end;

procedure TfrmSaludationEdit.btnAddResClick(Sender: TObject);
begin
  inherited;

    FDSSaludationRES.Prepare;
  FDSSaludationRES.Params[0].AsString := 'CON_SALUDATIONRES';
  FDSSaludationRES.Params[1].AsString := 'SALUDATION_ID';
  FDSSaludationRES.Params[2].AsInteger := FID;
  FDSSaludationRES.Execute;
  FDSSaludationRES.Close;
btnAddRes.Visible := False;
qrySaludationRes.Refresh;

end;

procedure TfrmSaludationEdit.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if (ModalResult = mrOk) and (APP.USER_AutoSave or (MessageDlg(rsSaveData, mtConfirmation, [mbYes, mbNo], 0) = mrYes)) then
  begin
    if isDBEditMode(qrySaludation) then
      qrySaludation.Post;
    if isDBEditMode(qrySaludationRes) then
      qrySaludationRes.Post;
  end;
  qrySaludation.Close;
  qrySaludationRes.Close;
  qryLanguage.Close;
end;

procedure TfrmSaludationEdit.FormCreate(Sender: TObject);

begin
  inherited;
  qrySaludation.Open();
  qrySaludationRes.Open();
  qryCheckLangRes.Open();
  if qryCheckLangRes.Fields[0].AsInteger > 1 then
    btnAddRes.Caption := Format(rsPlural, [qryCheckLangRes.Fields[0].AsInteger])
  else
    btnAddRes.Caption := Format(rsSingular, [qryCheckLangRes.Fields[0].AsInteger]);

 btnAddRes.Visible := qryCheckLangRes.Fields[0].AsInteger <> 0;


qryCheckLangRes.Close;

end;

procedure TfrmSaludationEdit.qryCheckLangResBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qryCheckLangRes.ParamByName('ID').AsInteger := FID;
end;

procedure TfrmSaludationEdit.qrySaludationBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qrySaludation.ParamByName('ID').AsInteger := FID;
end;

procedure TfrmSaludationEdit.qrySaludationResBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  // qrySaludationRes.ParamByName('ID').AsInteger := FID;
end;

procedure TfrmSaludationEdit.TVSaludationCellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
//  edSALUDATION.SetFocus;
end;

end.
