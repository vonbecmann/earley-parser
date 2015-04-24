tests
testForestGiven3Xs
	| forest |
	forest := grammar forest: #(x x x).
	self assert: forest isEmpty not