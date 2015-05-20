running
testAddNode
	| S graph |
	S := JENonterminal named: 'S'.
	builder addNode: (S startedAt: 1 andEndedAt: 2).
	graph := builder build.
	self deny: graph nodesIsEmpty.
	self assert: graph nodesSize equals: 1.
	self assert: graph edgesIsEmpty