unit RICK.Check.Connection.View.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit;

type
  TfrmDemo = class(TForm)
    lblConn: TLabel;
    btnCheckConnection: TRectangle;
    lblCheckConnection: TLabel;
    btnTestLink: TRectangle;
    lblTestLink: TLabel;
    edtTestLink: TEdit;
    lnTestLink: TLine;
    btnConnectionType: TRectangle;
    lblConnectionType: TLabel;
    procedure btnCheckConnectionClick(Sender: TObject);
    procedure btnTestLinkClick(Sender: TObject);
    procedure btnConnectionTypeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDemo: TfrmDemo;

implementation

{$R *.fmx}
uses
  RICK.Check.Connection,
  RICK.Check.Connection.Intefaces;

procedure TfrmDemo.btnConnectionTypeClick(Sender: TObject);
begin
  lblConn.Text:= TRICKCheckConnection.New.ConnectionType;
end;

procedure TfrmDemo.btnTestLinkClick(Sender: TObject);
var
  LRICKCheckConnection: iRICKCheckConnection;
begin
  LRICKCheckConnection:= TRICKCheckConnection.New;
  LRICKCheckConnection.ClearURL.URL(edtTestLink.Text);
  LRICKCheckConnection.ClearStausCode.StatusCode(200); //Status Code Defualt 400

  if LRICKCheckConnection.URLState then
    Self.Fill.Color:= TAlphaColorRec.Blue
  else
    Self.Fill.Color:= TAlphaColorRec.Red;


  lblConn.Text:= LRICKCheckConnection.ConnectionType;
end;

procedure TfrmDemo.btnCheckConnectionClick(Sender: TObject);
var
  LRICKCheckConnection: iRICKCheckConnection;
begin
  LRICKCheckConnection:= TRICKCheckConnection.New;

  if LRICKCheckConnection.ConnectionState then
    Self.Fill.Color:= TAlphaColorRec.Blue
  else
    Self.Fill.Color:= TAlphaColorRec.Red;

  lblConn.Text:= LRICKCheckConnection.ConnectionType;
end;

end.
