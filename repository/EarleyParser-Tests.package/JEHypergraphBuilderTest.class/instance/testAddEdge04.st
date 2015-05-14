running
testAddEdge04
	"add edge with out target node"

	| S first second source |
	S := JENonterminal named: 'S'.
	first := JEChart number: 1.
	second := JEChart number: 2.
	source := (S body: {S}) dotAtEnd startedAt: first andEndedAt: second.
	builder gatherSourceNode: source.
	self should: [ builder addEdge ] raise: Error