tests
testParse1A
	| forest |
	forest := grammar parse: 'a'.
	self deny: forest isEmpty.
	self assert: forest isAmbiguous