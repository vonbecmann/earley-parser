running
testAddNode02
	"add same node twice"

	| node |
	node := 'S @ [ 1, 2]'.
	builder addNode: node.
	builder addNode: node.
	graph := builder build.
	self deny: graph nodesIsEmpty.
	self assert: graph nodesSize equals: 1.
	self assert: graph edgesIsEmpty