public
forestStartingAt: aNode
	| forest visitedEdges visitedNodes stack |
	forest := OrderedCollection new.
	visitedEdges := Set new.
	visitedNodes := Set new.
	stack := Stack new.
	stack push: aNode.
	self
		forest: forest
		stack: stack
		nodes: visitedNodes
		edges: visitedEdges.
	^ forest