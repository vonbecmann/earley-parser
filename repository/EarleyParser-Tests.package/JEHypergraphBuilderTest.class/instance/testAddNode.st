running
testAddNode
	builder addNode: 'S @ [1, 2]'.
	builder rootNode: 'S @ [1, 2]'.
	
	tree := builder build.
	
	self deny: tree nodesIsEmpty.
	self assert: tree root equals: 'S @ [1, 2]'.
	self assert: tree nodesSize equals: 1.
	self assert: tree edgesIsEmpty