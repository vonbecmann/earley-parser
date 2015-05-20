running
testAddEdge03
	"add edge with out source nodes"

	| S target |
	S := JENonterminal named: 'S'.
	target := JEConstituent value: S start: 1 end: 2.
	builder gatherTargetNode: target.
	self should: [ builder addEdge ] raise: Error