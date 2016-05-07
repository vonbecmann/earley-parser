tests
testParseEpsilon
	| forest |
	forest := grammar parse: ''.
	self deny: forest isAmbiguous.
	self assert: forest size equals: 16.
	self assert: forest numberOfTrees equals: 1