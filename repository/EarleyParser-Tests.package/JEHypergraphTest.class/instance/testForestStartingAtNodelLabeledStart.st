tests
testForestStartingAtNodelLabeledStart
	| forest |
	forest := (graph treeRootedAt: startNode) forestStartingAtRoot.
	self assert: forest isEmpty not.
	self assert: forest size equals: 2