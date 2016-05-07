tests
testNumberOfTreesIsTwo04
	builder
		gatherSourceNode: 'E2';
		gatherTargetNode: 'C2';
		addEdgeLabeled: 'E2->C2'.
	builder
		gatherSourceNode: 'D2';
		gatherTargetNode: 'C2';
		addEdgeLabeled: 'D2->C2'.
	builder
		gatherSourceNode: 'C2';
		gatherTargetNode: 'C';
		addEdgeLabeled: 'C2->C'.
	builder
		gatherSourceNode: 'C';
		gatherSourceNode: 'B';
		gatherTargetNode: 'A';
		addEdgeLabeled: 'C, B->A'.
	treegraph := builder build treeRootedAt: 'A'.
	self assert: treegraph isAmbiguous.
	self assert: treegraph numberOfTrees equals: 2