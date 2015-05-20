running
testAddEdge03
	"add edge with out source nodes"

	| S A target |
	S := JENonterminal named: 'S'.
	A := JENonterminal named: 'A'.
	target := JEConstituent value: S start: 1 end: 2.
	builder gatherTargetNode: target.
	self should: [ builder addEdgeLabeled: (S body: {A}) ] raise: Error