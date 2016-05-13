tests
testParseRule03
	| forest |
	forest := grammar parse: 'E::=E,"<",T'.
	
	self deny: forest isAmbiguous.
	self assert: forest size equals: 90.