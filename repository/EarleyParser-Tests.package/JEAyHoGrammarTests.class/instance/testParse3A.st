tests
testParse3A
	| forest |
	forest := grammar parse: 'aaa'.

	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 4