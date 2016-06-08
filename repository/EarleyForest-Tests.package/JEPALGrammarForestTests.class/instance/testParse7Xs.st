tests
testParse7Xs
	forest := grammar parseForest: 'xxxxxxx'.
	
	self deny: forest isAmbiguous.
	self
		assertCollection: 
			(grammar 
				rulesAtAll: {('A' -> 2).('A' -> 2).('A' -> 2).('A' -> 1)})
		equals: forest leftmostDerivation