running
testAddEdgeWithNoNodes
	self
		should: [ builder addEdgeLabeled: 'S is A' ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'target node cannot be nil' ]