running
testAddEdge04
	"add edge with out target node"

	| S source |
	S := JENonterminal named: 'S'.
	source := JEConstituent value: S start: 1 end: 2.
	builder gatherSourceNode: source.
	self should: [ builder addEdge ] raise: Error