adding edges
gatherSourceNodeLabeled: anObject from: startChart to: endChart
	"accumulate source nodes for a new edge"

	| newNode |
	newNode := self makeNodeLabeled: anObject from: startChart to: endChart.
	nodes add: newNode.
	accumulatedSourceNodes add: (nodes like: newNode)