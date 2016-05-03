tests
testParse3Xs
	| forest |
	forest := grammar parse: 'xxx'.
	self deny: forest isAmbiguous.
	self assert: forest size equals: 18