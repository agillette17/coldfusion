<cfsilent>
	<cfscript>
		variables.queryParam = "parameter1=1&parameter2=2&parameter3=3";
	</cfscript>
</cfsilent>


<cfoutput>
	<a href="/?#variables.queryParam#">Click Me</a>
</cfoutput>