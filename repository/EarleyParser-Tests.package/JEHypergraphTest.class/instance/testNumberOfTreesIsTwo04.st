tests
testNumberOfTreesIsTwo04
	builder addEdgeSourceNodes: {'E2'} targetNode: 'C2'.
	builder addEdgeSourceNodes: {'D2'} targetNode: 'C2'.
	builder addEdgeSourceNodes: {'C2'} targetNode: 'C'.
	builder addEdgeSourceNodes: {'C'. 'B'} targetNode: 'A'.
	tree := builder rootNode: 'A'; build.
	self assert: tree isAmbiguous.
	self assert: tree numberOfTrees equals: 2