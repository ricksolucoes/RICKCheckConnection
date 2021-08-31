unit RICK.Check.Connection.Intefaces;

interface
type
  iRICKCheckConnection = interface
    ['{FBE31209-0B9B-420D-A6B4-CD886A41A856}']
    function ConnectionState: Boolean; overload;
    function ConnectionState(AURL: string): Boolean; overload;
    function ConnectionType: string;
  end;
implementation

end.
