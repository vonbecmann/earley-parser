tests
testParse5Xs
	forest := grammar parse: 'xxxxx'.
	self assert: forest isAmbiguous.
	self assert: forest size equals: 97.
	self assert: forest numberOfTrees equals: 14