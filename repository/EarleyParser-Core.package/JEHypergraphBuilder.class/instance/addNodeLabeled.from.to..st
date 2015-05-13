adding nodes
addNodeLabeled: anObject from: startChart to: endChart
	| newNode |
	newNode := self makeNodeLabeled: anObject from: startChart to: endChart.
	^ nodes
		like: newNode
		ifAbsent: [ 
			nodes add: newNode.
			newNode ]