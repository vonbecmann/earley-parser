tests
testNumberOfTreesIsTwo
	builder addEdgeSourceNodes: {'B'} targetNode: 'A'.
	builder addEdgeSourceNodes: {'C'} targetNode: 'A'.
	
	tree := builder rootNode: 'A'; build.
	
	self assert: tree isAmbiguous.
	self assert: tree numberOfTrees equals: 2