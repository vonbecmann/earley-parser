tests
testNumberOfTreesIsOne03

	builder addEdgeSourceNodes: {'C'. 'B'} targetNode: 'A'.
		
	tree := builder rootNode: 'A'; build.

	self deny: tree isAmbiguous.
	self assert: tree numberOfTrees equals: 1