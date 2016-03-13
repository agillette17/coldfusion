/**
 * LogFile
 * 
 * @author Vipin Malik
 * @date 3/11/16
 **/
component accessors=true output=false persistent=false {

	property string name;
	
	property timestamp lastModifiedDateTime;
	
	property date lastModifiedDate;
	
	property time lastModifiedTime;
	
	property numeric size;
	
	/**
	 * @hint I initialize logfile
	 **/
	public LogFile function init (required string name, required timestamp lastModifiedDateTime, required numeric size) {
		setName(arguments.name);
		setLastModifiedDateTime(arguments.lastModifiedDateTime);
		setLastModifiedDate();
		setLastModifiedTime();
		setSize(arguments.size);

		return this;
	}
	
	/**
	 * @hint I set lastModifiedDate property
	 **/
	public void function setLastModifiedDate () {
		this.lastModifiedDate = DateFormat(this.lastModifiedDateTime, "DD-MM-YYYY");
	}
	
	/**
	 * @hint I set lastModifiedTime property
	 **/
	public void function setLastModifiedTime () {
		this.lastModifiedDate = TimeFormat(this.lastModifiedDateTime, "HH:mm:ss");
	}
	
}