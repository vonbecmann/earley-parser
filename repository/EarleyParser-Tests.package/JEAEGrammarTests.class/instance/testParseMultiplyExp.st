tests
testParseMultiplyExp
	forest := grammar parse: 'a*a'.
	self deny: forest isAmbiguous.
	self assert: forest size equals: 21.
	self assert: forest numberOfTrees equals: 1