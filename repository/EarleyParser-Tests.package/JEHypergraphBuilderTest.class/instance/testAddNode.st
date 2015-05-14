running
testAddNode
	| first second item graph |
	first := JEChart number: 1.
	second := JEChart number: 2.
	item := ((JENonterminal named: 'S') 
					body: {(JETerminal character: $?)}) dotAtEnd startedAt: first andEndedAt: second.
	builder addNode: item.
	graph := builder build.
	self deny: graph nodesIsEmpty.
	self assert: graph nodesSize equals: 1.
	self assert: graph edgesIsEmpty