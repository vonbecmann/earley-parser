tests
testNumberOfTreesIsFour01
	builder
		gatherTargetNode: 'A';
		gatherSourceNode: 'D';
		addEdgeLabeled: 'D->A'.
	builder
		gatherTargetNode: 'A';
		gatherSourceNode: 'C';
		addEdgeLabeled: 'C->A'.
	builder
		gatherTargetNode: 'C';
		gatherSourceNode: 'C1';
		addEdgeLabeled: 'C1->C'.
	builder
		gatherTargetNode: 'C';
		gatherSourceNode: 'C2';
		addEdgeLabeled: 'C2->C'.
	builder
		gatherTargetNode: 'D';
		gatherSourceNode: 'D1';
		addEdgeLabeled: 'D1->D'.
	builder
		gatherTargetNode: 'D';
		gatherSourceNode: 'D2';
		addEdgeLabeled: 'D2->D'.
	treegraph := builder build treeRootedAt: 'A'.
	self assert: treegraph isAmbiguous.
	self assert: treegraph numberOfTrees equals: 4