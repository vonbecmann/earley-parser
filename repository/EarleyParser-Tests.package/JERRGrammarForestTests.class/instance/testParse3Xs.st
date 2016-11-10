tests
testParse3Xs
	forest := grammar parse: 'xxx'.
	
	self deny: forest isAmbiguous.
	self
		assertCollection: forest leftmostDerivation
		equals: (grammar rulesAtAll: {('A' -> 2).('A' -> 2).('A' -> 1)})