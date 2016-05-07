tests
testNumberOfTreesIsTwo02
	builder
		gatherTargetNode: 'A';
		addEdgeLabeled: 'epsilon->A'.
	builder
		gatherSourceNode: 'D';
		gatherSourceNode: 'E';
		gatherTargetNode: 'A';
		addEdgeLabeled: 'D, E->A'.
	treegraph := builder build treeRootedAt: 'A'.
	self assert: treegraph isAmbiguous.
	self assert: treegraph numberOfTrees equals: 2