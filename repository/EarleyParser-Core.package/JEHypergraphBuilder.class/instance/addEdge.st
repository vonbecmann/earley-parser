adding edges
addEdge
	"adds a new hyperedge with the accumulated source nodes up to now and the target node"

	| sourceNodes |
	accumulatedSourceNodes isEmpty
		ifTrue: [ ^ Error signal: 'a hyperedge''s source nodes cannot be empty' ].
	targetNode isNil
		ifTrue: [ ^ Error signal: 'target node cannot be nil' ].
	sourceNodes := SortedCollection sortBlock: [ :a :b | a <= b ].
	sourceNodes addAll: accumulatedSourceNodes.
	edges add: (self makeEdgeWithSourceNodes: sourceNodes asArray targetNode: targetNode).
	targetNode := nil.
	accumulatedSourceNodes := IdentitySet new