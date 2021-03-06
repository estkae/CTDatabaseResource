query
query: aQuery

	"a query with a specific set of responses. 	'myData' is a <resultset> which is why <next> is required to retrieve 
	the <data> - this is passed back in a <dictionary>."
	| myDb myData |
	myDb := self database.
	myData := myDb execute: aQuery.
	
	^ myData next.