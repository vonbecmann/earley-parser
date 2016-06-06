running
testAddEdge03
	"add edge with out source nodes"

	builder addEdgeSourceNodes: {} targetNode: 'S @ [ 1, 1 ]'.
	builder rootNode: 'S @ [ 1, 1 ]'.
	
	tree := builder build.
	
	self assert: tree root equals: 'S @ [ 1, 1 ]'.
	self assert: tree nodesSize equals: 1.
	self assert: tree edgesSize equals: 1