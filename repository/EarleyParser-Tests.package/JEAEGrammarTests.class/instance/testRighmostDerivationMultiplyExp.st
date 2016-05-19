tests
testRighmostDerivationMultiplyExp
	forest := grammar parse: 'a*a'.
	self deny: forest isAmbiguous.
	self assert: forest size equals: 21.
	self assert: forest numberOfTrees equals: 1.
	self
		assertCollection:
			{(grammar ruleAt: 'E').
			(grammar ruleAt: 'T' at: 2).
			(grammar ruleAt: 'P').
			(grammar ruleAt: 'T').
			(grammar ruleAt: 'P')}
		equals: forest rightmostDerivation