running
testAddEdge04
	"add edge with out target node"

	| S A source |
	S := JENonterminal named: 'S'.
	A := JENonterminal named: 'A'.
	source := S startedAt: 1 andEndedAt: 2.
	builder gatherSourceNode: source.
	self should: [ builder addEdgeLabeled: (S body: {A}) ] raise: Error