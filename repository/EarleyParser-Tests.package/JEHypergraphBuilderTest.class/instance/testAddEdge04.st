running
testAddEdge04
	"add edge with out target node"

	| S from to |
	S := JENonterminal named: 'S'.
	from := JEChart number: 1.
	to := JEChart number: 2.
	builder gatherSourceNodeLabeled: S from: from to: to.
	self should: [ builder addEdge ] raise: Error