private
edgesForSource: sourceNode
	"given all edges that mention the given source node.
	 select those edges where each node in the edge is inside the given source node"

	^ (self edgesFor: sourceNode) select: [ :edge | edge nodes allSatisfy: [ :node | sourceNode includes: node ] ]