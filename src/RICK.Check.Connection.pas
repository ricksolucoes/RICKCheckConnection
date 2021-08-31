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

    constructor Create;
  public
    destructor Destroy; override;
    class function New: iRICKCheckConnection;

    function ConnectionState: Boolean; overload;
    function ConnectionState(AURL: string): Boolean; overload;
    function ConnectionType: string;
  end;

implementation

{ TRICKCheckConnection }

function TRICKCheckConnection.ConnectionState(AURL: string): Boolean;
const
  URL = 'https://google.com';
var
  LStatusCode: Integer;
  LHTTPClient: THTTPClient;
begin
  Result:= False;
  FConnectionType := 'Off Line';

  LStatusCode := 200;
  if AURL.Trim.IsEmpty then
  begin
    AURL := URL;
    LStatusCode := 400;
  end;

  LHTTPClient := THTTPClient.Create;
  try
    try
      case LStatusCode of
        200:
          Result := LHTTPClient.Head(AURL).StatusCode = LStatusCode;
        400:
          Result := LHTTPClient.Head(AURL).StatusCode < LStatusCode;
      end;

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
      case LNetworkState of
        IsWifiConnected:
          begin
            FConnectionType := 'Wifi';
            Result := True;
          end;
        IsMobileConnected:
          begin
            FConnectionType := 'Mobile';
            Result := True;
          end;
      else
        Result := False;
      end;
{$ELSE}
      Result := ConnectionState(EmptyStr);
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

end;

destructor TRICKCheckConnection.Destroy;
begin

  inherited;
end;

class function TRICKCheckConnection.New: iRICKCheckConnection;
begin
  Result := Self.Create;
end;

end.
