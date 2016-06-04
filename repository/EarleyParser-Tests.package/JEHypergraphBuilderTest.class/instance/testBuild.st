running
testBuild
	builder rootNode: 'S'.

	tree := builder build.

	self deny: tree nodesIsEmpty.
	self assert: tree root model equals: 'S'.
	self assert: tree nodesSize equals: 1.
	self assert: tree edgesIsEmpty