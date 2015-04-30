running
testForestStartingAtNodelLabeledStart
	| forest |
	forest := graph forestStartingAtNodeLabeled: start.
	self assert: forest isEmpty not.
	self assert: forest size equals: 2