tests
testLeftmostDerivationPlusExp
	forest := grammar parse: 'a+a'.

	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1.
	self
		assertCollection:
			(grammar
				rulesAtAll:
					{('E' -> 2).
					('E' -> 1).
					('T' -> 1).
					('P' -> 1).
					('letter a symbol' -> 1).
					('plus symbol' -> 1).
					('T' -> 1).
					('P' -> 1).
					('letter a symbol' -> 1).})
		equals: forest leftmostDerivation
		