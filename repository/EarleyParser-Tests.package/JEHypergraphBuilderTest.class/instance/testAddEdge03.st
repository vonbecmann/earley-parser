running
testAddEdge03
	"add edge with out source nodes"

	| S A target |
	S := JENonterminal named: 'S'.
	A := JENonterminal named: 'A'.
	target := S startedAt: 1 andEndedAt: 2.
	builder gatherTargetNode: target.
	self should: [ builder addEdgeLabeled: (S body: {A}) ] raise: Error