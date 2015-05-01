tests
testParse3Xs
	| forest |
	forest := grammar parse: #(x x x).
	self assert: forest isEmpty not.
	self assert: forest size equals: 2.
	self assert: (forest allSatisfy: [ :each | each size = 11 ])