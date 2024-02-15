unit UnitEntityPersonInfo;

interface
uses
  SysUtils,
  Classes,
  System.Types;
type
  TEntityPersonInfo = class
  private
    FPersonID: Integer;
    FContactID: Integer;
    FLanguageID: Integer;
    FSaludationID: Integer;
    FTitleID: Integer;
    FPositionID: Integer;
    FAreaID: Integer;
    FFName: string;
    FLName: string;
    FExtra: string;
    FBirthDate: TDateTime;
    FUserLevel: SmallInt;
    FUserCreateID: Integer;
    FUserUpdateID: Integer;
    FUserCreate: TDateTime;
    FUserUpdate: TDateTime;
    FStatus: SmallInt;
    FActive: SmallInt;
    FGender: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    property Contact_ID: Integer read FContactID write FContactID;
    property Person_ID: Integer read FPersonID write FPersonID;
    property Language_ID: Integer read FLanguageID write FLanguageID;
    property Saludation_ID: Integer read FSaludationID write FSaludationID;
    property Title_ID: Integer read FTitleID write FTitleID;
    property Position_ID: Integer read FPositionID write FPositionID;
    property Area_ID: Integer read FAreaID write FAreaID;
    property FName: string read FFName write FFName;
    property LName: string read FLName write FLName;
    property Extra: string read FExtra write FExtra;
    property BirthDate: TDateTime read FBirthDate write FBirthDate;
    property User_Level: SmallInt read FUserLevel write FUserLevel;
    property User_CreateID: Integer read FUserCreateID write FUserCreateID;
    property User_UpdateID: Integer read FUserUpdateID write FUserUpdateID;
    property User_Create: TDateTime read FUserCreate write FUserCreate;
    property User_Update: TDateTime read FUserUpdate write FUserUpdate;
    property Status: SmallInt read FStatus write FStatus;
    property Active: SmallInt read FActive write FActive;
    property Gender: Integer read FGender write FGender;
  end;
implementation
constructor TEntityPersonInfo.Create;
begin
  inherited;
end;
destructor TEntityPersonInfo.Destroy;
begin
  inherited;
end;
end.

