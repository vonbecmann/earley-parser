running
testAddEdge03
	"add edge with out source nodes"

	| S from to |
	S := JENonterminal named: 'S'.
	from := JEChart number: 1.
	to := JEChart number: 2.
	builder gatherTargetNodeLabeled: S from: from to: to.
	self should: [ builder addEdge ] raise: Error