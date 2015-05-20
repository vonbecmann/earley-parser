running
testAddEdge04
	"add edge with out target node"

	| S A source |
	S := JENonterminal named: 'S'.
	A := JENonterminal named: 'A'.
	source := JEConstituent value: S start: 1 end: 2.
	builder gatherSourceNode: source.
	self should: [ builder addEdgeLabeled: (S body: {A}) ] raise: Error