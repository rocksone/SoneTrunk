unit UnitViewModelContacts;

interface

uses
  SysUtils
  , Classes
  , Generics.Collections
  , UnitEntityContact
  , DBClient
  , Data.DB
  , FireDAC.Comp.Client
  , Dialogs
  , xGlobalVars_u
  , cxGrid
  , cxGridDBTableView
  , cxGridTableView
  , UnitEntityPersonInfo
  , FireDAC.Stan.Param
  ;


type
  TViewModelContacts = class
  private
    FContacts: TObjectList<TEntityContact>;
    FFocusContact : TEntityContact;
  public
    constructor Create;
    destructor Destroy; override;
    property Contacts: TObjectList<TEntityContact> read FContacts write FContacts;
    property FocusContact: TEntityContact read FFocusContact write FFocusContact;
  end;

implementation

constructor TViewModelContacts.Create;
begin
  inherited;
  Self.Contacts := TObjectList<TEntityContact>.Create;
  Self.FocusContact := TEntityContact.Create;
end;

destructor TViewModelContacts.Destroy;
begin
  Self.Contacts.Free;
  Self.FocusContact.Free;
  inherited;
end;



end.

