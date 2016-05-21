tests
testRighmostDerivationMultiplyExp
	forest := grammar parse: 'a*a'.
	self deny: forest isAmbiguous.
	self assert: forest size equals: 21.
	self assert: forest numberOfTrees equals: 1.
	self
		assertCollection:
			(grammar
				rulesAtAll:
					{('E' -> 1).
					('T' -> 2).
					('P' -> 1).
					('T' -> 1).
					('P' -> 1)})
		equals: forest rightmostDerivation