adding edges
addEdgeLabeled: anObject
	"adds a new hyperedge with the accumulated source nodes up to now and the target node"

	accumulatedSourceNodes isEmpty
		ifTrue: [ ^ Error signal: 'a hyperedge''s source nodes cannot be empty' ].
	targetNode isNil
		ifTrue: [ ^ Error signal: 'target node cannot be nil' ].
	edges add: (self 
						makeEdgeLabeled: anObject 
						withSourceNodes: accumulatedSourceNodes asArray 
						targetNode: targetNode).
	self resetTargetAndSourceNodes