# RICKCheckConnection

<p align="center">
  <b>RICKCheckConnection</b> is a Delphi library designed to check the state and type(Mobile only) of the connection. Using delphi's Fluent Interface.<br> 
</p>

<h2>⚙️ Install</h2>
<p>*Pre-requisites Delphi FMX</p>
<li><strong>Installation with BOSS</strong>: <br>
<pre>$ boss install https://github.com/ricksolucoes/RICKCheckConnection</pre>

<li><strong>Manual Installation</strong>: <br>
Add the following folders to your project, in <em>Project &gt; Options &gt; Resource Compiler &gt; Directories and Conditionals &gt; Include file search path</em></li>
<pre><code>../RICKCheckConnection/src</code></pre>

<h2>⚡️ How to use the project</h2>
<pre><code>../RICKCheckConnection/src</code></pre>

<li><strong>How to use incoming Internet.</strong>: <br>

<pre><span class="pl-k">uses</span>
  RICK.Check.Connection,
  RICK.Check.Connection.Intefaces;

<span class="pl-k">implementation</span>

var
  LRICKCheckConnection: iRICKCheckConnection;
begin
  LRICKCheckConnection:= TRICKCheckConnection.New;

  if LRICKCheckConnection.ConnectionState then
    Self.Fill.Color:= TAlphaColorRec.Blue
  else
    Self.Fill.Color:= TAlphaColorRec.Red;

  lblConn.Text:= LRICKCheckConnection.ConnectionType;
end;</span></pre>

<li><strong>How to use the connection type (Type is only available in Mobile. Desktop only ON and OFF)</strong>: <br>

<pre><span class="pl-k">uses</span>
  RICK.Check.Connection;

<span class="pl-k">implementation</span>

begin
  lblConn.Text:= TRICKCheckConnection.New.ConnectionType;
end;</span></pre>

<li><strong>How to use connection test for a given link.</strong>: <br>

<pre><span class="pl-k">uses</span>
  RICK.Check.Connection,
  RICK.Check.Connection.Intefaces;

<span class="pl-k">implementation</span>

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
end;</span></pre>