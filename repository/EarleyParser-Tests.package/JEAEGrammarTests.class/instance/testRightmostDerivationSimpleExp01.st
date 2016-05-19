tests
testRightmostDerivationSimpleExp01
	forest := grammar parse: 'a'.
	self deny: forest isAmbiguous.
	self assert: forest size equals: 9.
	self assert: forest numberOfTrees equals: 1.
	self
		assertCollection:
			{(grammar ruleAt: 'E').
			(grammar ruleAt: 'T').
			(grammar ruleAt: 'P')}
		equals: forest rightmostDerivation