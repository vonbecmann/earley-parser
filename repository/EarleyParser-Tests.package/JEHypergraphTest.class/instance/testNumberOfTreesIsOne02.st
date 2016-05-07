tests
testNumberOfTreesIsOne02
	builder
		gatherTargetNode: 'A';
		gatherSourceNode: 'B';
		addEdgeLabeled: 'B->A'.
	
	treegraph := builder build treeRootedAt: 'A'.
	
	self deny: treegraph isAmbiguous.
	self assert: treegraph numberOfTrees equals: 1