running
testAddNode02
	"add same node twice"

	| first second item graph |
	first := JEChart number: 1.
	second := JEChart number: 2.
	item := ((JENonterminal named: 'S') body: {(JETerminal character: $2)}) 
								dotAtEnd startedAt: first andEndedAt: second.
	builder addNode: item.
	builder addNode: item.
	graph := builder build.
	self deny: graph nodesIsEmpty.
	self assert: graph nodesSize equals: 1.
	self assert: graph edgesIsEmpty