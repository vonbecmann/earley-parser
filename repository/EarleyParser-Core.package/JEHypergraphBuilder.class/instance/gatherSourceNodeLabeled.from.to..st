adding edges
gatherSourceNodeLabeled: anObject from: startChart to: endChart
	"accumulate source nodes for a new edge"

	accumulatedSourceNodes add: (self addNodeLabeled: anObject from: startChart to: endChart)