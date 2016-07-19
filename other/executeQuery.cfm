<!---
=========================================================================================================================================
	File Name	:	executeQuery.cfm
	Description	:	This page is test page used to run query. This is not associated to the application
	Copyright	:	
	Created By	:	
	Created	date:	
=========================================================================================================================================
--->

<cfscript>

	// set local variables
	variables.preserveQry = "1";
	variables.dsn = "";

	// update variable with form data
	if(isDefined("form.submitBtn") and isDefined('form.sqlStatement') and len(form.sqlStatement)) {
		variables.preserveQry = form.sqlStatement;
	}

	// update dsn with form data
	if(isDefined("form.submitBtn") and isDefined('form.dsnName') and len(form.dsnName)) {
		variables.dsn = form.dsnName;
	}
</cfscript>

<html>
	<head>
		<title>Execute CF Query</title>
	</head>
	<body>
		<h3>CF Query Execution</h3>

		<!-- FORM START -->
		<cfform action="#CGI.SCRIPT_NAME#" name="queryForm" format="html" skin="haloBlue"  width="50%" height="40%">
		    <cfformitem type="hrule" /> 
		    <cfformitem type="text"> 
		        This simple form executes sql statements.
		    </cfformitem> 
			<cfinput name="dsnName" type="text" label="Enter DSN:" value="#variables.dsn#" size="20" />
		    <cftextarea name="sqlStatement" height="100" label="Enter SQL:" width="400" value="#variables.preserveQry#"></cftextarea>
		    <cfinput name="submitBtn" type="submit" label="Execute Query" value="Execute Query" />
		    <cfformitem type="hrule" />
		</cfform>
		<!-- FORM END -->

		<cftry>
			<cfif isDefined("form.submitBtn") and len(variables.preserveQry)>
				<cfquery name="executeSqlQry" datasource="#variables.dsn#">
					<cfoutput>#preserveSingleQuotes(variables.preserveQry)#</cfoutput>
				</cfquery>
				<b>OUTPUT:</b>
				<cfif isDefined("executeSqlQry")>
					<cfdump var="#executeSqlQry#" label="The Result SQL Query" metainfo="true"><br />

					<!--- Get the column list. --->
   					<cfset lstColumns = executeSqlQry.ColumnList />

				    <!---
					    Loop over the columns in the query. This time, we are
					    looping over the list items themselves.
				    --->
				    <cfoutput>
					    <cfloop index="strColumnName" list="#lstColumns#" delimiters=",">

						    <!--- Get the index of the column. --->
						    <cfset intColumn = executeSqlQry.FindColumn(JavaCast("string", strColumnName)) />

						    <!--- Output the column name from the list. --->
						    <b>#strColumnName#</b>
						    :

						    <!---
						    Output the column data type name based on the index
						    we got searching for the column name.
						    --->
						    #executeSqlQry.GetMetaData().GetColumnTypeName(JavaCast('int', intColumn ))#
							
							|
					    </cfloop>
				    </cfoutput>
	    		<cfelse>
					<cfoutput>You might have perform insert, update or delete operation.</cfoutput>	
				</cfif>	
			</cfif>	
		<cfcatch type="any">
			<cfoutput>

	            <!--- and the diagnostic message from the ColdFusion server ---> 
	            <p>Exception occurred:  #Now()# #CFCATCH.MESSAGE#</p> 
	            <p>Caught an exception, type = #CFCATCH.TYPE# </p> 
	            <p>The contents of the tag stack are:</p> 
	            <cfloop index = i from = 1  to = #ArrayLen(CFCATCH.TAGCONTEXT)#> 
	                <cfset sCurrent = #CFCATCH.TAGCONTEXT[i]#> 
	                <br>#i# #sCurrent["ID"]#  
	                    (#sCurrent["LINE"]#,#sCurrent["COLUMN"]#)  
	                    #sCurrent["TEMPLATE"]# 
           		</cfloop> 
			</cfoutput> 
		</cfcatch>
		</cftry>
	</body>
</html>