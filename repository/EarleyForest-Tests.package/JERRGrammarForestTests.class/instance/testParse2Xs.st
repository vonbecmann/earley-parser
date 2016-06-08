tests
testParse2Xs
	forest := grammar parseForest: 'xx'.

	self deny: forest isAmbiguous.
	self
		assertCollection: forest leftmostDerivation
		equals: (grammar rulesAtAll: {('A' -> 2). ('A' -> 1)})