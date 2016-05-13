tests
testParse7Xs
	forest := grammar parse: 'xxxxxxx'.
	self assert: forest isAmbiguous.
	self assert: forest size equals: 240.
	self assert: forest numberOfTrees equals: 132