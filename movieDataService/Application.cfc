/**
 * Application
 *
 * @author Vipin Malik
 * @date 3/8/16
 **/
component accessors=true output=false persistent=false {
	this.name = "movieDataService";
	this.sessionManagement = true;
	this.applicationTimeout = "#CreateTimespan(1,0,0,0)#";
	this.sessionTimeout = "#CreateTimeSpan(0,0,30,0)#";
	this.setClientCookie = false;

	this.mappings["/Coldfusion"] = "N:/Projects/Coldfusion/";

	/**
	 * @hint I handle application initialization, I runs when application is first called.
	 **/
	boolean function onApplicationStart() {
		loadApplication();

		// log application init
		application.logger.logMessage(type = "Information",
										message = "Application Started");

		return true;
	}

	/**
	 * @hint I handle session initialization, I execute when session is started.
	 **/
	void function onSessionStart() {
		// log application init
		application.logger.logMessage(type = "Information",
										message = "New Session Started. Sessionid = #session.SessionID#");
	}

	/**
	 * @hint I handle processes to execute before each request
	 **/
	boolean function onRequestStart(String targetPage) {
		if (not StructKeyExists(application, "isLoaded")
				or not application.isLoaded
				or (StructkeyExists(url, "reload"))) {
			loadApplication();
		}

		// log application init
		application.logger.logMessage(type = "Information",
										message = "New Request. Requested template path = #arguments.targetPage#");


		return true;
	}

	/**
	 * @hint I handle missing template requests to return 404 specific page
	 **/
	boolean function onMissingTemplate(String targetPage) {
		// log application init
		application.logger.logMessage(type = "Error",
										message = "Page not found Error. Requested template path = #arguments.targetPage#");
		return true;
	}

	/**
	 * @hint I handle missing template requests to return 404 specific page
	 **/
	void function onError(Any Exception, String eventName) {
		// log application init
		if (StructKeyExists(application, "logger")) {
			application.logger.logMessage(type = "Fatal",
										message = "Exception Occurred." & arguments.Exception.message);
		}

		writeDump(arguments.Exception);abort;

	}

	/**
	 * @hint I initialize and set base applicatio settings and services
	 **/
	void function loadApplication() {
		application.basepath = "/coldfusion";

		application.logger = new Coldfusion.model.utility.Logger("#this.name#_access");

		application.isLoaded = true;
	}
}