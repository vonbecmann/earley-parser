tests
testNumberOfTreesIsOne03

	builder
		gatherTargetNode: 'A';
		gatherSourceNode: 'C';
		gatherSourceNode: 'B';
		addEdgeLabeled: 'C, B->A'.
		
	treegraph := builder build treeRootedAt: 'A'.

	self deny: treegraph isAmbiguous.
	self assert: treegraph numberOfTrees equals: 1