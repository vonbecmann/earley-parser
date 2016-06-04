tests
testNumberOfTreesIsTwo
	builder
		gatherSourceNode: 'B';
		gatherTargetNode: 'A';
		addEdge.
	builder
		gatherSourceNode: 'C';
		gatherTargetNode: 'A';
		addEdge.
	tree := builder rootNode: 'A'; build.
	
	self assert: tree isAmbiguous.
	self assert: tree numberOfTrees equals: 2