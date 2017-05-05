tests
testParse2X
	forest := grammar parse: 'xx'.

	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1.
	self
		assertCollection: forest leftmostDerivation
		equals:
			(grammar
				rulesAtAll:
					{('A' -> 2).
					('A' -> 1).
					('letter x symbol' -> 1).
					('A' -> 1).
					('letter x symbol' -> 1)})