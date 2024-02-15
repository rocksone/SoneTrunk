unit xComponentTemplate_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxBarBuiltInMenu, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxLabel, cxTextEdit, cxPC, cxClasses, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxGroupBox, Vcl.ExtCtrls, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid, cxGeometry, dxFramedControl, dxPanel, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  T_frmComponentTemplate = class(TForm)
    pcTemplate: TcxPageControl;
    tsLabelEdits: TcxTabSheet;
    cxLabel3: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit3: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxLabel4: TcxLabel;
    cxTextEdit2: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxComboBox1: TcxComboBox;
    cxComboBox2: TcxComboBox;
    cxComboBox3: TcxComboBox;
    tsPanel: TcxTabSheet;
    cxLookupComboBox1: TcxLookupComboBox;
    pcMain: TcxPageControl;
    tsBaseData: TcxTabSheet;
    tsClientData: TcxTabSheet;
    tsSupplierData: TcxTabSheet;
    gbx: TcxGroupBox;
    tsComunication: TcxTabSheet;
    tsInvoiceData: TcxTabSheet;
    tsReports: TcxTabSheet;
    tsPayment: TcxTabSheet;
    tsAddressData: TcxTabSheet;
    tsEmployee: TcxTabSheet;
    tsBankdetails: TcxTabSheet;
    tsTodo: TcxTabSheet;
    cxtbcntrl1: TcxTabControl;
    cxTabSheet1: TcxTabSheet;
    dxPanel1: TdxPanel;
    pnlDefault: TdxPanel;
    cxGroupBox1: TcxGroupBox;
    FDQuery3: TFDQuery;
    DataSource3: TDataSource;
    GD: TcxGrid;
    TV: TcxGridDBTableView;
    TVVendor: TcxGridDBTableView;
    TVVendorContactArt: TcxGridDBColumn;
    TVVendorMatchCode: TcxGridDBColumn;
    TVVendorContactNr: TcxGridDBColumn;
    TVVendorExternNr: TcxGridDBColumn;
    TVVendorClient: TcxGridDBColumn;
    TVVendorCounty: TcxGridDBColumn;
    TVVendorPC: TcxGridDBColumn;
    TVVendorCity: TcxGridDBColumn;
    TVVendorVatIDNr: TcxGridDBColumn;
    TVVendorTaxNumber: TcxGridDBColumn;
    TVVendorProcess: TcxGridDBColumn;
    TVVendorStatus: TcxGridDBColumn;
    LV: TcxGridLevel;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  _frmComponentTemplate: T_frmComponentTemplate;

implementation

uses
  dmStyle_u;

{$R *.dfm}

end.
