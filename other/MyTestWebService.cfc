/**
 * MyTestWebService
 * 
 * @author Vipin Malik
 * @date 5/5/16
 **/
component accessors=true output=false persistent=false {
	
	remote string function getName() {
		obj = {name = "Vipin Malik"};
		
		return SerializeJSON(obj);
	}
	
}