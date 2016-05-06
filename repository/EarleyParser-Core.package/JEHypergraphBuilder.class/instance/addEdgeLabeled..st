adding edges
addEdgeLabeled: anObject
	"adds a new hyperedge with the accumulated source nodes up to now and the target node"

	targetNode ifNil: [ ^ Error signal: 'target node cannot be nil' ].
	edges add: (JEDirectedHyperedge labeled: anObject sourceNodes: accumulatedSourceNodes asArray targetNode: targetNode).
	self resetTargetAndSourceNodes