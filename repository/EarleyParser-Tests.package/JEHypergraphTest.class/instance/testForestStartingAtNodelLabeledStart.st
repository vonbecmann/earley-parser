tests
testForestStartingAtNodelLabeledStart
	| forest |
	forest := graph forestStartingAtNodeLabeled: startNode.
	self assert: forest isEmpty not.
	self assert: forest size equals: 2