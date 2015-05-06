tests
testParse5Xs
	| forest |
	forest := grammar parse: #(x x x x x).
	self assert: forest isEmpty not.
	self assert: forest size equals: 14.
	self assert: (forest allSatisfy: [ :each | each size = 19 ])