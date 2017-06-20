as yet unclassified
update: aTable on: aModel with: anObject

	"pass in a populated model object - process"
	
	| myClass myDb myInstVars myInstSize myQueryString |
	
	myClass := Smalltalk at: aModel asSymbol.
	myInstSize := myClass instSize.
	myInstVars := myClass instVarNames.
	myDb := self database.

	"update table set x = y where id = 1"
	myQueryString := 'update ', aTable, ' set '.			
	myInstVars do: [ :i | 
		myQueryString := myQueryString, i, '="', ( anObject instVarNamed: i ) asString, '",' 
	].

	myQueryString := myQueryString allButLast.
	myQueryString := myQueryString, ' where ', anObject tablePrimaryKey, '=', ( anObject instVarNamed: anObject tablePrimaryKey ) asString, ';'.
	myDb execute: myQueryString.

	