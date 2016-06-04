running
testAddEdgeWithNoNodes
	self
		should: [ builder addEdge ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'target node cannot be nil' ]