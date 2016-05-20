tests
testParse7Xs
	forest := grammar parse: 'xxxxxxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 128.
	self assert: forest size equals: 122