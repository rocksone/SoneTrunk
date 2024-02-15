// ---------------------------------------------------------------------------------------------------------------------
// UNIT          : BasisDialog
// PURPOSE       : The Basis for all Dialogs
// CREATE AUTOR  : Robert Feick & Göksel Yücel
// CO-AUTOR      :
// DATE          : 04.08.2023
// ---------------------------------------------------------------------------------------------------------------------
unit BasisDialog;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Actions,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ActnList,
  BasisTemplatte_u,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxButtons, cxControls, cxContainer, cxEdit, cxLabel, cxImage, cxGeometry, dxFramedControl, dxPanel, JvComponentBase, JvEnterTab;

type
  T_frmBasisDialog = class(T_frmBasisTemplatte)
    btnOK: TcxButton;
    lbFormTitle: TcxLabel;
    btnCancel: TcxButton;
    pnlTop: TdxPanel;
    pnlBotton: TdxPanel;
    procedure actCloseExecute(Sender: TObject);
    procedure actDlgOkExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  _frmBasisDialog: T_frmBasisDialog;

implementation

{$R *.dfm}

uses dmDatabase_u, dmStyle_u, xGlobalVars_u;

procedure T_frmBasisDialog.actCloseExecute(Sender: TObject);
begin
  inherited;
  ModalResult := mrClose;
end;

procedure T_frmBasisDialog.actDlgOkExecute(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure T_frmBasisDialog.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #27 then
  begin
    Key := #0;
    Close;
  end;
end;

end.
