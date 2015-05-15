tests
testParse4Xs
	| forest |
	forest := grammar parse: 'xxxx'.
	self deny: forest isEmpty.
	self assert: forest size equals: 5.
	self assert: (forest allSatisfy: [ :each | each size = 12 ])