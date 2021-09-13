unit RICK.Check.Connection.Intefaces;

interface
type
  iRICKCheckConnection = interface
    ['{FBE31209-0B9B-420D-A6B4-CD886A41A856}']
    function ConnectionState: Boolean;
    function URLState: Boolean;
    function ConnectionType: string;
    function URL(Const AValue: string): iRICKCheckConnection;
    function ClearURL: iRICKCheckConnection;
    function StatusCode(Const AValue: Integer): iRICKCheckConnection;
    function ClearStausCode: iRICKCheckConnection;
  end;
implementation

end.
