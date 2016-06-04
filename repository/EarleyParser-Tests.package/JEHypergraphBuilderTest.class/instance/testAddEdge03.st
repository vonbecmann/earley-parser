running
testAddEdge03
	"add edge with out source nodes"

	builder gatherTargetNode: 'S @ [ 1, 1 ]'.
	builder addEdge.
	builder rootNode: 'S @ [ 1, 1 ]'.
	
	tree := builder build.
	
	self assert: tree root model equals: 'S @ [ 1, 1 ]'.
	self assert: tree nodesSize equals: 1.
	self assert: tree edgesSize equals: 1