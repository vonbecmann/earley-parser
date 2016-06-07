tests
testParse6Xs
	forest := grammar parse: 'xxxxxx'.

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
					('A' -> 2).
					('A' -> 1)})