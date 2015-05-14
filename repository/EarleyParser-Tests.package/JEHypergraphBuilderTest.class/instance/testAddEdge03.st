running
testAddEdge03
	"add edge with out source nodes"

	| S first second target |
	S := JENonterminal named: 'S'.
	first := JEChart number: 1.
	second := JEChart number: 2.
	target := (S body: {S}) dotAtEnd startedAt: first andEndedAt: second.
	builder gatherTargetNode: target.
	self should: [ builder addEdge ] raise: Error