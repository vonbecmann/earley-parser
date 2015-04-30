tests
testForestGiven3Xs
	| forest |
	forest := grammar forest: #(x x x).
	self assert: forest isEmpty not.
	self assert: forest size equals: 2