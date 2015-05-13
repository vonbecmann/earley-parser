adding edges
gatherTargetNodeLabeled: anObject from: startChart to: endChart
	"set the target node for a new edge"

	targetNode isNil
		ifTrue: [ targetNode := self addNodeLabeled: anObject from: startChart to: endChart ]
		ifFalse: [ ^ Error signal: 'target node is already set: ' , targetNode asString ]