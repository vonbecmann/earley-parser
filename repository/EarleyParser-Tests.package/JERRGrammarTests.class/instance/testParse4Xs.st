tests
testParse4Xs
	forest := grammar parse: 'xxxx'.

	self deny: forest isAmbiguous.
	self
		assertCollection: forest leftmostDerivation
		equals: (grammar rulesAtAll: {('A' -> 2).('A' -> 2).('A' -> 2).('A' -> 1)})