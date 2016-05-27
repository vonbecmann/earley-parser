tests
testParse5Xs
	forest := grammar parse: 'xxxxx'.

	self deny: forest isAmbiguous.
	self
		assertCollection: forest leftmostDerivation
		equals:
			(grammar
				rulesAtAll:
					{('A' -> 2).
					('A' -> 2).
					('A' -> 2).
					('A' -> 2).
					('A' -> 1)})