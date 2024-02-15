// ---------------------------------------------------------------------------------------------------------------------
//  UNIT          : GlobalVars_u;
//  PURPOSE       : Save Variables and Constans
//  CREATE AUTOR  : Robert Feick & Göksel Yücel
//  CO-AUTOR      :
//  DATE          : 04.08.2023
// ---------------------------------------------------------------------------------------------------------------------
unit xGlobalVars_u;

interface

uses
  SysUtils,
  Windows;
const
  cAppName        = '[S]one';
  cAppNamePro     = '[S]one Pro';
  cRegistred      = ' (R)';
  cUnRegistred    = '- Unregistriert!';
  cAppKey         = '[s]One#';
  cAppAutor       = 'Robert Feick & Göksel Yücel';
  cAppEmail       = 'info@rocksoft.de';
  cAppUrl         = 'www.rocksoft.de';
  cAppData        = 'RockSoft\Sone';
  // FIREDAC -------------------------------------------------------------------
  cDBFilename     = 'Sone.FDB';
  cDBUser         = 'SYSDBA';
  cDBPass         = 'R0ck#masterkey';
  cDBCharacterSet = 'UTF8';
  cDBDriverID     = 'FB';
  cUserConfDir    = 'USERCONF';
  cBackupDir      = 'BACKUP';
  cSync           = 'SYNCHRONIZE';

 Type
  //----------------------------------------------------------------------------
  // dd = (d)b (d)river
  //----------------------------------------------------------------------------
  TDBDriver = (
    ddMySQL,
    ddFirebird,
    ddPostgress);
  //----------------------------------------------------------------------------
  // ct = (c)ontact (t)ype
  //----------------------------------------------------------------------------
  TContactType = (
    ctClient,           // Kunden       -> 0
    ctVendor);          // Lieferanten  -> 1
  //----------------------------------------------------------------------------
  // cp = (c)ontact (p)urpose
  //----------------------------------------------------------------------------
  TContactPurpose  =(
    cpNone,             // Nichts
    cpSale,             // Verkauf
    cpBuy,              // Einkauf
    cpBoth);            // Verkauf und Einkauf

  //----------------------------------------------------------------------------
  // Windows TYPE
  //----------------------------------------------------------------------------
  TWindowsType  =(
    wtNone,             // Reset
    wtMDI,              // MDI
    wtModal);           // Modal

  //----------------------------------------------------------------------------
  // Windows MODE
  //----------------------------------------------------------------------------
  TWinMode  =(
    WinModeNone,             // Reset
    WinModeSelect,           // Reine Selection
    WinModeEdit,             // Nur Relevanten elementen für das editieren
    WinModeInsert,            // Insert ein Neuen Record
    WinModeFull             // Werden alle Steuerelemente angezeigt
    );

  //----------------------------------------------------------------------------
  // Serien Nummer
  //----------------------------------------------------------------------------

    TSerienNummer  =(
    SNClient,              // Kunden-Nr
    SNVendor,              // Lieferan
    SN1,                   //
    SN2,                   //
    SN3                    //
    );



  TAPPVars = class
  strict private
    class var AppVar: TAPPVars;
  private
    procedure initAppVar();
    class function GetInstance: TAPPVars; static;
    constructor Create;
    class destructor Destroy;
  protected
  public
    // MANDANT
    MND_GUID,          // Current Mandant
    CNT_GUID,          // Current Contact
    USR_GUID : TGUID;
    COUNTRY_ID : INTEGER;
    CNT_TYPE :  TContactType;
    //
    // DIRECTORY ---------------------------------------------------------------
    DIR_AppDir: String;       // Application Directory
    DIR_PerAppData: String;   // CSIDL_APPDATA          | Eigene Einstellungen 	    | C:\Users\<user>\AppData\Roaming 	Nur Benutzer <user> 	Versteckt, geeignet für Konfiguration
    DIR_PerDocuments: String; // CSIDL_PERSONAL         | Eigene Dokumente 	        | C:\Users\<user>\Documents 	Nur Benutzer <user> 	Sichtbar
    DIR_ComAppData: String;   // CSIDL_COMMON_APPDATA   | Öffentliche Einstellungen | C:\ProgramData 	Alle Benutzer 	Versteckt, geeignet für Konfiguration
    DIR_ComDocuments: String; // CSIDL_COMMON_DOCUMENTS | Öffentliche Dokumente 	  | C:\Users\Public\Documents 	Alle Benutzer 	Sichtbar
    //
    // DATABASE ----------------------------------------------------------------
    DB_Server: string ;
    DB_Database: string;      // Database name
    DB_User: string ;
    DB_Password: string ;
    DB_Port: string;
    DB_Protocol: string;      // 'TCPIP';
    DB_Post: Boolean;
    DB_DriverLink: string;    //   = 'FB';
    //
    // USER     ----------------------------------------------------------------
    USER_Autoedit: Boolean;
    USER_AutoSave: Boolean;
    USER_CaseUp: Boolean;
    USER_Language : String ;
    USER_AutoClose: Boolean;  // Beenden ohne bestätigung
    USER_SaveChanges : Boolean; // Speichert änderung Map an/aus etc
    USER_PrioED: Integer; // USER_PrioED = USER_PrioE(dit)S(elect)  Ist eine Prio für Fenster mit Edit oder Select, PRIORITÄT = 0: Edit | 1: Select
    //
    // SESSION  ----------------------------------------------------------------
    SESS_User_ID,
    SESS_Initiate: Boolean;
    SESS_Exit: Boolean;
    SESS_ERROR: Boolean;
    //
    // SYSTEM   ----------------------------------------------------------------
    SYS_AppName : string;
    SYS_COUNTRY_ID,                   // DEFAULT = 57
    SYS_LNG_ID: Integer;             //default = 32
    SYS_Type,                         // 1 Basic // 2 PRO
    SYS_TypeStatus : SmallInt;        // 0 Keine meldung, 1 Version Downgrade, 2 Version Update
    SYS_DBVersion: String;
    SYS_AutoLogin: Byte;              // 0 aus | 1 Login Fenster Aktivieren
    SYS_LastBackup : TDateTime;
    SYS_BackupInterval :Byte;         // In Tage
    SYS_BackupMode : Byte;            // 0 Aus, 1 beim Start, 2 beim beeden, 3 Start und End
    // STYLE & COLORS ----------------------------------------------------------
    // WINDOWS CONTROL ---------------------------------------------------------
    WIN_Type    : TWindowsType;
    WIN_EditMode: TWinMode;
    WIN_Paramt  : Integer;
    WIN_ID      : Integer;
    WIN_Guid    : Tguid;
  end;

resourcestring
  rs_sysSave    = 'Möchten Sie, die %s änderung speichern?';

var
  APP: TAPPVars;

implementation

constructor TAPPVars.Create;
begin
  initAppVar;
end;

procedure TAPPVars.initAppVar();
begin
  // MANDANT -------------------------------------------------------------------
  // MND_ID                := StringToGUID('{31344445-3935-4533-4145-383134384339}');  // Develop time


//  USR_ID                := StringToGUID('46354437-3134-3242-2D39-3931372D3439');  // Develop time
  // DATABASE ------------------------------------------------------------------
  DB_Database           := 'SONE';
  DB_User               := 'SYSDBA';
  DB_Password           := 'R0ck#masterkey';
  DB_Server             := 'Localhost';
  DB_Port               := '3050';
  DB_Protocol           := 'TCPIP';
  DB_Post               := False;
  //
  // CONFIG   ------------------------------------------------------------------
  //
  // USER     ------------------------------------------------------------------
  USER_Autoedit         := true;
  USER_AutoSave         := true;
  USER_CaseUp           := true;
  //
  // SESSION  ------------------------------------------------------------------
  SESS_Initiate         := true;
  SESS_Exit             := False;
  SESS_ERROR            := False;
  //
  // SYSTEM   ------------------------------------------------------------------
  SYS_DBVersion         := '0';
  SYS_AutoLogin         := 0;
  //
  // LANGUAGE -------------------------------------------------------------------
  SYS_LNG_ID            := 32; // German
  SYS_COUNTRY_ID        := 57; // Germany
  COUNTRY_ID            := 0;
end;

class function TAPPVars.GetInstance: TAPPVars;
begin
  if not assigned(AppVar) then
    AppVar := TAPPVars.Create;
  Result := AppVar;
end;

class destructor TAPPVars.Destroy;
begin
  if assigned(AppVar) then
  begin
    FreeAndNil(AppVar);
  end;
end;

initialization
  APP := TAPPVars.GetInstance;
end.
