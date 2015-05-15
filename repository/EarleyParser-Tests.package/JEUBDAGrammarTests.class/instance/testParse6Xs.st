tests
testParse6Xs
	| forest |
	forest := grammar parse: 'xxxxxx'.
	self deny: forest isEmpty.
	self assert: forest size equals: 42.
	self assert: (forest allSatisfy: [ :each | each size = 18 ])