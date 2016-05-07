tests
testNumberOfTreesIsTwo01
	builder
		gatherSourceNode: 'C';
		gatherSourceNode: 'B';
		gatherTargetNode: 'A';
		addEdgeLabeled: 'C, B->A'.
	builder
		gatherSourceNode: 'D';
		gatherSourceNode: 'E';
		gatherTargetNode: 'A';
		addEdgeLabeled: 'D, E->A'.
	treegraph := builder build treeRootedAt: 'A'.
	self assert: treegraph isAmbiguous.
	self assert: treegraph numberOfTrees equals: 2