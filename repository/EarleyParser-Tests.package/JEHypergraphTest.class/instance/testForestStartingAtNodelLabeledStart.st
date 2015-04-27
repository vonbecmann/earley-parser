running
testForestStartingAtNodelLabeledStart
	| forest |
	self halt.
	forest := graph forestStartingAtNodeLabeled: start.
	self assert: forest isEmpty not.
	self assert: forest size equals: 20