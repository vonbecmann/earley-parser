tests
testParseSimpleExp01
	forest := grammar parse: 'a'.
	self deny: forest isAmbiguous.
	self assert: forest size equals: 9.
	self assert: forest numberOfTrees equals: 1