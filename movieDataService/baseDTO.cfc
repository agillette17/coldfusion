/**
 * baseDTO
 * 
 * @author Vipin Malik
 * @date 3/13/16
 **/
component accessors=true output=false persistent=false {	
	
	public string function thisString () {
		var thisProps = getMetaData(this).properties;
		var thisString = "";

		if (ArrayLen(thisProps)) {
			for (var prop in thisProps) {
				if (IsSimpleValue(variables[prop.name])) {
					thisString = thisString & ToString(prop.name) & "=" & ToString(variables[prop.name]) & ",";
				}
				// TODO :: handle complex values arrays/struct/objects 
			}	
		}
		
		if (Len(thisString)) {
			thisString = Left(thisString, Len(thisString)-1);	
		}

		return thisString;
	}

	public string function hashValue () {
		return Hash(thisString(), "SHA");
	}
	
	public boolean function areEqual (baseDTO oBaseDTO) {
		return (oBaseDTO.hashValue() eq this.hashValue());
	}

	public string function toJSON () {
		return SerializeJSON(this);
	}
	
	public xml function toXML () {
		var thisData = getMetaData(this);
		var thisXML = XMLNew();
		thisXML.xmlRoot = XmlElemNew(thisXML, thisData.name);

		for (var index = 1; index <=  ArrayLen(thisData.properties); index++) {
			if (IsSimpleValue(variables[thisData.properties[index].name])) {
				thisXML[thisData.name].XmlChildren[index] = XmlElemNew(thisXml, thisData.properties[index].name);
				thisXML[thisData.name].XmlChildren[index].xmlText = ToString(variables[thisData.properties[index].name]);	
			}
			// TODO :: handle complex values arrays/struct/objects 
		}

		return thisXML;
	}

}