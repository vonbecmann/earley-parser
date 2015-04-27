adding edges
addEdge
	"adds a new edge with the accumulated source nodes up to now and the target node"

	accumulatedSourceNodes isEmpty
		ifTrue: [ ^ Error signal: 'a hyperedge''s source nodes cannot be empty' ].
	targetNode isNil
		ifTrue: [ ^ Error signal: 'target node cannot be nil' ].
	edges add: (JEHyperedge sourceNodes: accumulatedSourceNodes targetNode: targetNode).
	targetNode := nil.
	accumulatedSourceNodes := Set new