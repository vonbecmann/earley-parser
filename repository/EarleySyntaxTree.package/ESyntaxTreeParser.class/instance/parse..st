public
parse: words
	| forest |
	forest := super parse: words.
	self assert: forest isAmbiguous not.
	^ ESParseTree given: (self flatten: (self extractTreeFrom: forest)) of: grammar