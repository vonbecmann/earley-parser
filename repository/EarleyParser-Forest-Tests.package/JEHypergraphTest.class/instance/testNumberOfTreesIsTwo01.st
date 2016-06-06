tests
testNumberOfTreesIsTwo01
	builder addEdgeSourceNodes: {'C'. 'B'} targetNode: 'A'.
	builder addEdgeSourceNodes: {'D'. 'E'} targetNode: 'A'.
	tree := builder
		rootNode: 'A';
		build.
	self assert: tree isAmbiguous.
	self assert: tree numberOfTrees equals: 2