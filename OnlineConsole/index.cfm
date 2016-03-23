<cfset variables.textCode = "">
<cfif structKeyExists(form, "textCode") and len(form.textCode)>
	<cfset variables.textCode = form.textCode>
	
	<cffile action="write" file="N:\Projects\Coldfusion\OnlineConsole\result.cfm">
		<cfoutput>#form.textCode#</cfoutput>
	</cffile>
</cfif>
<cfoutput>
	<div style="width:1200px;margin:auto;">
		<div style="float:left;width:570px;
			border: 2px ##A8A8A8 solid; 
			padding: 5px;background-color: ##e4e4e4;
			border-radius: 5px;height: 600px;">
			<form name="submitCodeForm" action="#application.basepath#/OnlineConsole/index.cfm" method="POST">
				<textarea name="textCode" style="background-color:black;color:white;width:570px;height:500px">#variables.textCode#</textarea>
				<br /><br /><br />
				<input type="submit" value="Submit" name="submitCode" style="width: 100%;
																			 height: 50px;
																			 font-size: 24px;
																			 font-weight: bold;">
			</form>
		</div>
	
		<div style="padding: 5px;border: 2px ##A8A8A8 solid;
					background-color: ##e4e4e4;border-radius: 5px;
					float:left;width:570px;margin-left:20px;
					width:570px;height: 600px;">
			<h1>
				Output
			</h1>
			<hr>
			<cfif structKeyExists(form, "textCode") and len(form.textCode)>
				<cfinclude template="result.cfm">
			</cfif>
		</div>	
	</div>
</cfoutput>