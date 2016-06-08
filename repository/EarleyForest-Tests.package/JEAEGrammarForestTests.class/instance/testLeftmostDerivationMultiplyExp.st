tests
testLeftmostDerivationMultiplyExp
	forest := grammar parseForest: 'a*a'.
	
	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1.
	self
		assertCollection:
			(grammar
				rulesAtAll:
					{('E' -> 1).
					('T' -> 2).
					('T' -> 1).
					('P' -> 1).
					('P' -> 1)})
		equals: forest leftmostDerivation
		