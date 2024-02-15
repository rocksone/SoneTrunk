// ---------------------------------------------------------------------------------------------------------------------
// UNIT          : GlobalVars_u;
// PURPOSE       : The First Connect intance
// CREATE AUTOR  : Robert Feick & Göksel Yücel
// CO-AUTOR      :
// DATE          : 04.08.2023
// ---------------------------------------------------------------------------------------------------------------------
unit dmDatabase_u;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Data.DB,
  FireDAC.Phys.MySQLDef,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Phys,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys.MySQL,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.VCLUI.Error,
  FireDAC.Comp.UI,
  FireDAC.Comp.DataSet,
//  UnitEntityContact,
//  UnitViewModelContacts,
//  UnitEntityProduct,
 // UnitViewModelProducts,
 FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB;

type
  TdmDatabase = class(TDataModule)
    FDPhysMySQL: TFDPhysMySQLDriverLink;
    FDConnection: TFDConnection;
    FDTransaction: TFDTransaction;
    FDUpdateSQL1: TFDUpdateSQL;
    FDUpdateTransaction: TFDTransaction;
    FDEventAlerter1: TFDEventAlerter;
    FDError: TFDGUIxErrorDialog;
    FDWait: TFDGUIxWaitCursor;
    FDPhysFB: TFDPhysFBDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure SetDriverLink(i: integer);
    procedure SetConnect(TestMode: Boolean = False);

    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  dmDatabase: TdmDatabase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  sone_u,
  xGlobalVars_u,
  xrsFiles_u;

{$R *.dfm}

procedure TdmDatabase.DataModuleCreate(Sender: TObject);
var
  driverLinkNr: integer;
begin
  FDConnection.Connected := False;
  APP.DIR_AppDir := GetApplicationDirectory();
  // APP.DB_Database := ExtractFilePath(ExcludeTrailingPathDelimiter(APP.DIR_AppDir)) + 'DB' + PathDelim + cDBFilename;
  //
  // AUS KONFIG LADEN WELCHER DRIVER
  // 0 MySQL
  driverLinkNr := 1;
  SetDriverLink(driverLinkNr);

  try
    SetConnect();
   // FDConnection.Connected := True;
  except
    on E: EFDDBEngineException do
    begin
      APP.SESS_Exit := True;
      // message Terminate
      // Halt;
    end;
  end;

end;

procedure TdmDatabase.SetDriverLink(i: integer);
begin
  case i of
    0: // MySQL
      begin
        FDPhysMySQL.Release;
        FDPhysMySQL.VendorHome := APP.DIR_AppDir;
        // FDPhysMySQL.VendorLib := 'libmysql.dll';
        FDPhysMySQL.VendorLib := 'libmariadb.dll';
        APP.DB_DriverLink := 'MySQL'
      end;
    1: // FIREBIRD
      begin
        FDPhysFB.Release;
        FDPhysFB.VendorHome := APP.DIR_AppDir;

        FDPhysFB.VendorLib := 'fbclient.dll';
        APP.DB_DriverLink := 'FB'
      end;

  end;
end;


procedure TdmDatabase.SetConnect(TestMode: Boolean = False);
//var
//dir: string;
begin
    FDConnection.Params.Clear;
    FDConnection.Params.Add('ApplicationName=' + cAppName);
    FDConnection.Params.Add('User_Name=' + APP.DB_User);
    FDConnection.Params.Add('Password=' + APP.DB_Password);
    FDConnection.Params.Add('OSAuthent=' + 'No');
    FDConnection.Params.Add('CharacterSet=' + cDBCharacterSet);
    FDConnection.Params.Add('IBAdvanced=' + '1');
    FDConnection.Params.Add('ExtendedMetadata=' + 'True');
    FDConnection.Params.Add('Database=' + APP.DIR_AppDir + 'DB' + PathDelim + cDBFilename);
    FDConnection.Params.Add('DriverID=' + APP.DB_DriverLink);
    FDConnection.Params.Add('Port=' + APP.DB_Port);
    FDConnection.Params.Add('PageSize=' + '16384');
    FDConnection.Params.Add('Server=' + APP.DB_Server);
    FDConnection.Params.Add('Protocol=' + APP.DB_Protocol);
    FDConnection.Params.Add('GUIDEndian=' + 'Big');
end;

end.
