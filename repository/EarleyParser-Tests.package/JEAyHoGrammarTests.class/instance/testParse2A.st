tests
testParse2A
	| forest |
	forest := grammar parse: 'aa'.
	
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 6