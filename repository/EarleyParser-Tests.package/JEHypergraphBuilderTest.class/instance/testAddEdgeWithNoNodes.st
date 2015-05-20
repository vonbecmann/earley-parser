running
testAddEdgeWithNoNodes
	| S A |
	S := JENonterminal named: 'S'.
	A := JENonterminal named: 'A'.
	self should: [ builder addEdgeLabeled: (S body: {A}) ] raise: Error