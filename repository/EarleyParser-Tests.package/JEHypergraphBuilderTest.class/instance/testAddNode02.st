running
testAddNode02
	"add same node twice"

	| S node graph |
	S := JENonterminal named: 'S'.
	node := S startedAt: 1 andEndedAt: 2.
	builder addNode: node.
	builder addNode: node.
	graph := builder build.
	self deny: graph nodesIsEmpty.
	self assert: graph nodesSize equals: 1.
	self assert: graph edgesIsEmpty