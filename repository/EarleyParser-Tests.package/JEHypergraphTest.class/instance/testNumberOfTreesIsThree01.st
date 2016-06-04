tests
testNumberOfTreesIsThree01
	builder
		gatherTargetNode: 'A';
		gatherSourceNode: 'D';
		addEdge.
	builder
		gatherTargetNode: 'A';
		gatherSourceNode: 'C';
		addEdge.
	builder
		gatherTargetNode: 'C';
		gatherSourceNode: 'C1';
		addEdge.
	builder
		gatherTargetNode: 'C';
		gatherSourceNode: 'C2';
		addEdge.
	tree := builder rootNode: 'A'; build.
	self assert: tree isAmbiguous.
	self assert: tree numberOfTrees equals: 3