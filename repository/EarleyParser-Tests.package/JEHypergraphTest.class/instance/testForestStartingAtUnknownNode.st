tests
testForestStartingAtUnknownNode
	| forest |
	forest := graph forestStartingAtNodeLabeled: 'unknown'.
	self assert: forest isEmpty