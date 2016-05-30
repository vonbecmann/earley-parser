running
testAddEdge
	| target source |
	target := 'S @ [1, 2]'.
	source := 'A @ [1, 2]'.
	builder gatherTargetNode: target.
	builder gatherSourceNode: target.
	builder gatherSourceNode: source.
	builder addEdgeLabeled: 'S is A'.
	graph := builder build.
	self assert: graph nodesSize equals: 2.
	self assert: graph edgesSize equals: 1