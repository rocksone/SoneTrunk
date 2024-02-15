TEMPLATE SetStart
-------------------------
//--------------------------------------------------------------------------------------------------
// LIST FENSTER
//--------------------------------------------------------------------------------------------------
uses
  xGlobalVars_u,
 
  private
    FCNT_GUID, FADR_GUID: Tguid;
    FWinMode: TWinMode;
    procedure CallAddressEditForm;

uses
  dmContact_u, dmStyle_u, xrsDevExp_u, sone_u;

procedure TfrmPersonList.actInsertExecute(Sender: TObject);
begin
  inherited;
  FWinMode := WinModeInsert;
  CallPersonEdit;
end;

procedure TfrmPersonList.actEditExecute(Sender: TObject);
begin
  inherited;
  FWinMode := WinModeEdit;
  CallPersonEdit;
end;

procedure TfrmAddress.TVAddressCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  actEdit.Execute;
end;


procedure TfrmAddress.CallAddressEditForm;
var
  SModal: TdgAddressEdit;
begin
  if FWinMode = WinModeEdit then
    FADR_GUID := qryAddressListADDRESS_ID.AsGuid;
 //   FCNT_GUID := qryAddressListCONTACT_ID.AsGuid;

  SModal := TdgAddressEdit.SetStart(self, FCNT_GUID, FADR_GUID, FWinMode);
  try
    if SModal.ShowModal = mrok then
      qryAddressList.Refresh;
  finally
    SModal.Free;
  end;
end;

//--------------------------------------------------------------------------------------------------
// EDIT FENSTER
//--------------------------------------------------------------------------------------------------
type
  TfrmSaludationEdit = class(T_frmBasisDialog)
  private
    { Private-Deklarationen }
  FID :Integer;
  FWinMode : WinMode;
  public
    constructor SetStart(AOwner: TComponent; ID: Integer; WinMode: TWinMode);
    { Public-Deklarationen }
  end;


  //-----
  uses
  xrsDatabase_u, dmStyle_u;

{$R *.dfm}

constructor TForm.SetStart(AOwner: TComponent;  ID: Integer ; WinMode: TWinMode);
begin
  inherited Create(AOwner);
  FID := ID
  FWinMode := WinMode;
end;

procedure TForm.FormCreate(Sender: TObject);
begin
  inherited;
  OpenTables();
  if FWinEditMode = WinModeEdit then
    qryPerson.Edit
  else
    qryPerson.Insert;
    qryPerson.Transaction := FDTransaction1;  //  ********************************************************
FDTransaction1.Options.Isolation := xiRepeatableRead;
    FDTransaction1.StartTransaction;
end;


procedure TForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if isDBEditMode(qryPerson) and (ModalResult = mrOk) and (APP.USER_AutoSave or (MessageDlg(rsSaveData, mtConfirmation, [mbYes, mbNo], 0) = mrYes)) then
  begin
    qryPerson.Post;
      FDTransaction1.Commit;
  end;
  qryPerson.Close;
end;
procedure TForm.OpenTables();
begin
  qryPerson.Open();

end;

//---------------------