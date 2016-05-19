tests
testParse1A
	| forest |
	forest := grammar parse: 'a'.
	self assert: forest isAmbiguous.
	self assert: forest size equals: 39.
	self assert: forest numberOfTrees equals: 4