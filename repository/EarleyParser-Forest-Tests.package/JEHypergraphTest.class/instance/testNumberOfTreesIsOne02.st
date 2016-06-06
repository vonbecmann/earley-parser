tests
testNumberOfTreesIsOne02
	builder addEdgeSourceNodes: {'B'} targetNode: 'A'.
	tree := builder
		rootNode: 'A';
		build.
	self deny: tree isAmbiguous.
	self assert: tree numberOfTrees equals: 1