tests
testParse02
	| forest |
	forest := grammar parse: 'aa/a'.
	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1