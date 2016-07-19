<cfscript>
	klass = GetMetaData(createObject("java", "com.lowagie.text.pdf.PdfContentByte"));

	allPaths = klass.getClassLoader().getURLs();
	
	allJars = [];
	
	for (path in allPaths) {
		if (not FindNoCase(".jar", path.getPath())) {
			myFiles = DirectoryList(path.getPath(), true);
		
			if (not ArrayIsEmpty(myFiles)) {
				for (myFile in myFiles) {
					if (FindNoCase(".jar", myFile) and not arrayfindnocase(allJars, myFile)) {
						arrayappend(allJars, myFile);
					}
				}
			}
		}
	}
	
	savecontent variable="jarFileList" {
		for (myFile in allJars) {
			writeOutput(reReplace(myFile, "([a-zA-Z0-9\-\.\_]+\.jar)", ",\1"));
			writeOutput(chr(10));
		}
	}
	
	//fileWrite("D:\Apache\htdocs\test\cfLoadedJars.csv", jarFileList, "UTF-8");

</cfscript>