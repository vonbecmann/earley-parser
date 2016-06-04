tests
testNumberOfTreesIsTwo01
	builder
		gatherSourceNode: 'C';
		gatherSourceNode: 'B';
		gatherTargetNode: 'A';
		addEdge.
	builder
		gatherSourceNode: 'D';
		gatherSourceNode: 'E';
		gatherTargetNode: 'A';
		addEdge.
	tree := builder rootNode: 'A'; build.
	self assert: tree isAmbiguous.
	self assert: tree numberOfTrees equals: 2