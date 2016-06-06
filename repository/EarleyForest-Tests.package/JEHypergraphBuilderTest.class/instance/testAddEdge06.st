running
testAddEdge06
	| target |
	target := 'S @ [1, 2]'.
	builder addEdgeSourceNodes: {} targetNode: target.
	builder rootNode: target.
	
	tree := builder build.
	
	self assert: tree root equals: target.
	self assert: tree nodesSize equals: 1.
	self assert: tree edgesSize equals: 1