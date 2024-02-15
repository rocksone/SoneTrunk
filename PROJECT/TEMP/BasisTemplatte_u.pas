// ---------------------------------------------------------------------------------------------------------------------
// UNIT          : BasisTemplatte_u;
// PURPOSE       : The base for all Forms
// CREATE AUTOR  : Robert Feick & Göksel Yücel
// CO-AUTOR      :
// DATE          : 04.08.2023
// ---------------------------------------------------------------------------------------------------------------------
unit BasisTemplatte_u;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.UITypes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  dxForms, JvComponentBase, JvEnterTab;

type
  T_frmBasisTemplatte = class(TdxForm)
    asTab: TJvEnterAsTab;
    procedure dxFormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    procedure WMNCLButtonDblClk(var msg: TWMNCLButtonDblClk); message WM_NCLBUTTONDBLCLK;

    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  _frmBasisTemplatte: T_frmBasisTemplatte;

implementation

{$R *.dfm}

uses
  dmDatabase_u,
  dmStyle_u;

procedure T_frmBasisTemplatte.dxFormClose(Sender: TObject; var Action: TCloseAction);
begin
  if formStyle = fsMDIChild then
    Action := caFree // Only For MDI
//  else
//    close;
end;

procedure T_frmBasisTemplatte.WMNCLButtonDblClk(var msg: TWMNCLButtonDblClk);
begin
  if (msg.HitTest = HTCAPTION) and (msg.XCursor >= clientwidth - 20) {and (DebugHook <> 0)} then
  begin
    MessageDlg(self.classname + ^j + self.UnitName + '.pas', mtInformation, [mbOK], 0);
    msg.Result := 0;
  end
  else
    inherited;
end;

procedure T_frmBasisTemplatte.FormCreate(Sender: TObject);
begin
  self.Color := dmStyle.stySone_FormBC.Color; // Background Color
end;

end.
