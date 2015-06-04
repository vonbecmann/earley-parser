adding edges
gatherSourceNode: anObject
	"accumulate source nodes for a new edge"

	accumulatedSourceNodes add: (self addNode: anObject)