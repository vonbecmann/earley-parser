tests
testParseEpsilon
	| forest |
	forest := grammar parse: ''.
	
	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1.
	self 
		assertCollection: (grammar rulesAtAll: {('S'->1). ('A'->1). ('E'->1)}) 
		equals: forest leftmostDerivation