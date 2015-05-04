tests
testForestStartingAtNodelLabeledA
	| forest |
	forest := graph forestStartingAtNodeLabeled: A.
	self assert: forest isEmpty not.
	self assert: forest size equals: 7