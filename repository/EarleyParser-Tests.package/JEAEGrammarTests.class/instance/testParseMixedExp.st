tests
testParseMixedExp
	forest := grammar parse: 'a+a*a+a*a'.
	self deny: forest isAmbiguous.
	self assert: forest size equals: 70.
	self assert: forest numberOfTrees equals: 1