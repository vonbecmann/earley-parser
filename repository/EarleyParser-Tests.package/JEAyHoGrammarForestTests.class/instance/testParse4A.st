tests
testParse4A
	forest := grammar parseForest: 'aaaa'.

	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1.
	self 
		assertCollection: (grammar rulesAtAll: {('S'->1). ('A'->2). ('A'->2).('A'->2).('A'->2).}) 
		equals: forest leftmostDerivation