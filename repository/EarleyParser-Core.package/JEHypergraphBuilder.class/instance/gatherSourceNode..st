adding edges
gatherSourceNode: aNode
	"accumulate source nodes for a new edge"

	accumulatedSourceNodes add: (self addNode: aNode)