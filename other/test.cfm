<cfscript>
	public string function hashValue (obj) {
		var thisProps = getMetaData(obj).properties;
		var thisString = "";

		if (ArrayLen(thisProps)) {
			for (var prop in thisProps) {
				if (IsSimpleValue(variables[prop.name])) {
					thisString = thisString & ToString(prop.name) & "=" & ToString(variables[prop.name]) & ",";
				} else if (IsArray(variables[prop.name])) {
					thisString = thisString & ToString(prop.name) & "=" & ToString(ArrayToList(variables[prop.name], ":")) & ",";
				}
			}	
		}

		if (Len(thisString)) {
			thisString = Left(thisString, Len(thisString)-1);	
		}

		return Hash(thisString(), "SHA");
	}

	public boolean function areEqual (obj1, obj2) {
		return (hashValue(obj1) eq hashValue(obj2));
	}
	
	public date function convertISOTimestampToDate (required String ISOTimestampString, String format="dd-mm-yyyy HH:MM:SS") {
		var date = "";
		var time = "";
		var formattedDate = "";
		
		if (ArrayLen(ReMatch("^.*?(\d{4})-?(\d{2})-?(\d{2})T([\d:]+).*$", arguments.ISOTimestampString))) {
			date = ReMatch("^.*?(\d{4})-?(\d{2})-?(\d{2})", arguments.ISOTimestampString)[1];
			
			time = ReMatch("T([\d:]+)", arguments.ISOTimestampString)[1];
			
			time = right(time, Len(time)-1);
			
			formattedDate = Dateformat(date & time, arguments.format);
		}
		
		return formattedDate;
	}
	
</cfscript>
