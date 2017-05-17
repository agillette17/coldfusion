/**
 * movie
 *
 * @author Vipin Malik
 * @date 3/13/16
 **/
component accessors=true output=false persistent=false extends="Coldfusion.movieDataService.model.dto.baseDTO" {
	/**
	 * @validates numeric,length<10
	 **/
	property numeric id;
	property string title;
	property numeric yearOfRelease;
	property string director;
	property array actors;
	property struct finance;

	public movie function init (numeric id=0,
									required string title,
									required numeric yearOfRelease,
									string director="",
									array actors=[],
									struct finance={}) {
		setId(arguments.id);
		setTitle(arguments.title);
		setYearOfRelease(arguments.yearOfRelease);
		setDirector(arguments.director);
		setActors(arguments.actors);
		setFinance(arguments.finance);

		return this;
	}
}