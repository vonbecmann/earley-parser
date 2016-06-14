public
parse: words
	| forest |
	forest := super parse: words.
	self assert: forest isAmbiguous not.
	^ ESParseTree given: (self extractTreeFrom: forest) of: grammar