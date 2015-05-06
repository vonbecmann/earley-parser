adding edges
gatherSourceNodeLabeled: anObject from: startChart to: endChart
	"accumulate source nodes for a new edge"

	| newNode |
	newNode := self makeNodeLabeled: anObject from: startChart to: endChart.
	accumulatedSourceNodes
		add:
			(nodes
				like: newNode
				ifAbsent: [ 
					nodes add: newNode.
					newNode ])