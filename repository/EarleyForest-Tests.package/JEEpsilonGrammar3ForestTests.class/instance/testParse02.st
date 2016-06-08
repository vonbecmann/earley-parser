tests
testParse02
	| forest |
	forest := grammar parseForest: 'aa/a'.
	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1