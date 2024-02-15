unit UnitViewModelProducts;


interface
uses
  SysUtils, Classes, Contnrs, Generics.Collections, UnitEntityProduct;
type
  TProductViewModel = class
  private
    FProducts: TObjectList<TEntityProduct>;
  public
    constructor Create;
    destructor Destroy; override;
    property Products: TObjectList<TEntityProduct> read FProducts;
  end;



implementation



constructor TProductViewModel.Create;
begin
  FProducts := TObjectList<TEntityProduct>.Create;
  // Hier könnten Sie die Daten aus der Datenbank laden und in FProducts speichern
  // Zum Beispiel:
  // FProducts := LoadProductsFromDatabase;
end;

destructor TProductViewModel.Destroy;
begin
  FProducts.Free;
  inherited;
end;


end.

