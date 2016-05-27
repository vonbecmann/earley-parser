tests
testParse2Xs
	forest := grammar parse: 'xx'.

	self deny: forest isAmbiguous.
	self
		assertCollection: forest leftmostDerivation
		equals: (grammar rulesAtAll: {('A' -> 2). ('A' -> 1)})