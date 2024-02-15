unit CommunicationTypeEdit_u;

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
  cxImageComboBox, cxSpinEdit;

type
  TfrmCommunicationEdit = class(T_frmBasisDialog)
    qryList: TFDQuery;
    dsList: TDataSource;
    lbGENDER: TcxLabel;
    icbGENDER: TcxDBImageComboBox;
    GDRES: TcxGrid;
    TVRES: TcxGridDBTableView;
    LVRES: TcxGridLevel;
    qryRes: TFDQuery;
    dsRes: TDataSource;
    qryLanguage: TFDQuery;
    dsLanguage: TDataSource;
    qryLanguageLANGUAGE_ID: TFDAutoIncField;
    qryLanguageLANGUAGE: TWideStringField;
    cxGroupBox1: TcxGroupBox;
    lbACTIVEX: TcxLabel;
    cxDBImageComboBox1: TcxDBImageComboBox;
    btnAddRes: TcxButton;
    qryCheckLangRes: TFDQuery;
    dsCheckLangRes: TDataSource;
    FDS: TFDStoredProc;
    qryListCOMUNICATIONTYPE_ID: TFDAutoIncField;
    qryListCOMUNICATIONPROTOCOL_ID: TIntegerField;
    qryListICON: TSmallintField;
    qryListSORDER: TSmallintField;
    qryListACTIVEX: TSmallintField;
    qryResCOMUNICATIONTYPERES_ID: TFDAutoIncField;
    qryResCOMUNICATIONTYPE_ID: TIntegerField;
    qryResLANGUAGE_ID: TIntegerField;
    qryResCOMUNICATIONTYPE: TWideStringField;
    TVRESCOMUNICATIONTYPERES_ID: TcxGridDBColumn;
    TVRESCOMUNICATIONTYPE_ID: TcxGridDBColumn;
    TVRESLANGUAGE_ID: TcxGridDBColumn;
    TVRESCOMUNICATIONTYPE: TcxGridDBColumn;
    qryResLANGUAGE: TStringField;
    lbSORDER: TcxLabel;
    seSORDER: TcxDBSpinEdit;
    cxLabel1: TcxLabel;
    cxDBImageComboBox2: TcxDBImageComboBox;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure qryCheckLangResBeforeOpen(DataSet: TDataSet);
    procedure qryListBeforeOpen(DataSet: TDataSet);
    procedure qryResBeforeOpen(DataSet: TDataSet);
    procedure TVRESCellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState;
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
  frmCommunicationEdit: TfrmCommunicationEdit;

implementation

uses
  xrsDatabase_u,
  dmStyle_u,
  xrsResourcestring_u;

{$R *.dfm}

constructor TfrmCommunicationEdit.SetStart(AOwner: TComponent; ID: Integer; WinMode: TWinMode);
begin
  inherited Create(AOwner);
  FID := ID;
  FWinMode := WinMode;
end;

procedure TfrmCommunicationEdit.btnAddResClick(Sender: TObject);
begin
  inherited;
  FDS.Prepare;
  FDS.Params[0].AsString := 'CON_COMUNICATIONTYPERES';
  FDS.Params[1].AsString := 'COMUNICATIONTYPE_ID';
  FDS.Params[2].AsInteger := FID;
  FDS.Execute;
  FDS.Close;
  btnAddRes.Visible := False;
  qryRes.Refresh;
end;

procedure TfrmCommunicationEdit.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if (ModalResult = mrOk) and (APP.USER_AutoSave or (MessageDlg(rsSaveData, mtConfirmation, [mbYes, mbNo], 0) = mrYes)) then
  begin
    if isDBEditMode(qryList) then
      qryList.Post;
    if isDBEditMode(qryRes) then
      qryRes.Post;
  end;
  qryList.Close;
  qryRes.Close;
  qryLanguage.Close;
end;

procedure TfrmCommunicationEdit.FormCreate(Sender: TObject);

begin
  inherited;
  qryList.Open();
  qryRes.Open();
  qryCheckLangRes.Open();
  if qryCheckLangRes.Fields[0].AsInteger > 1 then
    btnAddRes.Caption := Format(rsPlural, [qryCheckLangRes.Fields[0].AsInteger])
  else
    btnAddRes.Caption := Format(rsSingular, [qryCheckLangRes.Fields[0].AsInteger]);

  btnAddRes.Visible := qryCheckLangRes.Fields[0].AsInteger <> 0;

  qryCheckLangRes.Close;

end;

procedure TfrmCommunicationEdit.qryCheckLangResBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qryCheckLangRes.ParamByName('ID').AsInteger := FID;
end;

procedure TfrmCommunicationEdit.qryListBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qryList.ParamByName('ID').AsInteger := FID;
end;

procedure TfrmCommunicationEdit.qryResBeforeOpen(DataSet: TDataSet);
begin
  inherited;
 // qryRes.ParamByName('GROUP_ID').AsInteger := FID;
end;

procedure TfrmCommunicationEdit.TVRESCellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState;
  var AHandled: Boolean);
begin
  inherited;
  // edSALUDATION.SetFocus;
end;

end.
