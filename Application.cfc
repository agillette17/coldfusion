/**
 * Application
 * 
 * @author Vipin Malik
 * @date 3/8/16
 **/
component accessors=true output=false persistent=false {
	
	// include ini.cfm, which contains application config values
	include "ini.cfm";
	
	/**
	* used by coldfusion as a pointer to application's persistent scopes,
	* length upto 64 chars,
	* As best practice use {hash(getCurrentTemplatePath()) & cgi.SERVER_NAME} 
	* to uniquely identify an application on an instance 
	**/
	this.name = hash(getCurrentTemplatePath()) & cgi.SERVER_NAME;
	
	// TODO ::
	//this.loginStorage = "session";
	
	/**
	 * Required to enable client variables,
	 * Client variables are identified by CFID and used to store user specific preferences across sessions
	 * default is false
	 **/
	this.clientManagement = false;
	
	/**
	 * where client variables are stored,
	 * default is registry,
	 * values are cookie, registry and datasource,
	 * to use a datasource as storage for client variables, 
	 * must add datasource as Client Store from cf administrator's Server Settings > Client Variables
	 **/
	//this.clientStorage = "cookie";
	
	/**
	 * default is yes, so must have this config set to false to disable CFID and CFTOKEN,
	 * with no, CFID and CFTOKEn will not be set in cookie
	 * To use sessions either have "Use J2EE session variables" enabled or have this.setClientCookies = true
	 * if both are disabled then coldfusion generates unique cfid and cftoken 
	 * for each request as no client/session cookie would be set, in this case you can use 
	 * URLSessionFormat(url) to append session variables to url 
	 **/
	this.setClientCookies = false;
	
	/**
	 * Enables session scope for application,
	 * required to use sessions in application
	 * default is false
	 **/
	this.sessionManagement = true;
	
	/**
	 * set the timeout for sessions when session management is enabled,
	 * overrides timeout defined in cf administrator's Server Settings > Memory Variables > Default Timeout,
	 * this value can not be more than timeout defined in cf administrator's Server Settings > Memory Variables > Maximum Timeout,
	 * use createTimespan to create timeout period
	 **/
	this.sessionTimeout = "#CreateTimeSpan(0,0,30,0)#";
	
	/**
	 * set the timeout for application,
	 * overrides timeout defined in cf administrator's Server Settings > Memory Variables > Default Timeout,
	 * this value can not be more than timeout defined in cf administrator's Server Settings > Memory Variables > Maximum Timeout,
	 * use createTimespan to create timeout period
	 **/
	this.applicationTimeout = "#CreateTimespan(1,0,0,0)#";
	
	/**
	 * default is no,
	 * if set to yes CFID and CFTOKEN are set for domain (not host) like .company.com
	 * used in clustered environment
	 **/
	this.setDomainCookies = false;
	
	// Following properties are available in CF8+
	
	/**
	 * This is to protect against XSS attacks,
	 * By default it is set as "all",
	 * you can provide comma-delimited list of scopes to protect out of form,url,cookie,cgi,
	 * specifying "none" will make all variables in form,url,cookie,cgi, vulnerable to XSS
	 * or excluding any from list will also make it vulnerable.
	 * As best practise either not define it or set its value as "all"
	 **/
	this.scriptProtect = "all";
	
	/**
	 * This config applies for CF8+
	 * when set to true this setting will add a prefix to JSON responce for coldfusion function's remote calls
	 * by default it is set to false, when true then "//" is added as prefix, 
	 * can provide a custom value as prefix with this.secureJSONPrefix as given below
	 **/
	this.secureJSON = true;
	
	/**
	 * This config applies for CF8+
	 * by default it is set "//", 
	 * can provide a custom value as prefix as given below,
	 * must have this.secureJSON = true;
	 **/
	this.secureJSONPrefix = hash(DateFormat(now(), "dd/mm/yyyy"));
	
	/**
	 * comma separated list of 
	 * custom tag containg directories
	 **/
	this.customTagPaths = "/ScriptControl";

	/**
	 * structure to set application specific mappings
	 * key is the path and value is absolute directory path
	 **/
	this.mappings["/Coldfusion"] = variables.appBasePath;
	
	/**
	 * A comma seperated list of file names that will skip onMissingTemplate invocation - 
	 * typically only necessary if you are using a builtin web server like Tomcat or JRun.
	 **/
	//this.welcomeFileList = "";

	// Following properties are available in CF9+

	/**
	 * required to enable/disable server side validation for cfform fields
	 **/
	//this.serverSideFormValidation = false

	/**
	 * Google Map API key to use google map using cfmap tag
	 * There are four ways to specify google map key -
	 * 1) In Application.cfc using this.googleMapKey
	 * 2) Using Coldfusion Administrator's Setting -> "Google Map API Key" field
	 * 3) using <cfajaximport param="#{googlemapkey='Map API Key'}#">
	 * 4) Using admin API's runtime.cfc
	 **/
	this.googleMapKey = variables.googleMapKey;
	
	/**
	 * default datasource for the application,
	 * can also give a struct with credentials and datasource 
	 * like {name = "", username = "", password = ""}
	 **/
	this.datasource = variables.defaultDatasource;
	
	/**
	 * Structure to specify amazon webservice related information
	 * like { accessKeyId = "", awsSecretKey = "", defaultLocation = ""}
	 **/
	//this.s3 = "";
	
	/**
	 * To use Coldfusion ORM in application set this to true,
	 * default is no
	 **/
	this.ormEnabled = false;
	
	/**
	 * structure to specify ORM settings/configurations for the application
	 * TODO :: learn more about ORM settings available
	 * https://helpx.adobe.com/coldfusion/developing-applications/coldfusion-orm/configure-orm/orm-settings.html
	 **/
	//this.ormSettings = {};
	
	/**
	 * setting to specify mail server name and credentials
	 * like {server = "", username = "", password = ""}
	 **/
	//this.smtpServerSettings = {};
	
	/**
	 * To specify default request timeout in seconds for the application,
	 * overides cf admin value,
	 * can be overidden by cfsetting
	 **/
	this.timeout = 30;
	
	/**
	 * specify the comma separated list of IP adress to display debug information
	 * when debugging is enabled from coldfusion Administarator's
	 * Debugging & Logging > Debug Output Settings >  Enable Request Debugging Output
	 **/
	this.debuggingIPAddress = "127.0.0.1";
	
	/**
	 * set to overide the coldfusion administrator's
	 * Debugging & Logging > Debug Output Settings >  Enable Robust Exception Information
	 * flag value
	 **/
	this.enableRobustException = true;
	
	// Following properties are available in CF10+
	
	/**
	 * session cookies (CFID/CFTOKEN/JSESSIONID) related settings
	 **/
	 this.sessioncookie.httpOnly = true;
	 this.sessioncookie.secure = true;
	 //this.sessioncookie.domain = "";
	 //this.sessioncookie.timeout = ""; set timeout in days, better not to give any value
	 /**
	  *  when true session Cookies value cannot be updated using
	  * cfcookie or cfheader
	  **/
	 this.sessioncookie.disableUpdate = true;
	 
	 /**
	  * Java settings
	  * an array of java jar or class files
	  * useful when you have to include application specific java libraries
	  **/
	 //this.javaSettings.loadPaths = "";
	  
	/**
	 * flag to specify whether to reload classes specified inload path
	 * to be watched and updated on change
	 * default value is false
	 **/
	 //this.javaSettings.reloadOnChange = false;
	 
	 /**
	  * TODO ::
	  * Loads the classes using ColdFusions classloader.
	  **/
	 //this.javaSettings.loadColdFusionClassPath = false;
	 
	 /**
	  * TODO ::
	  * An array of structs used to define WebSocket communication channels
	  * eg - this.wschannels = [{name=channelName, cfclistener=channel_listener_CFC}];
	  **/
	 this.wschannels = [];
	 
	 // Following properties are available in CF11+
	 
	 /**
	  * list of file types to be compiled by coldfusion,
	  * cfm|cfml|htm|html are included by default,
	  * include extensions which have dynamically generated content,
	  * like if your javascript have cf code to populate server side variables as js variables,
	  * or to generate an xml file from an xml template,
	  * TODO :: Build an XML template from coldfusion
	  **/
	 this.compileExtForInclude = "cfm,cfml,htm,html,js";
	 
	 /**
	  * define the defalt AntiSamy policy file to be used with isSafeHTML() and getSafeHTML(),
	  * if this is not provided then Coldfusion's default AntiSamy policy file will be used (path given below)
	  * you can also provide policy file path in the isSafeHTML() and getSafeHTML(),
	  * AntiSamy is a java API to ensure user supplied HTML/CSS is in compliance with application rules.
	  * Refer Developer_Guide.pdf for more details about AntiSamy
	  **/
	 this.security.antiSamyPolicy = variables.defaultAntiSamyPolicyFile;
	 
	 /**
	  * to enable/disable strict number validation,
	  * in earlier versions of CF currency and other format were considered numeric or integer,
	  * this behaviour has changed in CF11+,
	  * this config applies to isValid(), cfargument, cfparam, function return types, cfform,
	  * by default its value is true
	  **/
	 this.strictNumberValidation = true;
	 
	 /**
	  * TODO : VFS, ram:///filename
	  **/
	//this.inMemoryFileSystem.enabled = true;
	
	/**
	 * specify size for VFS in MB
	 **/
	//this.inMemoryFileSystem.size = 10;
	
	/**
	 * structure to create datasources from application.cfc,
	 * key = datasource name
	 * value = structure of parameters to create datasource like database, host, driver, username, password
	 **/
	this.datasources = {
		"localhost-test" = {
			"driver" = "other",
			"url" = variables.MySQLConnectionURL,
			"class" = "com.mysql.jdbc.Driver",
			"username" = variables.MySQLUsername,
			"password" = variables.MySQLPassword
		}
	};
	
	/**
	 * preserves cases for keys when generating JSON using
	 * SerializeJSON
	 **/
	this.serialization.preserveCaseForStructKey = true;
	
	/**
	 * TODO :: related to REST services
	 * the user can use the plugged-in custom serializer 
	 * instead of using the default serialization function. 
	 * The custom serializer has four functions:
	 * CanSerialize - Returns a boolean value and takes the "Accept Type" of the 
	 * 		request as the argument. You can return true if you want the customserialzer to 
	 * 		serialize the data to the passed argument type. 
	 * Serialize - The main serialization logic must be implemented in this function. 
	 * 		If canSerialize returns "True" for a request, then ColdFusion will use this function to serialize. 
	 * 		If canSerialize returns false, then ColdFusion will use the default serialization to serialize.
	 * CanDeserialize - Returns a boolean value and takes the "Content Type" of the request 
	 * 		as the argument. You can return true if you want the customserialzer to deserialize the data.
	 * DeSerialize - The main deserialization logic must be implemented in this function. 
	 * 		If canDeSerialize returns "True" for a request, then ColdFusion will use this function to deserialize. 
	 * 		If canDeSerialize returns false, then ColdFusion will use the default de-serialization to deserialize.
	 **/
	//this.customSerializer = "";
	
	 // Following properties are available in CF2016+
	
	/**
	 * Enable this to pass array by reference to UDF's
	 * It increases speed of UDF's execution
	 * TODO :: Why
	 **/
	this.passArrayByReference = true;
	
	/**
	 * TODO
	 **/
	this.searchImplicitScopes = true;


	/**
	 * @hint I handle application initialization, 
	 * I runs when a page from the application is first requested.
	 * returning false will abort request processing
	 **/
	public boolean function onApplicationStart() {
		loadApplication();

		// log application init
		application.logger.logMessage(type = "Information", 
										message = "Application Started");
		
		return true;
	}
	
	/**
	 * @hint I am called when application times out or server is stopped
	 **/
	public void function onApplicationEnd(Struct ApplicationScope={}) {
		// log application init
		application.logger.logMessage(type = "Information", 
										message = "Application Stopped");
	}
	
	/**
	 * @hint I handle session initialization, I execute when session is started.
	 **/
	public void function onSessionStart() {
		// log session init
		application.logger.logMessage(type = "Information", 
										message = "New Session Started. Sessionid = #session.SessionID#");
	}
	
	public void function onSessionEnd (required Struct SessionScope, Struct applicationScope={}) {
		// log session end
		application.logger.logMessage(type = "Information", 
										message = "Session Ended. Sessionid = #session.SessionID#");
	}
	
	/**
	 * @hint I handle processes to execute before each request
	 * returning false halts request processing
	 * can perform authentication here
	 **/
	public boolean function onRequestStart(required String targetPage) {
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
	 * @hint if implementing this method then include called page here
	 * You can provide a common header and footer in it for all the pages in application
	 **/
	public void function onRequest (String targetPage) {
		include "common/templates/header.cfm";

		include arguments.targetPage;
		
		include "common/templates/footer.cfm";
	}
	
	/**
	 * @hint it runs at the end of request
	 * good place to include a common footer
	 * include common js/css
	 * or to perform final tasks
	 * onRequestEnd method is not invoked for CF10+, when cfabort, cflocation or cfcontent tag is executed
	 * for CF9- it is invoked after cfabort, cflocation or cfcontent
	 * When cflocaton or cfcontent is used then onRequestEnd is fired for CF9-, but for CF10+,
	 * onAbort function will be fired
	 **/
	public void function onRequestEnd () {
		application.logger.logMessage(type = "Information", 
										message = "A request ended.");
	}
	
	/** 
	 * TODO :: security issue :: need to check called function have remote access.
	 *	onCFCRequest 
	 *	https://wikidocs.adobe.com/wiki/display/coldfusionen/onCFCRequest 
	 *	Intercepts any HTTP or AMF calls to an application based on CFC request. 
	 *	Whereas onRequest handles only requests made to ColdFusion templates, 
	 * this function controls Ajax, Web Service, and Flash Remoting requests. 
	**/ 
	public void function onCFCRequest(string cfcname, string method, struct args) { 
		return; 
	} 

	/**
	 * @hint I handle missing template requests to return 404 specific page
	 **/
	public boolean function onMissingTemplate(String targetPage) {
		// log application init
		application.logger.logMessage(type = "Error", 
										message = "Page not found Error. Requested template path = #arguments.targetPage#");
		
		include "common/error.cfm";
		
		return true;
	}
	
	/**
	 * @hint runs when an uncaught exception occures while processing a request
	 * This method overrides any error handlers that you set in the ColdFusion Administrator or in cferror tags. It does not override try/catch blocks.
	 **/
	function onError(Any Exception, String eventName) {
		// log application init
		if (StructKeyExists(application, "logger")) {
			application.logger.logMessage(type = "Fatal", 
										message = "Exception Occurred." & arguments.Exception.message);	
		}
							
		writeDump(arguments.Exception);abort;
		
	}
	
	/**
	 * This function is added with CF10,
	 * it runs when cfabort/abort is called, before CF10 onRequetEnd used to be called
	 * if cfabort have showerror attribute set then onError() will be executed 
	 * even if it is not defined in Application.cfc
	 **/
	public void function onAbort (required String targetPage) {
		application.logger.logMessage(type = "Info", 
										message = "Page Aborted. Requested template path = #arguments.targetPage#");
	}

	/**
	 * @hint I initialize and set base application settings and services
	 **/
	void function loadApplication() {
		application.basepath = "/coldfusion";

		application.logger = new Coldfusion.model.utility.Logger("#this.name#_errors");

		application.isLoaded = true;
	}
}