tests
testNumberOfTreesIsTwo04
	builder
		gatherSourceNode: 'E2';
		gatherTargetNode: 'C2';
		addEdge.
	builder
		gatherSourceNode: 'D2';
		gatherTargetNode: 'C2';
		addEdge.
	builder
		gatherSourceNode: 'C2';
		gatherTargetNode: 'C';
		addEdge.
	builder
		gatherSourceNode: 'C';
		gatherSourceNode: 'B';
		gatherTargetNode: 'A';
		addEdge.
	tree := builder rootNode: 'A'; build.
	self assert: tree isAmbiguous.
	self assert: tree numberOfTrees equals: 2