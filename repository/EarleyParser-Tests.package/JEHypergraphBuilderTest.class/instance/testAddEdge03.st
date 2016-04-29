running
testAddEdge03
	"add edge with out source nodes"

	| S target graph |
	S := JENonterminal named: 'S'.
	target := S startedAt: 1 andEndedAt: 1.
	builder gatherTargetNode: target.
	builder addEdgeLabeled: S is_epsilon.
	graph := builder build.
	self assert: graph nodesSize equals: 1.
	self assert: graph edgesSize equals: 1