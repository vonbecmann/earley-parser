adding edges
gatherTargetNodeLabeled: anObject from: startChart to: endChart
	"set the target node for a new edge"

	targetNode isNil
		ifTrue: [ 
			| newNode |
			newNode := self makeNodeLabeled: anObject from: startChart to: endChart.
			nodes add: newNode.
			targetNode := nodes like: newNode ]
		ifFalse: [ ^ Error signal: 'target node is already set: ' , targetNode asString ]