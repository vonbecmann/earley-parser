tests
testNumberOfTreesIsOne01
	builder
		gatherTargetNode: 'A';
		addEdge.
	
	tree := builder rootNode: 'A'; build.
	
	self deny: tree isAmbiguous.
	self assert: tree numberOfTrees equals: 1