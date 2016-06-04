tests
testNumberOfTreesIsOne02
	builder
		gatherTargetNode: 'A';
		gatherSourceNode: 'B';
		addEdge.
	
	tree := builder rootNode: 'A'; build.
	
	self deny: tree isAmbiguous.
	self assert: tree numberOfTrees equals: 1