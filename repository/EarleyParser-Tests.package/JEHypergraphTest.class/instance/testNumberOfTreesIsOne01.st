tests
testNumberOfTreesIsOne01
	builder
		gatherTargetNode: 'A';
		addEdgeLabeled: 'epsilon->A'.
	
	treegraph := builder build treeRootedAt: 'A'.
	
	self deny: treegraph isAmbiguous.
	self assert: treegraph numberOfTrees equals: 1