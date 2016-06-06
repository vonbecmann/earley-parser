tests
testNumberOfTreesIsOne01
	builder addEdgeSourceNodes: {} targetNode: 'A'.
	tree := builder
		rootNode: 'A';
		build.
	self deny: tree isAmbiguous.
	self assert: tree numberOfTrees equals: 1