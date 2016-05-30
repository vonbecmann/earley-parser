running
testAddEdge03
	"add edge with out source nodes"

	builder gatherTargetNode: 'S @ [ 1, 1 ]'.
	builder addEdgeLabeled: 'S is epsilon'.
	graph := builder build.
	self assert: graph nodesSize equals: 1.
	self assert: graph edgesSize equals: 1