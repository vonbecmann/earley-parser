tests
testForestStartingAtNodelLabeledStart
	| forest |
	forest := (graph treeRootedAt: startNode) forestStartingAtNodeLabeled: startNode.
	self assert: forest isEmpty not.
	self assert: forest size equals: 2