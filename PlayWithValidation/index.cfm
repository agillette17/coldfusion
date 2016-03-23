<cfsetting enablecfoutputonly="true">

<cfsilent>
	<cfscript>
		variables.valArray = ["Aston Martin", "Lamborghini", "Mercedes", "McLaren"];
		variables.valQuery = QueryNew("id, carname", "Integer, Varchar", [[1, "Aston Martin"], [2, "Lamborghini"], [3, "Mercedes"], [4, "McLaren"]]);
	</cfscript>
</cfsilent>

<cfoutput>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<title>Coldfusion Examples : Validations using isValid()</title>
		
		<!-- Bootstrap -->
		<link href="#application.basepath#/assets/bootstrap/css/bootstrap.css" rel="stylesheet">
	</head>
	<body>
		<div class="container-fluid">
			<h1>Validations using isValid()</h1>
			
			<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
				<div class="panel panel-info">
					<div class="panel-heading" role="tab" id="heading9">
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="##accordion" href="##collapse9" aria-expanded="false" aria-controls="collapse9">
								Test for a component
							</a>
						</h4>
					</div>
					<div id="collapse9" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading9">
						<div class="panel-body">
							<div class="col-xs-12 well">
								<code>
									obj = <cfdump var="#application.Logger#" expand="false">
									isValid("component", obj);
								</code>
							</div>
							<div class="col-xs-12">
								Output :: #isValid("component", application.Logger)#
							</div>
						</div>
					</div>
				</div>
				<div class="panel panel-info">
					<div class="panel-heading" role="tab" id="heading8">
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="##accordion" href="##collapse8" aria-expanded="false" aria-controls="collapse8">
								isBoolean using isValid()
							</a>
						</h4>
					</div>
					<div id="collapse8" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading8">
						<div class="panel-body">
							<div class="col-xs-12 well">
								<code>
									isValid("boolean", 1);
								</code>
								<br /><br />
								Output :: #isValid("boolean", 1)#
							</div>
							<div class="col-xs-12 well">
								<code>
									isValid("boolean", 999);
								</code>
								<br /><br />
								Output :: #isValid("boolean", 999)#
							</div>
							<div class="col-xs-12 well">
								<code>
									isValid("boolean", "yes");
								</code>
								<br /><br />
								Output :: #isValid("boolean", "yes")#
							</div>
							<div class="col-xs-12 well">
								<code>
									isValid("boolean", "hello");
								</code>
								<br /><br />
								Output :: #isValid("boolean", "hello")#
							</div>
						</div>
					</div>
				</div>
				<div class="panel panel-info">
					<div class="panel-heading" role="tab" id="heading7">
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="##accordion" href="##collapse7" aria-expanded="false" aria-controls="collapse7">
								Positive isBinary() test
							</a>
						</h4>
					</div>
					<div id="collapse7" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading7">
						<div class="panel-body">
							<div class="col-xs-12 well">
								<code>
									isValid("binary", ToBinary(Tobase64("Hello")));
								</code>
							</div>
							<div class="col-xs-12">
								Output :: #isValid("binary", ToBinary(Tobase64("Hello")))#
							</div>
							<div class="col-xs-12">
								Binary value :: <cfdump var="#ToBinary(Tobase64("Hello"))#">
							</div>
						</div>
					</div>
				</div>
				<div class="panel panel-info">
					<div class="panel-heading" role="tab" id="heading6">
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="##accordion" href="##collapse6" aria-expanded="false" aria-controls="collapse6">
								A query for array type to verify a No output
							</a>
						</h4>
					</div>
					<div id="collapse6" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading6">
						<div class="panel-body">
							<div class="col-xs-12 well">
								<code>
									myQry = QueryNew("id, carname", "Integer, Varchar", [[1, "Aston Martin"], [2, "Lamborghini"], [3, "Mercedes"], [4, "McLaren"]]);
									<br />
									isValid("array", myQry);
								</code>
							</div>
							<div class="col-xs-12">
								Output :: #isValid("array", variables.valQuery)#
							</div>
						</div>
					</div>
				</div>
				<div class="panel panel-info">
					<div class="panel-heading" role="tab" id="heading5">
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="##accordion" href="##collapse5" aria-expanded="false" aria-controls="collapse5">
								An array for array type same as isArray()
							</a>
						</h4>
					</div>
					<div id="collapse5" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading5">
						<div class="panel-body">
							<div class="col-xs-12 well">
								<code>
									isValid("array", #SerializeJSON(variables.valArray)#);
								</code>
							</div>
							<div class="col-xs-12">
								Output :: #isValid("array", variables.valArray)#
							</div>
						</div>
					</div>
				</div>
				<div class="panel panel-info">
					<div class="panel-heading" role="tab" id="heading4">
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="##accordion" href="##collapse4" aria-expanded="false" aria-controls="collapse4">
								A component with "any" as type
							</a>
						</h4>
					</div>
					<div id="collapse4" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading4">	
						<div class="panel-body">
							<div class="col-xs-12 well">
								<code>
									obj = <cfdump var="#application.Logger#" expand="false">
									isValid("any", obj);
								</code>
							</div>
							<div class="col-xs-12">
								Output :: #isValid("any", application.Logger)#
							</div>
							<div class="col-xs-12">
								any: any simple value. Returns false for complex values, such as query objects;; equivalent to the IsSimpleValue function.
							</div>
						</div>
					</div>
				</div>
				<div class="panel panel-info">
					<div class="panel-heading" role="tab" id="heading3">
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="##accordion" href="##collapse3" aria-expanded="false" aria-controls="collapse3">
								A query with "any" as type
							</a>
						</h4>
					</div>
					<div id="collapse3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading3">	
						<div class="panel-body">
							<div class="col-xs-12 well">
								<code>
									myQry = QueryNew("id, carname", "Integer, Varchar", [[1, "Aston Martin"], [2, "Lamborghini"], [3, "Mercedes"], [4, "McLaren"]]);
									<br />
									isValid("any", myQry);
								</code>
							</div>
							<div class="col-xs-12">
								Output :: #isValid("any", variables.valQuery)#
							</div>
							<div class="col-xs-12">
								any: any simple value. Returns false for complex values, such as query objects;; equivalent to the IsSimpleValue function.
							</div>
						</div>
					</div>
				</div>
				<div class="panel panel-info">
					<div class="panel-heading" role="tab" id="heading2">
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="##accordion" href="##collapse2" aria-expanded="false" aria-controls="collapse2">
								An array of string with "any" as type
							</a>
						</h4>
					</div>
					<div id="collapse2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading2">	
						<div class="panel-body">
							<div class="col-xs-12 well">
								<code>
									isValid("any", #SerializeJSON(variables.valArray)#);
								</code>
							</div>
							<div class="col-xs-12">
								Output :: #isValid("any", variables.valArray)#
							</div>
							<div class="col-xs-12">
								any: any simple value. Returns false for complex values, such as query objects;; equivalent to the IsSimpleValue function.
							</div>
						</div>
					</div>
				</div>
				<div class="panel panel-info">
					<div class="panel-heading" role="tab" id="heading1">
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="##accordion" href="##collapse1" aria-expanded="false" aria-controls="collapse1">
								A simple string with "any" as type
							</a>
						</h4>
					</div>
					<div id="collapse1" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading1">	
						<div class="panel-body">
							<div class="col-xs-12 well">
								<code>
									isValid("any", "I am a simple String");
								</code>
							</div>
							<div class="col-xs-12">
								Output :: #isValid("any", "I am a simple String")#
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="#application.basepath#/assets/jquery/js/jquery-2.2.2.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="#application.basepath#/assets/bootstrap/js/bootstrap.js"></script>
	</body>
</html>
</cfoutput>

<cfsetting enablecfoutputonly="false">