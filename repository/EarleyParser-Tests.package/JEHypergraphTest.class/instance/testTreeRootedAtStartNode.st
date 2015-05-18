tests
testTreeRootedAtStartNode
	| treeGraph |
	treeGraph := (graph treeRootedAt: startNode).

	self assert: treeGraph isEmpty not.
	self assert: treeGraph size equals: 26