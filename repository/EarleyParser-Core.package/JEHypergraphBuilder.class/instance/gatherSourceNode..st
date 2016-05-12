adding edges
gatherSourceNode: anObject
	"accumulate source nodes for a new edge"

	accumulatedSourceNodes addLast: (self addNode: anObject)