<cfset wsURL = "http://localhost:80/coldfusion/movieDataService/hello.cfc?wsdl">

<!---
<cfinvoke webservice="#wsurl#" method="helloWorld" returnvariable="result">
--->

<cfobject name="wsTest" webservice="#wsURL#" type="webservice"/>

<cfdump var="#wsTest.helloWorld()#">

<cfset wsURL = "http://localhost:80/coldfusion/movieDataService/complex.cfc?wsdl">

<cfset varStruct = {key1:"value 1", key2:"value 2"} >
<!-- Passing arguments with cfinvokeparam --->
<cfinvoke webservice = "#wsURL#"
           method = "echoStruct"
           returnVariable = "result">
   <cfinvokeargument name="argStruct" value="#varStruct#" >
</cfinvoke>

<h2> Dumping struct </h2>
<cfdump var="#result#"/>

<cfset varQuery = QueryNew("column1,column2,column3") >
<cfset QueryAddRow(varQuery,["row 1", "row 2", "row 3"])>

<!-- Passing arguments inline as key value pair --->
<cfinvoke webservice = "#wsURL#"
           method = "echoQuery"
           argQuery = "#varQuery#"
           returnVariable = "result">
</cfinvoke>

<h2> Dumping query </h2>
<cfdump var="#result#"/>

<!-- Passing arguments as argument collection --->
<cfinvoke webservice = "#wsURL#"
           method = "echoAny"
           argumentcollection = "#{argAny:'passing a string'}#"
           returnVariable = "result">
</cfinvoke>

<h2> Dumping String </h2>
<cfdump var="#result#"/>

<cfinvoke webservice="#wsURL#" method="concatenateString" returnvariable="result">
	<cfinvokeargument name="argAny" value="Hello " omit="true" />
	<cfinvokeargument name="argAny2" value="Vipin!!" omit="false" />
</cfinvoke>

<h2> Dumping Contatenated string </h2>
<cfdump var="#result#"/>