running
testAddNode
	| label from to graph |
	label := JENonterminal named: 'S'.
	from := JEChart number: 1.
	to := JEChart number: 2.
	builder addNodeLabeled: label from: from to: to.
	graph := builder build.
	self assert: graph nodes isEmpty not.
	self assert: graph nodes size equals: 1.
	self assert: graph edges isEmpty