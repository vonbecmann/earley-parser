tests
testNumberOfTreesIsTwo
	builder
		gatherSourceNode: 'B';
		gatherTargetNode: 'A';
		addEdgeLabeled: 'B->A'.
	builder
		gatherSourceNode: 'C';
		gatherTargetNode: 'A';
		addEdgeLabeled: 'C->A'.
	treegraph := builder build treeRootedAt: 'A'.
	
	self assert: treegraph isAmbiguous.
	self assert: treegraph numberOfTrees equals: 2