tests
testParse3Xs
	| forest |
	forest := grammar parse: #(x x x).
	self deny: forest isEmpty.
	self assert: forest size equals: 2.
	self assert: (forest allSatisfy: [ :each | each size = 11 ])