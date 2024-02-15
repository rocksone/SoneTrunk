// ---------------------------------------------------------------------
// DIESE UNIT WIRD NUR FÜR unit ContactEdit_u; BENUTZT
// ---------------------------------------------------------------------

unit dmContact_u;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.StorageBin;

type
  TdmContact = class(TDataModule)
    qrySaludation: TFDQuery;
    dsSaludation: TDataSource;
    qryAddressType: TFDQuery;
    dsAddressType: TDataSource;
    qryLanguage: TFDQuery;
    dsLanguage: TDataSource;
    qryVendorList: TFDQuery;
    dsVendorList: TDataSource;
    dsClientList: TDataSource;
    qryContry: TFDQuery;
    dsCountry: TDataSource;
    qryState: TFDQuery;
    dsState: TDataSource;
    qryClientList: TFDQuery;
    qryTitles: TFDQuery;
    dsTitles: TDataSource;
    qryAddress: TFDQuery;
    dsAddress: TDataSource;
    qryClientListCONTACT_ID: TGuidField;
    qryClientListMANDANT_ID: TGuidField;
    qryClientListMATCHCODE: TWideStringField;
    qryClientListCONTACTART: TSmallintField;
    qryClientListCONTACTTYPE: TSmallintField;
    qryClientListPURPOSE: TSmallintField;
    qryClientListISO3166_1A3: TWideStringField;
    qryClientListCONTACT: TWideStringField;
    qryClientListPOSTALCODE: TWideStringField;
    qryClientListCITY: TWideStringField;
    qryClientListSTREET1: TWideStringField;
    qryClientListVATIDNR: TWideStringField;
    qryClientListINTERNNR: TWideStringField;
    qryClientListEXTERNNR: TWideStringField;
    qryClientListTAXNUMBER: TWideStringField;
    qryClientListPROCESS: TIntegerField;
    qryClientListSTATUX: TSmallintField;
    qryVendorListCONTACT_ID: TGuidField;
    qryVendorListMANDANT_ID: TGuidField;
    qryVendorListMATCHCODE: TWideStringField;
    qryVendorListCONTACTART: TSmallintField;
    qryVendorListCONTACTTYPE: TSmallintField;
    qryVendorListPURPOSE: TSmallintField;
    qryVendorListISO3166_1A3: TWideStringField;
    qryVendorListCONTACT: TWideStringField;
    qryVendorListPOSTALCODE: TWideStringField;
    qryVendorListCITY: TWideStringField;
    qryVendorListSTREET1: TWideStringField;
    qryVendorListVATIDNR: TWideStringField;
    qryVendorListINTERNNR: TWideStringField;
    qryVendorListEXTERNNR: TWideStringField;
    qryVendorListTAXNUMBER: TWideStringField;
    qryVendorListPROCESS: TIntegerField;
    qryVendorListSTATUX: TSmallintField;
    qryAddressADDRESS_ID: TGuidField;
    qryAddressCONTACT_ID: TGuidField;
    qryAddressADDRESSTYPE_ID: TIntegerField;
    qryAddressCOUNTRY_ID: TIntegerField;
    qryAddressPOSTALCODE_ID: TIntegerField;
    qryAddressPOSTALCODE: TWideStringField;
    qryAddressCITY: TWideStringField;
    qryAddressSTREET1: TWideStringField;
    qryAddressSTREET2: TWideStringField;
    qryAddressADDITIONAL: TWideStringField;
    qryAddressSORDER: TSmallintField;
    qryAddressACTIVEX: TSmallintField;
    qryAddressUSER_CREATE_ID: TGuidField;
    qryAddressUSER_UPDATE_ID: TGuidField;
    qryAddressUSER_CREATE: TSQLTimeStampField;
    qryAddressUSER_UPDATE: TSQLTimeStampField;
    qryTitlesTITLE_ID: TFDAutoIncField;
    qryTitlesTITLE: TWideStringField;
    qryContryCOUNTRY_ID: TFDAutoIncField;
    qryContryCOUNTRY: TWideStringField;
    qryContryCONTINENT: TWideStringField;
    FDSPostalCode: TFDStoredProc;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    FDSPostalCodePOSTALCODE_ID: TIntegerField;
    FDSPostalCodePOSTALCODE: TWideStringField;
    FDSPostalCodeCITY: TWideStringField;
    FDSPostalCodeSTATE_ID: TIntegerField;
    FDSPostalCodeCOUNTRY_ID: TIntegerField;
    FDQuery2: TFDQuery;
    DataSource2: TDataSource;
    qryIndustry: TFDQuery;
    dsIndustry: TDataSource;
    qryTaxArea: TFDQuery;
    qryTaxAreaTAXAREA_ID: TFDAutoIncField;
    qryTaxAreaTAXAREA: TWideStringField;
    dsTaxArea: TDataSource;
    qryIndustryINDUSTRYSECTORS_ID: TFDAutoIncField;
    qryIndustryINDUSTRYSECTOR: TWideStringField;
    FDQuery3: TFDQuery;
    DataSource3: TDataSource;
    FDSPostalCodeCOUNTRY: TWideStringField;
    FDSPostalCodeSTATE: TWideStringField;
    qryPostalCode: TFDQuery;
    qryPostalCodePOSTALCODE_ID: TIntegerField;
    qryPostalCodeLANGUAGE_ID: TIntegerField;
    qryPostalCodeCOUNTRY_ID: TIntegerField;
    qryPostalCodePOSTALCODE: TWideStringField;
    qryPostalCodeCITY: TWideStringField;
    qryPostalCodeSTATE: TWideStringField;
    qryPostalCodeCOUNTRY: TWideStringField;
    qryPostalCodeLATITUDE: TFMTBCDField;
    qryPostalCodeLONGITUDE: TFMTBCDField;
    qryPostalCodeSTATE_ID: TIntegerField;
    procedure qryAddressTypeBeforeOpen(DataSet: TDataSet);
    procedure qryClientListBeforeOpen(DataSet: TDataSet);
    procedure qryContryBeforeOpen(DataSet: TDataSet);
    procedure qryContryNewRecord(DataSet: TDataSet);
    procedure qryIndustryBeforeOpen(DataSet: TDataSet);
    procedure qryLanguageBeforeOpen(DataSet: TDataSet);
    procedure qryPostalCodeBeforeOpen(DataSet: TDataSet);
    procedure qryStateBeforeOpen(DataSet: TDataSet);
    procedure qryTaxAreaBeforeOpen(DataSet: TDataSet);
    procedure qryTitlesBeforeOpen(DataSet: TDataSet);
    procedure qryVendorListBeforeOpen(DataSet: TDataSet);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  dmContact: TdmContact;

implementation

uses
  dmDatabase_u, xGlobalVars_u;

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TdmContact.qryAddressTypeBeforeOpen(DataSet: TDataSet);
begin
  qryAddressType.ParamByName('LNG').AsInteger := APP.SYS_LNG_ID;
end;

procedure TdmContact.qryClientListBeforeOpen(DataSet: TDataSet);
begin
  dmContact.qryClientList.ParamByName('MANDANT').AsGUID := APP.MND_GUID;
end;

procedure TdmContact.qryContryBeforeOpen(DataSet: TDataSet);
begin
  qryContry.ParamByName('LNG').AsInteger := APP.SYS_LNG_ID;

end;

procedure TdmContact.qryContryNewRecord(DataSet: TDataSet);
begin
qryContryCOUNTRY_ID.AsInteger := APP.SYS_COUNTRY_ID;
end;

procedure TdmContact.qryIndustryBeforeOpen(DataSet: TDataSet);
begin
 qryIndustry.ParamByName('LNG').AsInteger := APP.SYS_LNG_ID;
end;

procedure TdmContact.qryLanguageBeforeOpen(DataSet: TDataSet);
begin
  qryLanguage.ParamByName('LNG').AsInteger := APP.SYS_LNG_ID;
end;

procedure TdmContact.qryPostalCodeBeforeOpen(DataSet: TDataSet);
begin
// qryPostalCode.ParamByName('LNG_ID').AsInteger := APP.SYS_LNG_ID;
//   qryPostalCode.Params.ClearValues()
end;

procedure TdmContact.qryStateBeforeOpen(DataSet: TDataSet);
begin
 qryState.ParamByName('FCOUNTRY_ID').AsInteger := APP.COUNTRY_ID;
 APP.COUNTRY_ID := 0; // RESET
end;

procedure TdmContact.qryTaxAreaBeforeOpen(DataSet: TDataSet);
begin
 qryTaxArea.ParamByName('LNG').AsInteger := APP.SYS_LNG_ID;
end;

procedure TdmContact.qryTitlesBeforeOpen(DataSet: TDataSet);
begin
  qryTitles.ParamByName('LNG').AsInteger := APP.SYS_LNG_ID;
end;

procedure TdmContact.qryVendorListBeforeOpen(DataSet: TDataSet);
begin
  dmContact.qryVendorList.ParamByName('MANDANT').AsGUID := APP.MND_GUID;
end;

end.
