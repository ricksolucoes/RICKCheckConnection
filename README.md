[0]: https://github.com/ricksolucoes/boss "Site do BOOS"

# RICKCheckConnection

**RICKCheckConnection**  is a Delphi library designed to check the state and type(Mobile only) of the connection. Using delphi's Fluent Interface.

## ⚙️ Pre-requisites

1. Delphi FMX
2. If you choose to use [BOOS][0] ```https://github.com/ricksolucoes/boss or https://github.com/HashLoad/boss```  the dependency manager, you will have the facility to install all frameworks that are [Pre-requisites](#pre-requisites) for the project.

## 💻 Installation

- By using BOOS
```shell
$ boss install https://github.com/ricksolucoes/RICKCheckConnection
```
- Manual Installation
  - Download the RICKCheckConnection;
  - Add the following folders to your project, in <em>Project &gt; Options &gt; Resource Compiler &gt; Directories and Conditionals &gt; Include file search path ``` ../RICKLibrary/src ```

 ## ⚡️ How to use the project

  Example of using the **RICKLibrary**

- How to use incoming Internet

```delphi  
  uses
    RICK.Check.Connection,
    RICK.Check.Connection.Intefaces;
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
```

- How to use the connection type (Type is only available in Mobile. Desktop only ON and OFF)

```delphi  
  uses
    RICK.Check.Connection;
  begin
    lblConn.Text:= LRICKCheckConnection.ConnectionType;
  end;
```
  
- How to use connection test for a given link.

```delphi  
  uses
    RICK.Check.Connection,
    RICK.Check.Connection.Intefaces;
  var
    LRICKCheckConnection: iRICKCheckConnection;
  begin
    LRICKCheckConnection:= TRICKCheckConnection.New;
    LRICKCheckConnection.ClearURL.URL('https://google.com');
    LRICKCheckConnection.ClearStausCode.StatusCode(200); //Status Code Defualt 400

    if LRICKCheckConnection.URLState then
      Self.Fill.Color:= TAlphaColorRec.Blue
    else
      Self.Fill.Color:= TAlphaColorRec.Red;


    lblConn.Text:= LRICKCheckConnection.ConnectionType;
  end;
```
