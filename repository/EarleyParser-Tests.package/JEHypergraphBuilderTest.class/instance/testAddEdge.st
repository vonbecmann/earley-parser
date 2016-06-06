running
testAddEdge
	| target source |
	target := 'S @ [1, 2]'.
	source := 'A @ [1, 2]'.

	builder addEdgeSourceNodes: {target. source} targetNode: target.
	builder rootNode: target.

	tree := builder build.
	self assert: tree root equals: target.
	self assert: tree nodesSize equals: 2.
	self assert: tree edgesSize equals: 1