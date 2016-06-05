running
testAddNode02
	"add same node twice"

	| node |
	node := 'S @ [ 1, 2]'.
	builder addNode: node.
	builder addNode: node.
	builder rootNode: node.
	
	tree := builder build.
	
	self deny: tree nodesIsEmpty.
	self assert: tree root equals: node.
	self assert: tree nodesSize equals: 1.
	self assert: tree edgesIsEmpty