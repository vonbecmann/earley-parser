public
parse: words
	| forest |
	forest := super parse: words.
	self assert: forest isAmbiguous not.
	^ ESParseTree 
		given: (self transformToSyntax: (self flatten: forest extractSingleTree)) 
		of: grammar