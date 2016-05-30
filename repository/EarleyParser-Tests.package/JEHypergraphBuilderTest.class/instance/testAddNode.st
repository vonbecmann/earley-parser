running
testAddNode
	builder addNode: 'S @ [1, 2]'.
	graph := builder build.
	self deny: graph nodesIsEmpty.
	self assert: graph nodesSize equals: 1.
	self assert: graph edgesIsEmpty