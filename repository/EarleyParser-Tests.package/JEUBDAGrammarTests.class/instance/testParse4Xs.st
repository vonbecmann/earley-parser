tests
testParse4Xs
	| forest |
	forest := grammar parse: #(x x x x).
	self deny: forest isEmpty.
	self assert: forest size equals: 5.
	self assert: (forest allSatisfy: [ :each | each size = 15 ])