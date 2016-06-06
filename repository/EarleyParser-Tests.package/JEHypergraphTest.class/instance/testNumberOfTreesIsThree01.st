tests
testNumberOfTreesIsThree01
	builder addEdgeSourceNodes: {'D'} targetNode: 'A'.
	builder addEdgeSourceNodes: {'C'} targetNode: 'A'.
	builder addEdgeSourceNodes: {'C1'} targetNode: 'C'.
	builder addEdgeSourceNodes: {'C2'} targetNode: 'C'.
	
	tree := builder rootNode: 'A'; build.
	self assert: tree isAmbiguous.
	self assert: tree numberOfTrees equals: 3