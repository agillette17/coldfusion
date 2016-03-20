/**
 * movieDataService
 * 
 * @author Vipin Malik
 * @date 3/12/16
 **/
component accessors=false output=false persistent=false rest=true restpath="movieDataService" {
	
	remote movieDataService.model.dto.movie function getMovieJSON (required numeric id restargsource="Path") httpmethod="GET" restpath="{id}" produces="application/json" {
		movie = new movieDataService.model.dto.movie(title="The Revenant", yearOfRelease="2015", actors=["Leonardo DeCaprio", "Tom Hardy"], finance={budget="250 Million"});

		return movie;
	}

}