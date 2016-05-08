tests
testParse4A
	| forest |
	forest := grammar parse: 'aaaa'.
	self deny: forest isAmbiguous.
	self assert: forest size equals: 29.
	self assert: forest numberOfTrees equals: 1