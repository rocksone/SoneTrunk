program Sone;

uses
  Vcl.Forms,
  xGlobalVars_u in 'UNITS\xGlobalVars_u.pas',
  xrsDatabase_u in 'COM\xrsDatabase_u.pas',
  xrsResourcestring_u in 'COM\xrsResourcestring_u.pas',
  xrsFiles_u in 'COM\xrsFiles_u.pas',
  xrsWin_u in 'COM\xrsWin_u.pas',
  sone_u in 'CORE\sone_u.pas' {frmSone},
  dmDatabase_u in 'DM\dmDatabase_u.pas' {dmDatabase: TDataModule},
  dmStyle_u in 'DM\dmStyle_u.pas' {dmStyle: TDataModule},
  dmContact_u in 'DM\dmContact_u.pas' {dmContact: TDataModule},
  BasisTemplatte_u in 'TEMP\BasisTemplatte_u.pas' {_frmBasisTemplatte},
  BasisDialog in 'TEMP\BasisDialog.pas' {_frmBasisDialog},
  BasisFormToolBar_u in 'TEMP\BasisFormToolBar_u.pas' {_frmBasisFormToolBar},
  BasisDialogToolBar_u in 'TEMP\BasisDialogToolBar_u.pas' {_frmBasisDialogToolBar},
  xComponentTemplate_u in 'TEMP\xComponentTemplate_u.pas' {_frmComponentTemplate},
  DBView_u in 'CORE\TOOLS\DBView_u.pas' {frmDBView},
  TestForm_u in 'CORE\TOOLS\TestForm_u.pas' {frmTestForm},
  ContactList_u in 'CORE\CONTACT\ContactList_u.pas' {frmContactList},
  ContactEdit_u in 'CORE\CONTACT\ContactEdit_u.pas' {frmContactEdit},
  ContactBaseData_u in 'CORE\CONTACT\ContactBaseData_u.pas' {frmContactBaseData},
  PersonEdit_u in 'CORE\CONTACT\PersonEdit_u.pas' {frmPersonEdit},
  AddressList_u in 'CORE\CONTACT\AddressList_u.pas' {frmAddress},
  AddressEdit_u in 'CORE\CONTACT\AddressEdit_u.pas' {dgAddressEdit},
  PostalCodeList_u in 'CORE\GEO\PostalCodeList_u.pas' {PostalCodeList},
  PersonList_u in 'CORE\CONTACT\PersonList_u.pas' {frmPersonList},
  ComunicationList_u in 'CORE\CONTACT\ComunicationList_u.pas' {frmComunicationList},
  ComunicationEdit_u in 'CORE\CONTACT\ComunicationEdit_u.pas' {frmComunicationEdit},
  xrsSystem_u in 'COM\xrsSystem_u.pas',
  PostalCodeEdit_u in 'CORE\GEO\PostalCodeEdit_u.pas' {PostalCodeEdit},
  SysConfigMng_u in 'CORE\SYSTEM\SysConfigMng_u.pas' {frmSysConfigMng},
  SysUserList_u in 'CORE\SYSTEM\SysUserList_u.pas' {frmSysUserList},
  xrsDevExp_u in 'COM\xrsDevExp_u.pas',
  SaludationList_u in 'BASEDATA\CONTACT\SaludationList_u.pas' {frmSaludationList},
  SaludationEdit_u in 'BASEDATA\CONTACT\SaludationEdit_u.pas' {frmSaludationEdit},
  GroupEdit_u in 'BASEDATA\CONTACT\GroupEdit_u.pas' {frmGroupEdit},
  GroupList_u in 'BASEDATA\CONTACT\GroupList_u.pas' {frmGroupList},
  TaxAreaList_u in 'BASEDATA\CONTACT\TaxAreaList_u.pas' {frmTaxAreaList},
  AddressTypeEdit_u in 'BASEDATA\ADDRESS\AddressTypeEdit_u.pas' {dgAddressTypeEdit},
  AddressTypeList_u in 'BASEDATA\ADDRESS\AddressTypeList_u.pas' {frmAddressTypeList},
  AddressFormatList_u in 'BASEDATA\ADDRESS\AddressFormatList_u.pas' {frmAddressFormatList},
  CommunicationTypeList_u in 'BASEDATA\COMUNICATION\CommunicationTypeList_u.pas' {frmCommunicationTypeList: TdxForm},
  CommunicationTypeEdit_u in 'BASEDATA\COMUNICATION\CommunicationTypeEdit_u.pas' {frmCommunicationEdit: TdxForm},
  AddressFormatEdit_u in 'BASEDATA\ADDRESS\AddressFormatEdit_u.pas' {frmAddressFormatEdit: TdxForm},
  TaxAreaEdit_u in 'BASEDATA\CONTACT\TaxAreaEdit_u.pas' {frmTaxAreaEdit: TdxForm},
  TitleList_u in 'BASEDATA\CONTACT\TitleList_u.pas' {frmTitleList: TdxForm},
  TitleEdit_u in 'BASEDATA\CONTACT\TitleEdit_u.pas' {frmTitleEdit: TdxForm},
  PositionList_u in 'BASEDATA\CONTACT\PositionList_u.pas' {frmPositionList: TdxForm},
  PositionEdit_u in 'BASEDATA\CONTACT\PositionEdit_u.pas' {frmPositionEdit: TdxForm},
  IndustrialSectorList_u in 'BASEDATA\CONTACT\IndustrialSectorList_u.pas' {frmIndustrialSectorList: TdxForm},
  IndustrialSectorEdit_u in 'BASEDATA\CONTACT\IndustrialSectorEdit_u.pas' {frmIndustrialSectorEdit: TdxForm},
  AreaEdit_u in 'BASEDATA\CONTACT\AreaEdit_u.pas' {frmAreaEdit: TdxForm},
  AreaList_u in 'BASEDATA\CONTACT\AreaList_u.pas' {frmAreaList: TdxForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmDatabase, dmDatabase);
  Application.CreateForm(TdmStyle, dmStyle);
  Application.CreateForm(TdmContact, dmContact);
  Application.CreateForm(TfrmSone, frmSone);
  Application.CreateForm(TfrmAreaEdit, frmAreaEdit);
  Application.CreateForm(TfrmAreaList, frmAreaList);
  Application.Run;
end.
