adding edges
addEdge
	"adds a new hyperedge with the accumulated source nodes up to now and the target node"

	targetNode ifNil: [ ^ Error signal: 'target node cannot be nil' ].
	edges add: (JEDirectedHyperedge sourceNodes: accumulatedSourceNodes targetNode: targetNode).
	self resetTargetAndSourceNodes