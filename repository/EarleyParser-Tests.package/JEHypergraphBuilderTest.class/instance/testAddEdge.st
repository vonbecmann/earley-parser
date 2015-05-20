running
testAddEdge
	| S A target source graph |
	S := JENonterminal named: 'S'.
	A := JENonterminal named: 'A'.
	target := S startedAt: 1 andEndedAt: 2.
	source := A startedAt: 1 andEndedAt: 2.
	builder gatherTargetNode: target.
	builder gatherSourceNode: target.
	builder gatherSourceNode: source.
	builder addEdgeLabeled: (S body: {A}).
	graph := builder build.
	self assert: graph nodesSize equals: 2.
	self assert: graph edgesSize equals: 1