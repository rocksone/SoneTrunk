unit UnitControllerContacts;

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
  , UnitViewModelContacts
  , Forms
  , Controls
  , cxLabel
  , cxLookupEdit
  , cxMaskEdit
  , cxCurrencyEdit
  , cxCheckBox
  , dxBar
  , cxEdit
  , System.Rtti
  , cxCheckComboBox
  , cxControls
  , cxLookAndFeelPainters
  , cxContainer
  , cxTextEdit
  ;


type
  TControllerContacts = class
  private
    FViewModelContacts: TViewModelContacts;
    FFDConnection : TFDConnection;
    function CreateAndFillDataSource(paramClientDataSet: TClientDataSet = nil): TDataSource;
    function InsertMainPerson(const Contact: TEntityContact): Boolean;
  public
    constructor Create(paramConnection : TFDConnection);
    destructor Destroy; override;
    function AddMultiContactsToDB(): Boolean;
    function UpdateMultiContactsInDB(): Boolean;

    function LoadContactsFromDB(): Integer;
    function SaveContactToDB(Contact: TEntityContact): Boolean;
    function UpdateContactInDB(Contact: TEntityContact): Boolean;
    function LoadOneContactFromDB(paramContactID: Integer): Integer;

    procedure VisualTo(paramDataSource: TDataSource); overload;
    procedure VisualTo(Grid: TcxGrid); overload;
    procedure VisualTo(TableView: TcxGridDBTableView); overload;
    property ViewModelContacts: TViewModelContacts read FViewModelContacts write FViewModelContacts;
    property FDConnection: TFDConnection read FFDConnection write FFDConnection;
  end;

implementation


constructor TControllerContacts.Create(paramConnection : TFDConnection);
begin
  inherited Create;
  Self.FDConnection := paramConnection;
  Self.ViewModelContacts := TViewModelContacts.Create;
  Self.ViewModelContacts.FocusContact := TEntityContact.Create;
end;

destructor TControllerContacts.Destroy;
begin
  ViewModelContacts.Free;
  inherited;
end;


function TControllerContacts.CreateAndFillDataSource(paramClientDataSet: TClientDataSet = nil): TDataSource;
var
  LContact: TEntityContact;
  LPerson: TEntityPersonInfo;
  LDataSet: TClientDataSet;
begin
  if paramClientDataSet = nil then
  begin
    LDataSet := TClientDataSet.Create(nil);
    Result := TDataSource.Create(nil);
  end
  else
  begin
    LDataSet := paramClientDataSet;
    Result := paramClientDataSet.DataSource;
  end;
  if LDataSet = nil then
    Exit;
  LDataSet.FieldDefs.Clear;
  LDataSet.FieldDefs.Add('Contact_ID', ftInteger);
  LDataSet.FieldDefs.Add('MatchCode', ftString, 100);
  LDataSet.FieldDefs.Add('Person_ID', ftInteger);
  LDataSet.FieldDefs.Add('Language_ID', ftInteger);
  LDataSet.FieldDefs.Add('Saludation_ID', ftInteger);
  LDataSet.FieldDefs.Add('Title_ID', ftInteger);
  LDataSet.FieldDefs.Add('Position_ID', ftInteger);
  LDataSet.FieldDefs.Add('Area_ID', ftInteger);
  LDataSet.FieldDefs.Add('FName', ftString, 100);
  LDataSet.FieldDefs.Add('LName', ftString, 100);
  LDataSet.FieldDefs.Add('Extra', ftString, 100);
  LDataSet.FieldDefs.Add('BirthDate', ftDateTime);
  LDataSet.FieldDefs.Add('User_Level', ftSmallint);
  LDataSet.FieldDefs.Add('User_CreateID', ftInteger);
  LDataSet.FieldDefs.Add('User_UpdateID', ftInteger);
  LDataSet.FieldDefs.Add('User_Create', ftDateTime);
  LDataSet.FieldDefs.Add('User_Update', ftDateTime);
  LDataSet.FieldDefs.Add('Status', ftSmallint);
  LDataSet.FieldDefs.Add('Active', ftSmallint);
  LDataSet.FieldDefs.Add('Gender', ftString, 10);
  LDataSet.CreateDataSet;
  for LContact in Self.ViewModelContacts.Contacts do
  begin
    LDataSet.Append;
    LDataSet.FieldByName('Contact_ID').AsInteger := LContact.Contact_ID;
    LDataSet.FieldByName('MatchCode').AsString := LContact.MatchCode;
    if LContact.Persons.Count > 0 then
    begin
      LPerson := LContact.Persons[0];
      LDataSet.FieldByName('Person_ID').AsInteger := LPerson.Person_ID;
      LDataSet.FieldByName('Language_ID').AsInteger := LPerson.Language_ID;
      LDataSet.FieldByName('Saludation_ID').AsInteger := LPerson.Saludation_ID;
      LDataSet.FieldByName('Title_ID').AsInteger := LPerson.Title_ID;
      LDataSet.FieldByName('Position_ID').AsInteger := LPerson.Position_ID;
      LDataSet.FieldByName('Area_ID').AsInteger := LPerson.Area_ID;
      LDataSet.FieldByName('FName').AsString := LPerson.FName;
      LDataSet.FieldByName('LName').AsString := LPerson.LName;
      LDataSet.FieldByName('Extra').AsString := LPerson.Extra;
      LDataSet.FieldByName('BirthDate').AsDateTime := LPerson.BirthDate;
      LDataSet.FieldByName('User_Level').AsInteger := LPerson.User_Level;
      LDataSet.FieldByName('User_CreateID').AsInteger := LPerson.User_CreateID;
      LDataSet.FieldByName('User_UpdateID').AsInteger := LPerson.User_UpdateID;
      LDataSet.FieldByName('User_Create').AsDateTime := LPerson.User_Create;
      LDataSet.FieldByName('User_Update').AsDateTime := LPerson.User_Update;
      LDataSet.FieldByName('Status').AsInteger := LPerson.Status;
      LDataSet.FieldByName('Active').AsInteger := LPerson.Active;
      LDataSet.FieldByName('Gender').AsInteger := LPerson.Gender;
    end;
    LDataSet.Post;
  end;
  Result.DataSet := LDataSet;
end;

procedure TControllerContacts.VisualTo(Grid: TcxGrid);
var
  View: TcxGridDBTableView;
begin
  if Grid = nil then
    Exit;

  while Grid.ViewCount > 0 do // Entfernen Sie vorhandene Ansichten, falls vorhanden
    Grid.Views[0].Free;

  View := TcxGridDBTableView.Create(Grid);
  View.Name := 'TableView';
  View.DataController.DataSource := Self.CreateAndFillDataSource;
  View.DataController.CreateAllItems;
  View.OptionsData.Editing := False;
end;


//procedure TControllerContacts.VisualTo(paramFrmContactEdit: TfrmContactEdit);
//var
//  i: Integer;
//  LControl: TControl;
//  LContact: TEntityContact;
//  Lctx: TRttiContext;
//  LobjTypeEntityContact: TRttiType;
//  LobjTypeEntityPerson: TRttiType;
//  Lprop: TRttiProperty;
//  LpropValue: TValue;
//  LObjPropName: String;
//begin
//  // Überprüfen, ob paramFrmContactEdit oder ViewModelContacts nicht nil ist
//  if (paramFrmContactEdit = nil) or (Self.ViewModelContacts = nil) then
//    Exit;
//
//  // TRttiContext und TRttiType einmalig erstellen
//  Lctx := TRttiContext.Create;
//  try
//    // Durchlaufen aller Controls in paramFrmContactEdit
//    for i := 0 to paramFrmContactEdit.ComponentCount - 1 do
//    begin
//      LControl := TControl(paramFrmContactEdit.Components[i]);
//
//      // Überprüfen, ob das Control zu den unterstützten Typen gehört
//      if (LControl is TcxCheckBox)
//      or (LControl is TcxCurrencyEdit)
//      or (LControl is TcxCheckComboBox)
//      or (LControl is TcxMaskEdit)
//      or (LControl is TcxTextEdit)
//      then
//      begin
//        // Nur wenn in der Liste nur ein Eintrag ist
//        If (Self.ViewModelContacts.Contacts.Count = 1) then
//        begin
//          LContact := Self.ViewModelContacts.Contacts[0];
//
//
//
//          // Durchlaufen aller Properties des Kontakt-Typs
//          LObjPropName := '';
//          LobjTypeEntityContact := Lctx.GetType(TEntityContact);
//          for Lprop in LobjTypeEntityContact.GetProperties do
//          begin
//            LObjPropName := Lprop.Name;
//            if Lprop.IsReadable and (Pos(LObjPropName, LControl.Name) > 0) then // Überprüfen, ob der Property-Name im Control-Namen enthalten ist
//            begin
//              try
//                LpropValue := Lprop.GetValue(LContact);
//              except
//                on E: Exception do
//                begin
//                  ShowMessage(E.Message + ':: LpropValue: ' + LpropValue.ToString + ' LControl:' + LControl.ClassName);
//                end;
//              end;
//              break;
//            end;
//          end; //for propertys EntityContacts
//
//          // Durchlaufen aller Properties des Person
//          LObjPropName := '';
//          if LContact.Persons.Count > 0 then
//          begin
//            LobjTypeEntityPerson := Lctx.GetType(TEntityPersonInfo);
//            for Lprop in LobjTypeEntityPerson.GetProperties do
//            begin
//              LObjPropName := Lprop.Name;
//              if Lprop.IsReadable and (Pos(LObjPropName, LControl.Name) > 0) then // Überprüfen, ob der Property-Name im Control-Namen enthalten ist
//              begin
//                try
//                  LpropValue := Lprop.GetValue(LContact.Persons[0]);
//                except
//                  on E: Exception do
//                  begin
//                    ShowMessage(E.Message + ':: LpropValue: ' + LpropValue.ToString + ' LControl:' + LControl.ClassName);
//                  end;
//                end;
//                break;
//              end;
//            end; //for propertys EntityContacts
//          end;
//
//          // Setzen des Control-Werts basierend auf dem Property-Typ
//          if LpropValue.IsEmpty then
//          begin
//            //ShowMessage('LpropValue is Nil!');
//          end
//          else if LControl is TcxCheckBox then
//          begin
//            TcxCheckBox(LControl).Checked := StrToBoolDef(LpropValue.ToString, False);
//          end
//          else if LControl is TcxCurrencyEdit then
//          begin
//            TcxCurrencyEdit(LControl).EditValue := LpropValue.ToString;
//          end
//          else if LControl is TcxTextEdit then
//          begin
//            TcxTextEdit(LControl).Text := LpropValue.ToString;
//          end
//          else if LControl is TcxCheckComboBox then
//          begin
//            TcxCheckComboBox(LControl).Text := LpropValue.ToString;
//          end
//          else if LControl is TcxLabel then
//          begin
//            TcxLabel(LControl).Caption := LpropValue.ToString;
//          end
//          else if LControl is TcxMaskEdit then
//          begin
//            TcxMaskEdit(LControl).Text := LpropValue.ToString;
//          end;
//        end; //if List 1 EntityContacts
//      end;
//    end;  //for Comonents
//  finally
//    Lctx.Free;
//  end;
//end;




//procedure TControllerContacts.VisualTo(paramFrmContactEdit: TfrmContactEdit);
//var
//  i: Integer;
//  LControl: TControl;
//  LContact: TEntityContact;
//  Lctx: TRttiContext;
//  LobjType: TRttiType;
//  Lprop: TRttiProperty;
//  LpropValue: TValue;
//  LObjPropName: String;
//begin
//  if (paramFrmContactEdit = nil) or (Self.ViewModelContacts = nil) then
//    Exit;
//  ///---
//  for i := 0 to paramFrmContactEdit.ComponentCount - 1 do
//  begin
//    LControl := TControl(paramFrmContactEdit.Components[i]);
//    if (LControl is TcxCheckBox)
//    or (LControl is TcxCurrencyEdit)
//    or (LControl is TcxCheckComboBox)
//    or (LControl is TcxLabel)
//    or (LControl is TcxMaskEdit)
//    or (LControl is TcxTextEdit)
//    then
//    begin
//      for LContact in Self.ViewModelContacts.Contacts do
//      begin
//        Lctx := TRttiContext.Create;
//        try
//          LobjType := Lctx.GetType(LContact.ClassType);
//          for Lprop in LobjType.GetProperties do
//          begin
//            LObjPropName := Lprop.Name;
//            if Lprop.IsReadable
//            and (Pos(LObjPropName, LControl.Name) > 0)
//            then
//            begin
//              try
//                LpropValue := Lprop.GetValue(LControl);
//              except
//                on E: Exception do
//                begin
//                  ShowMessage(E.Message + ':: LpropValue: ' + LpropValue.ToString  + ' LControl:' + LControl.ClassName);
//                end;
//              end;
//              if LpropValue.IsEmpty then
//              begin
//                //ShowMessage('LpropValue is Nil!');
//              end
//              else
//              if LControl is TcxCheckBox then
//              begin
//                TcxCheckBox(LControl).Checked := StrToBoolDef(LpropValue.ToString, false);
//              end
//              else if LControl is TcxCurrencyEdit then
//              begin
//                TcxCurrencyEdit(LControl).EditValue := LpropValue.ToString;
//              end
//              else if LControl is TcxTextEdit then
//              begin
//                TcxCurrencyEdit(LControl).Text := LpropValue.ToString;
//              end
//              else if LControl is TcxCheckComboBox then
//              begin
//                TcxCheckComboBox(LControl).Text := LpropValue.ToString;
//              end
//              else if LControl is TcxLabel then
//              begin
//                TcxLabel(LControl).Caption := LpropValue.ToString;
//              end
//              else if LControl is TcxMaskEdit then
//              begin
//                TcxMaskEdit(LControl).Text := LpropValue.ToString;
//              end;
//            end;  //for
//          end;
//        finally
//          Lctx.Free;
//        end;
//      end; // for
//    end;  //if
//  end; //for
//end;


procedure TControllerContacts.VisualTo(TableView: TcxGridDBTableView);
begin
  if TableView = nil then
    Exit;

  TableView.BeginUpdate;
  try
    while TableView.ColumnCount > 0 do
      TableView.Columns[0].Free;

    TableView.DataController.DataSource := CreateAndFillDataSource; // Setzen Sie Ihre DataSource hier
    TableView.DataController.CreateAllItems;
    TableView.OptionsData.Editing := False;
  finally
    TableView.EndUpdate;
  end;
end;

procedure TControllerContacts.VisualTo(paramDataSource: TDataSource);
var
  LDataSet: TClientDataSet;
  LContact: TEntityContact;
  LPerson: TEntityPersonInfo;
begin
  if paramDataSource = nil then
  begin
    Exit;
  end;
  LDataSet := TClientDataSet.Create(nil);
  try
    if LDataSet.Active then
    begin
      LDataSet.Active := false;
      LDataSet.Close;
    end;
    LDataSet.FieldDefs.Clear;
    LDataSet.FieldDefs.Add('Contact_ID', ftInteger);
    LDataSet.FieldDefs.Add('MatchCode', ftString, 100);
    LDataSet.FieldDefs.Add('Person_ID', ftInteger);
    LDataSet.FieldDefs.Add('Language_ID', ftInteger);
    LDataSet.FieldDefs.Add('Saludation_ID', ftInteger);
    LDataSet.FieldDefs.Add('Title_ID', ftInteger);
    LDataSet.FieldDefs.Add('Position_ID', ftInteger);
    LDataSet.FieldDefs.Add('Area_ID', ftInteger);
    LDataSet.FieldDefs.Add('FName', ftString, 100);
    LDataSet.FieldDefs.Add('LName', ftString, 100);
    LDataSet.FieldDefs.Add('Extra', ftString, 100);
    LDataSet.FieldDefs.Add('BirthDate', ftDateTime);
    LDataSet.FieldDefs.Add('User_Level', ftSmallint);
    LDataSet.FieldDefs.Add('User_CreateID', ftInteger);
    LDataSet.FieldDefs.Add('User_UpdateID', ftInteger);
    LDataSet.FieldDefs.Add('User_Create', ftDateTime);
    LDataSet.FieldDefs.Add('User_Update', ftDateTime);
    LDataSet.FieldDefs.Add('Status', ftSmallint);
    LDataSet.FieldDefs.Add('Active', ftSmallint);
    LDataSet.FieldDefs.Add('Gender', ftString, 10);
    LDataSet.CreateDataSet;
    if NOT LDataSet.Active then
    begin
      LDataSet.Active := true;
      LDataSet.Open;
    end;
    for LContact in Self.ViewModelContacts.Contacts do
    begin
      LDataSet.Append;
      LDataSet.FieldByName('Contact_ID').AsInteger := LContact.Contact_ID;
      LDataSet.FieldByName('MatchCode').AsString := LContact.MatchCode;
      if LContact.Persons.Count > 0 then
      begin
        LPerson := LContact.Persons[0];
        LDataSet.FieldByName('Person_ID').AsInteger := LPerson.Person_ID;
        LDataSet.FieldByName('Language_ID').AsInteger := LPerson.Language_ID;
        LDataSet.FieldByName('Saludation_ID').AsInteger := LPerson.Saludation_ID;
        LDataSet.FieldByName('Title_ID').AsInteger := LPerson.Title_ID;
        LDataSet.FieldByName('Position_ID').AsInteger := LPerson.Position_ID;
        LDataSet.FieldByName('Area_ID').AsInteger := LPerson.Area_ID;
        LDataSet.FieldByName('FName').AsString := LPerson.FName;
        LDataSet.FieldByName('LName').AsString := LPerson.LName;
        LDataSet.FieldByName('Extra').AsString := LPerson.Extra;
        LDataSet.FieldByName('BirthDate').AsDateTime := LPerson.BirthDate;
        LDataSet.FieldByName('User_Level').AsInteger := LPerson.User_Level;
        LDataSet.FieldByName('User_CreateID').AsInteger := LPerson.User_CreateID;
        LDataSet.FieldByName('User_UpdateID').AsInteger := LPerson.User_UpdateID;
        LDataSet.FieldByName('User_Create').AsDateTime := LPerson.User_Create;
        LDataSet.FieldByName('User_Update').AsDateTime := LPerson.User_Update;
        LDataSet.FieldByName('Status').AsInteger := LPerson.Status;
        LDataSet.FieldByName('Active').AsInteger := LPerson.Active;
        LDataSet.FieldByName('Gender').AsInteger := LPerson.Gender;
      end;
      LDataSet.Post;
    end; //for
    TDataSource(paramDataSource).DataSet := LDataSet;
  except
    LDataSet.Free;
    raise;
  end;
end;



function TControllerContacts.InsertMainPerson(const Contact: TEntityContact): Boolean;
var
  PersonInsertQuery: TFDQuery;
begin
  Result := False;
  if not Assigned(Contact.MainPerson) then
    Exit;
  PersonInsertQuery := TFDQuery.Create(nil);
  try
    PersonInsertQuery.Connection := Self.FDConnection;
    PersonInsertQuery.SQL.Text :=
      'INSERT INTO con_person ' +
      '(Contact_ID, Contact_GID, Language_ID, Saludation_ID, Title_ID, Position_ID, Area_ID, ' +
      'Gender, FName, LName, Extra, BirthDate, User_level, User_create_id, ' +
      'User_update_id, User_create, User_update, Active) ' +
      'VALUES ' +
      '(:Contact_ID, :Contact_GID, :Language_ID, :Saludation_ID, :Title_ID, :Position_ID, :Area_ID, ' +
      ':Gender, :FName, :LName, :Extra, :BirthDate, :User_level, :User_create_id, ' +
      ':User_update_id, :User_create, :User_update, :Active)';

    // Setze die Parameterwerte für die Hauptperson (MainPerson)
    PersonInsertQuery.ParamByName('Contact_ID').AsInteger := Contact.Contact_ID;
//    PersonInsertQuery.ParamByName('Contact_GID').AsBytes := Contact.MainPerson.Contact_GID;
    PersonInsertQuery.ParamByName('Language_ID').AsInteger := Contact.MainPerson.Language_ID;
    PersonInsertQuery.ParamByName('Saludation_ID').AsInteger := Contact.MainPerson.Saludation_ID;
    PersonInsertQuery.ParamByName('Title_ID').AsInteger := Contact.MainPerson.Title_ID;
    PersonInsertQuery.ParamByName('Position_ID').AsInteger := Contact.MainPerson.Position_ID;
    PersonInsertQuery.ParamByName('Area_ID').AsInteger := Contact.MainPerson.Area_ID;
    PersonInsertQuery.ParamByName('Gender').AsInteger := Contact.MainPerson.Gender;
    PersonInsertQuery.ParamByName('FName').AsString := Contact.MainPerson.FName;
    PersonInsertQuery.ParamByName('LName').AsString := Contact.MainPerson.LName;
    PersonInsertQuery.ParamByName('Extra').AsString := Contact.MainPerson.Extra;
    PersonInsertQuery.ParamByName('BirthDate').AsDate := Contact.MainPerson.BirthDate;
    PersonInsertQuery.ParamByName('User_level').AsInteger := Contact.MainPerson.User_level;
    PersonInsertQuery.ParamByName('User_create_id').AsInteger := Contact.MainPerson.User_CreateID;
    PersonInsertQuery.ParamByName('User_update_id').AsInteger := Contact.MainPerson.User_UpdateID;
    PersonInsertQuery.ParamByName('User_create').AsDateTime := Contact.MainPerson.User_create;
    PersonInsertQuery.ParamByName('User_update').AsDateTime := Contact.MainPerson.User_update;
    PersonInsertQuery.ParamByName('Active').AsInteger := Contact.MainPerson.Active;
    PersonInsertQuery.ExecSQL;
    Result := True; // Erfolgreich eingefügt
  except
    on E: Exception do
    begin
      ShowMessage('Error inserting main person: ' + E.Message);
    end;
  end;
  PersonInsertQuery.Free;
end;




function TControllerContacts.SaveContactToDB(Contact: TEntityContact): Boolean;
var
  InsertQuery: TFDQuery;
begin
  InsertQuery := TFDQuery.Create(nil);
  try
    InsertQuery.Connection := Self.FDConnection;
    InsertQuery.SQL.Text :=
      'INSERT INTO con_contact ' +
        '(Mandant_ID, Company_ID,  Language_ID, Address_ID, MatchCode, ' +
        'ContactArt, ContactPurpose, User_Level, User_Create_ID, User_Update_ID, ' +
        'User_Create, User_Update, Status, Active) ' +
      ' VALUES ' +
        '(:Mandant_ID, :Company_ID, :Language_ID, :Address_ID, :MatchCode, ' +
        ':ContactArt, :ContactPurpose, :User_Level, :User_Create_ID, :User_Update_ID, ' +
        ':User_Create, :User_Update, :Status, :Active)';
    InsertQuery.ParamByName('Mandant_ID').DataType := ftInteger;
    InsertQuery.ParamByName('Mandant_ID').Clear; //AsInteger := Contact.Mandant_ID;
    InsertQuery.ParamByName('Company_ID').DataType := ftInteger;
    InsertQuery.ParamByName('Company_ID').Clear; //.AsInteger := Contact.Company_ID;
    InsertQuery.ParamByName('Language_ID').DataType := ftInteger;
    InsertQuery.ParamByName('Language_ID').Clear; //.AsInteger := Contact.Language_ID;
    InsertQuery.ParamByName('Address_ID').DataType := ftInteger;
    InsertQuery.ParamByName('Address_ID').Clear;
    InsertQuery.ParamByName('Address_ID').AsInteger := Contact.Address_ID;
    InsertQuery.ParamByName('MatchCode').AsString := Contact.MatchCode;
    InsertQuery.ParamByName('ContactArt').AsInteger := Contact.ContactArt;
    InsertQuery.ParamByName('ContactPurpose').AsInteger := Contact.ContactPurpose;
    InsertQuery.ParamByName('User_Level').AsInteger := Contact.User_Level;
    InsertQuery.ParamByName('User_Create_ID').AsInteger := Contact.User_Create_ID;
    InsertQuery.ParamByName('User_Update_ID').AsInteger := Contact.User_Update_ID;
    InsertQuery.ParamByName('User_Create').AsDateTime := Contact.User_Create;
    InsertQuery.ParamByName('User_Update').AsDateTime := Contact.User_Update;
    InsertQuery.ParamByName('Status').AsInteger := Contact.Status;
    InsertQuery.ParamByName('Active').AsInteger := Contact.Active;
    InsertQuery.ExecSQL;
    InsertQuery.SQL.Text := 'SELECT LAST_INSERT_ID() as Contact_ID';
    InsertQuery.Open;
    Contact.Contact_ID := InsertQuery.FieldByName('Contact_ID').AsInteger;
    InsertQuery.Close;

    // Speichere die Hauptperson (MainPerson)
    if Assigned(Contact.MainPerson) then
    begin
      InsertMainPerson(Contact);
    end;

    Result := True;
  except
    on E: Exception do
    begin
      ShowMessage(InsertQuery.SQL.Text + #13#13 +'Error adding contact: ' + E.Message);
      Result := False;
    end;
  end;
  InsertQuery.Free;
end;

function TControllerContacts.UpdateContactInDB(Contact: TEntityContact): Boolean;
var
  UpdateQuery: TFDQuery;
begin
  UpdateQuery := TFDQuery.Create(nil);
  try
    UpdateQuery.Connection := Self.FDConnection;
    UpdateQuery.SQL.Text :=
      'UPDATE con_contact ' +
      'SET ' +
      'Mandant_ID = :Mandant_ID, Company_ID = :Company_ID, Person_ID = :Person_ID, ' +
      'Language_ID = :Language_ID, Address_ID = :Address_ID, MatchCode = :MatchCode, ' +
      'ContactArt = :ContactArt, ContactPurpose = :ContactPurpose, ' +
      'User_Level = :User_Level, User_Create_ID = :User_Create_ID, ' +
      'User_Update_ID = :User_Update_ID, User_Create = :User_Create, ' +
      'User_Update = :User_Update, Status = :Status, Active = :Active ' +
      'WHERE Contact_ID = :Contact_ID';
    UpdateQuery.ParamByName('Mandant_ID').DataType := ftInteger;
    UpdateQuery.ParamByName('Mandant_ID').Clear; //AsInteger := Contact.Mandant_ID;
    UpdateQuery.ParamByName('Company_ID').DataType := ftInteger;
    UpdateQuery.ParamByName('Company_ID').Clear; //.AsInteger := Contact.Company_ID;
    UpdateQuery.ParamByName('Person_ID').AsInteger := Contact.Person_ID;
    UpdateQuery.ParamByName('Language_ID').DataType := ftInteger;
    UpdateQuery.ParamByName('Language_ID').Clear; //.AsInteger := Contact.Language_ID;
    UpdateQuery.ParamByName('Address_ID').DataType := ftInteger;
    UpdateQuery.ParamByName('Address_ID').AsInteger := Contact.Address_ID;
    UpdateQuery.ParamByName('MatchCode').AsString := Contact.MatchCode;
    UpdateQuery.ParamByName('ContactArt').AsInteger := Contact.ContactArt;
    UpdateQuery.ParamByName('ContactPurpose').AsInteger := Contact.ContactPurpose;
    UpdateQuery.ParamByName('User_Level').AsInteger := Contact.User_Level;
    UpdateQuery.ParamByName('User_Create_ID').AsInteger := Contact.User_Create_ID;
    UpdateQuery.ParamByName('User_Update_ID').AsInteger := Contact.User_Update_ID;
    UpdateQuery.ParamByName('User_Create').AsDateTime := Contact.User_Create;
    UpdateQuery.ParamByName('User_Update').AsDateTime := Contact.User_Update;
    UpdateQuery.ParamByName('Status').AsInteger := Contact.Status;
    UpdateQuery.ParamByName('Active').AsInteger := Contact.Active;
    UpdateQuery.ParamByName('Contact_ID').AsInteger := Contact.Contact_ID;
    UpdateQuery.ExecSQL;
    // Aktualisiere die Hauptperson (MainPerson)
    if Assigned(Contact.MainPerson) then
    begin
      UpdateQuery.SQL.Text :=
        'UPDATE con_person ' +
        'SET ' +
          'Language_ID = :Language_ID, ' +
          'Person_ID = :Person_ID, ' +
//          'Saludation_ID = :Saludation_ID,' +
//          'Title_ID = :Title_ID, ' +
//          'Position_ID = :Position_ID,' +
//          'Area_ID = :Area_ID, ' +
          'FName = :FName, ' +
          'LName = :LName ' +
//          'Extra = :Extra, ' +
//          'BirthDate = :BirthDate, ' +
//          'User_level = :User_level, ' +
//          'User_create_id = :User_create_id,' +
//          'User_update_id = :User_update_id, ' +
//          'User_create = :User_create, ' +
//          'User_update = :User_update, ' +
//          'Status = :Status, ' +
//          'Active = :Active, ' +
//          'Gender = :Gender ' +
        ' WHERE Person_ID = :Person_ID';
      UpdateQuery.ParamByName('Language_ID').AsInteger := Contact.MainPerson.Language_ID;
      UpdateQuery.ParamByName('Person_ID').AsInteger := Contact.MainPerson.Person_ID;
      UpdateQuery.ParamByName('FName').AsString := Contact.MainPerson.FName;
      UpdateQuery.ParamByName('LName').AsString := Contact.MainPerson.LName;
      UpdateQuery.ExecSQL;
    end;
    Result := True;
  except
    on E: Exception do
    begin
      ShowMessage(UpdateQuery.SQL.Text + #13#13 + ' - Error updating contact: ' + E.Message);
      Result := False;
    end;
  end;
  UpdateQuery.Free;
end;


function TControllerContacts.AddMultiContactsToDB(): Boolean;
var
  Contact: TEntityContact;
begin
  Contact := nil;
  Self.FDConnection.Connected := True;
  Self.FDConnection.StartTransaction;
  try
    for Contact in Self.ViewModelContacts.Contacts do
    begin
      if not SaveContactToDB(Contact) then
      begin
        Self.FDConnection.Rollback;
        Result := False;
        Exit;
      end;
    end;
    Self.FDConnection.Commit;
    Result := True;
  except
    on E: Exception do
    begin
      Self.FDConnection.Rollback;
      ShowMessage('Error adding contacts in Primkey [' + Contact.Contact_ID.ToString + '] - ROLLBACK is initialized : ' + E.Message);
      Result := False;
    end;
  end;
end;

function TControllerContacts.UpdateMultiContactsInDB(): Boolean;
var
  Contact: TEntityContact;
begin
  Contact := nil;
  Self.FDConnection.Connected := True;
  Self.FDConnection.StartTransaction;
  try
    for Contact in Self.ViewModelContacts.Contacts do
    begin
      if not UpdateContactInDB(Contact) then
      begin
        Self.FDConnection.Rollback;
        Result := False;
        Exit;
      end;
    end;
    Self.FDConnection.Commit;
    Result := True;
  except
    on E: Exception do
    begin
      Self.FDConnection.Rollback;
      ShowMessage('Error updating contacts in Primkey [' + Contact.Contact_ID.ToString + '] - ROLLBACK is initialized : ' + E.Message);
      Result := False;
    end;
  end;
end;

function TControllerContacts.LoadContactsFromDB(): Integer;
var
  LDQueryContacts: TFDQuery;
  LContact: TEntityContact;
begin
  LDQueryContacts := TFDQuery.Create(nil);
  try
    Self.ViewModelContacts.Contacts.Clear;
    Self.FDConnection.Connected := True;
    LDQueryContacts.Connection := Self.FDConnection;
    LDQueryContacts.SQL.Text := 'SELECT * FROM con_contact';
    LDQueryContacts.Open;
    while not LDQueryContacts.Eof do
    begin
      LContact := TEntityContact.Create;
      LContact.Contact_ID := LDQueryContacts.FieldByName('Contact_ID').AsInteger;
      LContact.Mandant_ID := LDQueryContacts.FieldByName('Mandant_ID').AsInteger;
      LContact.Language_ID := LDQueryContacts.FieldByName('Language_ID').AsInteger;
      LContact.MatchCode := LDQueryContacts.FieldByName('MatchCode').AsString;
      LContact.User_level := LDQueryContacts.FieldByName('User_level').AsInteger;
      LContact.User_create_id := LDQueryContacts.FieldByName('User_create_id').AsInteger;
      LContact.User_update_id := LDQueryContacts.FieldByName('User_update_id').AsInteger;
      LContact.User_create := LDQueryContacts.FieldByName('User_create').AsDateTime;
      LContact.User_update := LDQueryContacts.FieldByName('User_update').AsDateTime;
      LContact.Status := LDQueryContacts.FieldByName('Status').AsInteger;
      LContact.Active := LDQueryContacts.FieldByName('Active').AsInteger;
      LContact.ContactPurpose := LDQueryContacts.FieldByName('ContactPurpose').AsInteger;
      LContact.ContactArt := LDQueryContacts.FieldByName('ContactArt').AsInteger;
      LContact.LoadRefPersons(Self.FDConnection);
      Self.ViewModelContacts.Contacts.Add(LContact);
      LDQueryContacts.Next;
    end;
  finally
    result := LDQueryContacts.RecordCount;
    LDQueryContacts.Free;
  end;
end;

function TControllerContacts.LoadOneContactFromDB(paramContactID:Integer): Integer;
var
  LDQueryContacts: TFDQuery;
begin
  LDQueryContacts := TFDQuery.Create(nil);
  try
    Self.ViewModelContacts.Contacts.Clear;
    Self.FDConnection.Connected := True;
    LDQueryContacts.Connection := Self.FDConnection;
    LDQueryContacts.SQL.Text := 'SELECT * FROM con_contact WHERE Contact_ID = :Contact_ID LIMIT 1';
    LDQueryContacts.ParamByName('Contact_ID').AsInteger := paramContactID;
    LDQueryContacts.Open;
    while not LDQueryContacts.Eof do
    begin
      Self.ViewModelContacts.FocusContact.Contact_ID := LDQueryContacts.FieldByName('Contact_ID').AsInteger;
      Self.ViewModelContacts.FocusContact.Mandant_ID := LDQueryContacts.FieldByName('Mandant_ID').AsInteger;
      Self.ViewModelContacts.FocusContact.Person_ID := LDQueryContacts.FieldByName('Person_ID').AsInteger;
      Self.ViewModelContacts.FocusContact.Address_ID := LDQueryContacts.FieldByName('Address_ID').AsInteger;
      Self.ViewModelContacts.FocusContact.Language_ID := LDQueryContacts.FieldByName('Language_ID').AsInteger;
      Self.ViewModelContacts.FocusContact.MatchCode := LDQueryContacts.FieldByName('MatchCode').AsString;
      Self.ViewModelContacts.FocusContact.User_level := LDQueryContacts.FieldByName('User_level').AsInteger;
      Self.ViewModelContacts.FocusContact.User_create_id := LDQueryContacts.FieldByName('User_create_id').AsInteger;
      Self.ViewModelContacts.FocusContact.User_update_id := LDQueryContacts.FieldByName('User_update_id').AsInteger;
      Self.ViewModelContacts.FocusContact.User_create := LDQueryContacts.FieldByName('User_create').AsDateTime;
      Self.ViewModelContacts.FocusContact.User_update := LDQueryContacts.FieldByName('User_update').AsDateTime;
      Self.ViewModelContacts.FocusContact.Status := LDQueryContacts.FieldByName('Status').AsInteger;
      Self.ViewModelContacts.FocusContact.Active := LDQueryContacts.FieldByName('Active').AsInteger;
      Self.ViewModelContacts.FocusContact.ContactPurpose := LDQueryContacts.FieldByName('ContactPurpose').AsInteger;
      Self.ViewModelContacts.FocusContact.ContactArt := LDQueryContacts.FieldByName('ContactArt').AsInteger;
      Self.ViewModelContacts.FocusContact.LoadMainPerson(Self.FDConnection);
      Self.ViewModelContacts.FocusContact.LoadRefPersons(Self.FDConnection);
      LDQueryContacts.Next;
    end;
  finally
    result := LDQueryContacts.RecordCount;
    LDQueryContacts.Free;
  end;
end;



end.

