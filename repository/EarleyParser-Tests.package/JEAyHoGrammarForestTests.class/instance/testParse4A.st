tests
testParse4A
	forest := grammar parse: 'aaaa'.
	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1.
	self
		assertCollection:
			(grammar
				rulesAtAll:
					{('S' -> 1).
					('A' -> 2).
					('letter a symbol' -> 1).
					('A' -> 2).
					('letter a symbol' -> 1).
					('A' -> 2).
					('letter a symbol' -> 1).
					('A' -> 2).
					('letter a symbol' -> 1).})
		equals: forest leftmostDerivation