unit UnitEntityContact;

interface

uses
  SysUtils
  , Classes
  , Generics.Collections
  , UnitEntityPersonInfo
  , xGlobalVars_u
  , DB
  , FireDAC.Comp.Client
  , System.Types
  , FireDAC.Stan.Param
  ;

type
  TEntityContact = class
  private
    FContactID: Integer;
    FMandantID: Integer;
    FCompanyID: Integer;
    FPersonID: Integer;
    FLanguageID: Integer;
    FAddressID: Integer;
    FMatchCode: string;
    FContactArt: SmallInt;
    FContactPurpose: SmallInt;
    FUserLevel: SmallInt;
    FUserCreateID: Integer;
    FUserUpdateID: Integer;
    FUserCreate: TDateTime;
    FUserUpdate: TDateTime;
    FStatus: SmallInt;
    FActive: SmallInt;
    FPersons: TObjectList<TEntityPersonInfo>;
    FMainPerson: TEntityPersonInfo;
    function GetContact_ID: Integer;
    procedure SetContact_ID(const Value: Integer);
  public
    constructor Create;
    destructor Destroy; override;
    property Contact_ID: Integer read GetContact_ID write SetContact_ID;
    property Mandant_ID: Integer read FMandantID write FMandantID;
    property Company_ID: Integer read FCompanyID write FCompanyID;
    property Person_ID: Integer read FPersonID write FPersonID;
    property Language_ID: Integer read FLanguageID write FLanguageID;
    property Address_ID: Integer read FAddressID write FAddressID;
    property MatchCode: string read FMatchCode write FMatchCode;
    property ContactArt: SmallInt read FContactArt write FContactArt;
    property ContactPurpose: SmallInt read FContactPurpose write FContactPurpose;
    property User_Level: SmallInt read FUserLevel write FUserLevel;
    property User_Create_ID: Integer read FUserCreateID write FUserCreateID;
    property User_Update_ID: Integer read FUserUpdateID write FUserUpdateID;
    property User_Create: TDateTime read FUserCreate write FUserCreate;
    property User_Update: TDateTime read FUserUpdate write FUserUpdate;
    property Status: SmallInt read FStatus write FStatus;
    property Active: SmallInt read FActive write FActive;
    property MainPerson: TEntityPersonInfo read FMainPerson write FMainPerson;
    property Persons: TObjectList<TEntityPersonInfo> read FPersons;
    procedure LoadRefPersons(paramConnection: TFDConnection);
    procedure LoadMainPerson(paramConnection: TFDConnection);
  end;

implementation

function TEntityContact.GetContact_ID: Integer;
begin
  Result := FContactID;
end;

procedure TEntityContact.SetContact_ID(const Value: Integer);
begin
  FContactID := Value;
end;

procedure TEntityContact.LoadMainPerson(paramConnection: TFDConnection);
var
  LDQueryPersons: TFDQuery;
begin
  paramConnection.Connected := True;
  LDQueryPersons := TFDQuery.Create(nil);
  try
    LDQueryPersons.Connection := paramConnection;
    LDQueryPersons.SQL.Text := 'SELECT * FROM con_person WHERE Person_ID = :Person_ID LIMIT 1';
    LDQueryPersons.Params.ParamByName('Person_ID').AsInteger := FPersonID;
    LDQueryPersons.Open;
    if not LDQueryPersons.IsEmpty then
    begin
      FMainPerson := TEntityPersonInfo.Create();
      FMainPerson.Person_ID := LDQueryPersons.FieldByName('Person_ID').AsInteger;
      FMainPerson.Contact_ID := LDQueryPersons.FieldByName('Contact_ID').AsInteger;
      FMainPerson.Language_ID := LDQueryPersons.FieldByName('Language_ID').AsInteger;
      FMainPerson.Saludation_ID := LDQueryPersons.FieldByName('Saludation_ID').AsInteger;
      FMainPerson.Title_ID := LDQueryPersons.FieldByName('Title_ID').AsInteger;
      FMainPerson.Position_ID := LDQueryPersons.FieldByName('Position_ID').AsInteger;
      FMainPerson.Area_ID := LDQueryPersons.FieldByName('Area_ID').AsInteger;
      FMainPerson.Gender := LDQueryPersons.FieldByName('Gender').AsInteger;
      FMainPerson.FName := LDQueryPersons.FieldByName('FName').AsString;
      FMainPerson.LName := LDQueryPersons.FieldByName('LName').AsString;
      FMainPerson.Extra := LDQueryPersons.FieldByName('Extra').AsString;
      FMainPerson.BirthDate := LDQueryPersons.FieldByName('BirthDate').AsDateTime;
      FMainPerson.User_level := LDQueryPersons.FieldByName('User_level').AsInteger;
      FMainPerson.User_createID := LDQueryPersons.FieldByName('User_create_id').AsInteger;
      FMainPerson.User_updateID := LDQueryPersons.FieldByName('User_update_id').AsInteger;
      FMainPerson.User_create := LDQueryPersons.FieldByName('User_create').AsDateTime;
      FMainPerson.User_update := LDQueryPersons.FieldByName('User_update').AsDateTime;
      FMainPerson.Active := LDQueryPersons.FieldByName('Active').AsInteger;
      LDQueryPersons.Next;
    end;
  finally
    LDQueryPersons.Free;
  end;
end;

procedure TEntityContact.LoadRefPersons(paramConnection: TFDConnection);
var
  LDQueryPersons: TFDQuery;
  LPersons: TEntityPersonInfo;
begin
  paramConnection.Connected := True;
  LDQueryPersons := TFDQuery.Create(nil);
  try
    LDQueryPersons.Connection := paramConnection;
    LDQueryPersons.SQL.Text := 'SELECT * FROM con_person WHERE Contact_ID = :Contact_ID';
    LDQueryPersons.Params.ParamByName('Contact_ID').AsInteger := FContactID;
    LDQueryPersons.Open;
    while not LDQueryPersons.Eof do
    begin
      LPersons := TEntityPersonInfo.Create();
      LPersons.Contact_ID := LDQueryPersons.FieldByName('Contact_ID').AsInteger;
      LPersons.Language_ID := LDQueryPersons.FieldByName('Language_ID').AsInteger;
      LPersons.Saludation_ID := LDQueryPersons.FieldByName('Saludation_ID').AsInteger;
      LPersons.Title_ID := LDQueryPersons.FieldByName('Title_ID').AsInteger;
      LPersons.Position_ID := LDQueryPersons.FieldByName('Position_ID').AsInteger;
      LPersons.Area_ID := LDQueryPersons.FieldByName('Area_ID').AsInteger;
      LPersons.Gender := LDQueryPersons.FieldByName('Gender').AsInteger;
      LPersons.FName := LDQueryPersons.FieldByName('FName').AsString;
      LPersons.LName := LDQueryPersons.FieldByName('LName').AsString;
      LPersons.Extra := LDQueryPersons.FieldByName('Extra').AsString;
      LPersons.BirthDate := LDQueryPersons.FieldByName('BirthDate').AsDateTime;
      LPersons.User_level := LDQueryPersons.FieldByName('User_level').AsInteger;
      LPersons.User_createID := LDQueryPersons.FieldByName('User_create_id').AsInteger;
      LPersons.User_updateID := LDQueryPersons.FieldByName('User_update_id').AsInteger;
      LPersons.User_create := LDQueryPersons.FieldByName('User_create').AsDateTime;
      LPersons.User_update := LDQueryPersons.FieldByName('User_update').AsDateTime;
      LPersons.Active := LDQueryPersons.FieldByName('Active').AsInteger;
      FPersons.Add(LPersons);
      LDQueryPersons.Next;
    end;
  finally
    LDQueryPersons.Free;
  end;
end;

constructor TEntityContact.Create;
begin
  Self.Contact_ID := -1;
  Self.FUserCreate := now;
  Self.FUserUpdate := now;
  FPersons := TObjectList<TEntityPersonInfo>.Create(True);
end;

destructor TEntityContact.Destroy;
begin
  FPersons.Free;
  inherited;
end;

end.

