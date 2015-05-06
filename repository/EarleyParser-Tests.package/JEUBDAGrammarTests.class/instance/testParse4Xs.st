tests
testParse4Xs
	| forest |
	forest := grammar parse: #(x x x x).
	self assert: forest isEmpty not.
	self assert: forest size equals: 5.
	self assert: (forest allSatisfy: [ :each | each size = 15 ])