tests
testForestStartingAtNodelLabeledStart
	| forest |
	forest := (graph treeRootedAt: startNode) forest.
	self assert: forest isEmpty not.
	self assert: forest size equals: 2