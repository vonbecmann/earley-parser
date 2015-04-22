adding edges
gatherNodeLabeled: anObject from: startChart to: endChart
	"accumulate nodes for a new edge"

	| newNode |
	newNode := self makeNodeLabeled: anObject from: startChart to: endChart.
	nodes add: newNode.
	accumulatedNodes add: (nodes like: newNode)