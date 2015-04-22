running
testAddEdge
	| S A from to graph |
	S := JENonterminal named: 'S'.
	A := JENonterminal named: 'A'.
	from := JEChart number: 1.
	to := JEChart number: 2.
	builder gatherNodeLabeled: S from: from to: to.
	builder gatherNodeLabeled: S from: from to: to.
	builder gatherNodeLabeled: A from: from to: to.
	builder addEdge.
	graph := builder build.
	self assert: graph nodes isEmpty not.
	self assert: graph nodes size equals: 2.
	self assert: graph edges isEmpty not.
	self assert: graph edges size equals: 1