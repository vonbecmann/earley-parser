tests
testNumberOfTreesIsTwo02
	builder addEdgeSourceNodes: {} targetNode: 'A'.
	builder addEdgeSourceNodes: {'D'. 'E'} targetNode: 'A'.
	tree := builder rootNode: 'A'; build.
	self assert: tree isAmbiguous.
	self assert: tree numberOfTrees equals: 2