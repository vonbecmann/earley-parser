tests
testRightmostDerivationMixedExp
	forest := grammar parse: 'a+a*a+a*a'.
	self deny: forest isAmbiguous.
	self assert: forest size equals: 61.
	self assert: forest numberOfTrees equals: 1.
	self
		assertCollection:
			(grammar
				rulesAtAll:
					{('E' -> 2).
					('T' -> 2).
					('P' -> 1).
					('T' -> 1).
					('P' -> 1).
					('E' -> 2).
					('T' -> 2).
					('P' -> 1).
					('T' -> 1).
					('P' -> 1).
					('E' -> 1).
					('T' -> 1).
					('P' -> 1)})
		equals: forest rightmostDerivation