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
			} else if (IsArray(variables[thisData.properties[index].name])) {
				thisXML = ArrayToXML(variables[thisData.properties[index].name], thisXML[thisData.name], thisData.properties[index].name, thisXML);
			} else if (IsStruct(variables[thisData.properties[index].name])) {
				arrayAppend(thisXML[thisData.name].XmlChildren, XmlElemNew(thisXml, thisData.properties[index].name));
				thisXML = StructToXML(variables[thisData.properties[index].name], thisXML[thisData.name].XmlChildren[ArrayLen(thisXML[thisData.name].XmlChildren)], thisXML);
			} else if (IsInstanceof(variables[thisData.properties[index].name], "baseDTO")) {
				thisXML[thisData.name].XmlChildren[index] = variables[thisData.properties[index].name].toXML();
			}
		}

		return thisXML;
	}
	
	private xml function ArrayToXML (array inputArray, xml parent, string elementName, xml xmlObject) {
		for (var i = 1; i <= ArrayLen(inputArray); i++) {
			ArrayAppend(parent.XmlChildren, XmlElemNew(xmlObject, elementName));

			if (IsSimpleValue(inputArray[i])) {
				parent.XmlChildren[ArrayLen(parent.XmlChildren)].xmlText = inputArray[i];	
			} else if (IsArray(inputArray[i])) {
				xmlObject = ArrayToXML(inputArray[i], parent.XmlChildren[ArrayLen(parent.XmlChildren)], elementName, xmlObject);
			} else if (IsStruct(inputArray[i])) {
				xmlObject = StructToXML(inputArray[i], parent.XmlChildren[ArrayLen(parent.XmlChildren)], xmlObject);
			} else if (IsInstanceof(inputArray[i], "baseDTO")) {
				parent.XmlChildren[ArrayLen(parent.XmlChildren)].XmlChildren = inputArray[i].toXML();
			}
		}
		
		return xmlObject;
	}
	
	private xml function StructToXML (struct inputStruct, xml parent, xml xmlObject) {
		for (var key in inputStruct) {
			ArrayAppend(parent.XmlChildren, XmlElemNew(xmlObject, key));
			
			if (IsSimpleValue(inputStruct[key])) {
				parent[key].XmlText = inputStruct[key];	
			} else if (IsArray(inputStruct[key])) {
				xmlObject = ArrayToXML(inputStruct[key], parent[key], key, xmlObject);
			} else if (IsStruct(inputStruct[key])) {
				xmlObject = StructToXML(inputStruct[key], parent[key], xmlObject);
			} else if (IsInstanceof(inputStruct[key], "baseDTO")) {
				parent[key].XmlChildren = inputStruct[key].toXML();
			}
		}

		return xmlObject;
	}

}