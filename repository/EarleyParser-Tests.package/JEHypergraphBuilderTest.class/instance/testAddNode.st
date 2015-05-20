running
testAddNode
	| S graph |
	S := JENonterminal named: 'S'.
	builder addNode: (JEConstituent value: S start: 1 end: 2).
	graph := builder build.
	self deny: graph nodesIsEmpty.
	self assert: graph nodesSize equals: 1.
	self assert: graph edgesIsEmpty