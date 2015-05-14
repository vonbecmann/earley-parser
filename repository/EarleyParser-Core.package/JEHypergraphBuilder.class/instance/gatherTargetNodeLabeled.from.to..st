to be removed
gatherTargetNodeLabeled: anObject from: startChart to: endChart
	"set the target node for a new edge"

	targetNode isNil
		ifTrue: [ targetNode := self addNode: anObject ]
		ifFalse: [ ^ Error signal: 'target node is already set: ' , targetNode asString ]