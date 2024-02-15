unit UnitEntityProduct;

interface
uses
  SysUtils, Classes;
type
  TEntityProduct = class
  private
    FProductID: TBytes;
    FMandantID: TBytes;
    FCategoryID: TBytes;
    FCode: string;
    FTitle: string;
    FCreateUserID: TBytes;
    FUpdateUserID: TBytes;
    FUpdateDate: TDateTime;
    FStatus: Smallint;
    FActive: Smallint;
    procedure SetProductID(const Value: TBytes);
    function GetProductID: TBytes;
    procedure SetMandantID(const Value: TBytes);
    function GetMandantID: TBytes;
    procedure SetCategoryID(const Value: TBytes);
    function GetCategoryID: TBytes;
    procedure SetCode(const Value: string);
    function GetCode: string;
    procedure SetTitle(const Value: string);
    function GetTitle: string;
    procedure SetCreateUserID(const Value: TBytes);
    function GetCreateUserID: TBytes;
    procedure SetUpdateUserID(const Value: TBytes);
    function GetUpdateUserID: TBytes;
    procedure SetUpdateDate(const Value: TDateTime);
    function GetUpdateDate: TDateTime;
    procedure SetStatus(const Value: Smallint);
    function GetStatus: Smallint;
    procedure SetActive(const Value: Smallint);
    function GetActive: Smallint;
  public
    property ProductID: TBytes read GetProductID write SetProductID;
    property MandantID: TBytes read GetMandantID write SetMandantID;
    property CategoryID: TBytes read GetCategoryID write SetCategoryID;
    property Code: string read GetCode write SetCode;
    property Title: string read GetTitle write SetTitle;
    property CreateUserID: TBytes read GetCreateUserID write SetCreateUserID;
    property UpdateUserID: TBytes read GetUpdateUserID write SetUpdateUserID;
    property UpdateDate: TDateTime read GetUpdateDate write SetUpdateDate;
    property Status: Smallint read GetStatus write SetStatus;
    property Active: Smallint read GetActive write SetActive;
  end;


implementation


{ TProductEntity }


procedure TEntityProduct.SetProductID(const Value: TBytes);
begin
  FProductID := Value;
end;

function TEntityProduct.GetProductID: TBytes;
begin
  Result := FProductID;
end;

procedure TEntityProduct.SetMandantID(const Value: TBytes);
begin
  FMandantID := Value;
end;

function TEntityProduct.GetMandantID: TBytes;
begin
  Result := FMandantID;
end;

procedure TEntityProduct.SetCategoryID(const Value: TBytes);
begin
  FCategoryID := Value;
end;

function TEntityProduct.GetCategoryID: TBytes;
begin
  Result := FCategoryID;
end;

procedure TEntityProduct.SetCode(const Value: string);
begin
  FCode := Value;
end;

function TEntityProduct.GetCode: string;
begin
  Result := FCode;
end;

procedure TEntityProduct.SetTitle(const Value: string);
begin
  FTitle := Value;
end;

function TEntityProduct.GetTitle: string;
begin
  Result := FTitle;
end;

procedure TEntityProduct.SetCreateUserID(const Value: TBytes);
begin
  FCreateUserID := Value;
end;

function TEntityProduct.GetCreateUserID: TBytes;
begin
  Result := FCreateUserID;
end;

procedure TEntityProduct.SetUpdateUserID(const Value: TBytes);
begin
  FUpdateUserID := Value;
end;

function TEntityProduct.GetUpdateUserID: TBytes;
begin
  Result := FUpdateUserID;
end;

procedure TEntityProduct.SetUpdateDate(const Value: TDateTime);
begin
  FUpdateDate := Value;
end;

function TEntityProduct.GetUpdateDate: TDateTime;
begin
  Result := FUpdateDate;
end;

procedure TEntityProduct.SetStatus(const Value: Smallint);
begin
  FStatus := Value;
end;

function TEntityProduct.GetStatus: Smallint;
begin
  Result := FStatus;
end;

procedure TEntityProduct.SetActive(const Value: Smallint);
begin
  FActive := Value;
end;

function TEntityProduct.GetActive: Smallint;
begin
  Result := FActive;
end;
// Implement setters and getters for other properties...
end.

