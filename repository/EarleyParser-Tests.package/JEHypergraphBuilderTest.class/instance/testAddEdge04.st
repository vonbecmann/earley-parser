running
testAddEdge04
	"add edge with out target node"

	| source |
	source := 'S @ [ 1, 2 ]'.
	builder gatherSourceNode: source.
	self
		should: [ builder addEdge ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'target node cannot be nil' ]