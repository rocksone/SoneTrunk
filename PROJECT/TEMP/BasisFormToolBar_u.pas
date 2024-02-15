unit BasisFormToolBar_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasisTemplatte_u, dxBar, cxClasses,
  System.Actions, Vcl.ActnList, JvComponentBase, JvEnterTab;

type
  T_frmBasisFormToolBar = class(T_frmBasisTemplatte)
    act: TActionList;
    actInsert: TAction;
    actPost: TAction;
    actEdit: TAction;
    actRefresh: TAction;
    actCancel: TAction;
    actDelete: TAction;
    actLanguage: TAction;
    actPrint: TAction;
    actExport: TAction;
    bm: TdxBarManager;
    bmBarEdit: TdxBar;
    bbInsert: TdxBarLargeButton;
    bbEdit: TdxBarLargeButton;
    bbDelete: TdxBarLargeButton;
    bbLanguage: TdxBarLargeButton;
    bbPost: TdxBarLargeButton;
    bbCancel: TdxBarLargeButton;
    bbRefresh: TdxBarLargeButton;
    bbPrint: TdxBarLargeButton;
    bbExport: TdxBarLargeButton;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  _frmBasisFormToolBar: T_frmBasisFormToolBar;

implementation

{$R *.dfm}

end.
