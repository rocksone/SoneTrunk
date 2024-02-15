unit AddressFormatEdit_u;

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
  cxImageComboBox, cxSpinEdit, cxMemo, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCustomListBox, cxMCListBox, cxRichEdit, cxDBRichEdit;

type
  TfrmAddressFormatEdit = class(T_frmBasisDialog)
    qryList: TFDQuery;
    dsList: TDataSource;
    lbGENDER: TcxLabel;
    cxGroupBox1: TcxGroupBox;
    lbACTIVEX: TcxLabel;
    cxDBImageComboBox1: TcxDBImageComboBox;
    btnAddRes: TcxButton;
    FDS: TFDStoredProc;
    cxLabel1: TcxLabel;
    qryListADDRESSFORMAT_ID: TFDAutoIncField;
    qryListCOUNTRY_ID: TIntegerField;
    qryListDESCRIPTION: TWideStringField;
    qryListADDRESSFORMAT: TWideStringField;
    qryListACTIVEX: TSmallintField;
    edSTREET1: TcxDBTextEdit;
    LB_Formula: TcxMCListBox;
    DBE_Memo: TcxDBRichEdit;
    cbbCOUNTRY_ID: TcxDBLookupComboBox;
    qryContry: TFDQuery;
    qryContryCOUNTRY_ID: TFDAutoIncField;
    qryContryCOUNTRY: TWideStringField;
    qryContryCONTINENT: TWideStringField;
    dsCountry: TDataSource;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure qryListBeforeOpen(DataSet: TDataSet);
    procedure LB_FormulaDblClick(Sender: TObject);
    procedure qryContryBeforeOpen(DataSet: TDataSet);
  private
    { Private-Deklarationen }
    FID: Integer;
    FWinMode: TWinMode;
  public
    constructor SetStart(AOwner: TComponent; ID: Integer; WinMode: TWinMode);
    { Public-Deklarationen }
  end;

var
  frmAddressFormatEdit: TfrmAddressFormatEdit;

implementation

uses
  xrsDatabase_u,
  dmStyle_u,
  xrsResourcestring_u;

{$R *.dfm}

constructor TfrmAddressFormatEdit.SetStart(AOwner: TComponent; ID: Integer; WinMode: TWinMode);
begin
  inherited Create(AOwner);
  FID := ID;
  FWinMode := WinMode;
end;

procedure TfrmAddressFormatEdit.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if (ModalResult = mrOk) and (APP.USER_AutoSave or (MessageDlg(rsSaveData, mtConfirmation, [mbYes, mbNo], 0) = mrYes)) then
  begin
    if isDBEditMode(qryList) then
      qryList.Post;
  end;
  qryList.Close;
  qryContry.Close;
end;

procedure TfrmAddressFormatEdit.FormCreate(Sender: TObject);
begin
  inherited;
  dmStyle.imlControl.GetIcon(2, self.Icon);
  qryList.Open();
  if FWinMode = WinModeInsert then
  qryList.Append;

  qryContry.Open();
end;

procedure TfrmAddressFormatEdit.LB_FormulaDblClick(Sender: TObject);
var
  s: string;
  i, n: Integer;
begin
  inherited;
  s := LB_Formula.Items.Strings[LB_Formula.ItemIndex];
  i := length(s);
  if Pos(';', s) > 0 then
    s := Copy(s, Pos(';', s) + 1, i - 1);
  n := DBE_Memo.CaretPos.y;
  if DBE_Memo.Lines[n].length = 0 then
    DBE_Memo.SelText := s
  else
    DBE_Memo.SelText := ' ' + s;
  DBE_Memo.SetFocus;
end;

procedure TfrmAddressFormatEdit.qryContryBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qryContry.ParamByName('LNG').AsInteger := APP.SYS_LNG_ID;
end;

procedure TfrmAddressFormatEdit.qryListBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qryList.ParamByName('ID').AsInteger := FID;
end;

end.
