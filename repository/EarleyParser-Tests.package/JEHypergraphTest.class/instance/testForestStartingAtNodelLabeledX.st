tests
testForestStartingAtNodelLabeledX
	| forest |
	forest := graph forestStartingAtNodeLabeled: x.
	self assert: forest isEmpty not.
	self assert: forest size equals: 3