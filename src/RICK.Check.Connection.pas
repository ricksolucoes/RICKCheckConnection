unit RICK.Check.Connection;

interface

uses
  NetworkState,

  System.SysUtils,
  System.Net.HttpClient,

  RICK.Check.Connection.Intefaces;

type
  TRICKCheckConnection = class(TInterfacedObject, iRICKCheckConnection)
  private
    FConnectionType: string;
    FURL: string;
    FStatusCode: Integer;

    constructor Create;
  public
    destructor Destroy; override;
    class function New: iRICKCheckConnection;

    function ConnectionState: Boolean;
    function URLState: Boolean;
    function ConnectionType: string;
    function URL(Const AValue: string): iRICKCheckConnection;
    function ClearURL: iRICKCheckConnection;
    function StatusCode(Const AValue: Integer): iRICKCheckConnection;
    function ClearStausCode: iRICKCheckConnection;
  end;

implementation

{ TRICKCheckConnection }

function TRICKCheckConnection.ClearStausCode: iRICKCheckConnection;
begin
  Result:= Self;
  FStatusCode:= 0;
end;

function TRICKCheckConnection.ClearURL: iRICKCheckConnection;
begin
  Result:= Self;
  FURL:= EmptyStr;
end;

function TRICKCheckConnection.URLState: Boolean;
var
  LHTTPClient: THTTPClient;
begin
  Result:= False;
  FConnectionType := 'Off Line';

  LHTTPClient := THTTPClient.Create;
  try
    try
      Result := LHTTPClient.Head(FURL).StatusCode <= FStatusCode;

      if Result then
        FConnectionType := 'ON Line';

    except
    end;
  finally
    LHTTPClient.DisposeOf;
  end;

end;

function TRICKCheckConnection.ConnectionState: Boolean;
var
  LNetworkState: TNetworkState;
begin
  FConnectionType := 'Off Line';

  LNetworkState := TNetworkState.Create;
  try
    try
{$IFNDEF MSWINDOWS}
      Result:= LNetworkState.IsConnected;
      if not Result then
        Exit;

      Result:= LNetworkState.IsWifiConnected;
      if Result then
      begin
        FConnectionType := 'Wifi';
        Exit;
      end;

      Result:= LNetworkState.IsMobileConnected;
      if Result then
      begin
        FConnectionType := 'Mobile';
        Exit;
      end;
{$ELSE}
      if FURL.Trim.IsEmpty then
        FURL:= 'https://www.google.com/';

      Result := URLState;
{$ENDIF}
    except
      on E: exception do
      begin
        Result := False;
        FConnectionType := E.Message;
      end;
    end;
  finally
    LNetworkState.DisposeOf;
  end;
end;

function TRICKCheckConnection.ConnectionType: string;
begin
  if FConnectionType.Trim.IsEmpty then
    ConnectionState;
    
  Result := FConnectionType;
end;

constructor TRICKCheckConnection.Create;
begin
  FURL:= EmptyStr;
  FStatusCode:= 400;
end;

destructor TRICKCheckConnection.Destroy;
begin

  inherited;
end;

class function TRICKCheckConnection.New: iRICKCheckConnection;
begin
  Result := Self.Create;
end;

function TRICKCheckConnection.StatusCode(Const AValue: Integer): iRICKCheckConnection;
begin
  Result:= Self;
  FStatusCode:= AValue;
end;

function TRICKCheckConnection.URL(Const AValue: string): iRICKCheckConnection;
begin
  Result:= Self;
  FURL:= AValue;
end;

end.
