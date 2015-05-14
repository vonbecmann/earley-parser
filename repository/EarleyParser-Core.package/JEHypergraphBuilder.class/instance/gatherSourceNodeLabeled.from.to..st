to be removed
gatherSourceNodeLabeled: anObject from: startChart to: endChart
	"accumulate source nodes for a new edge"

	accumulatedSourceNodes add: (self addNode: anObject)