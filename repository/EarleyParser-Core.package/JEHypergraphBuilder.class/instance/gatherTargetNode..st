adding edges
gatherTargetNode: aNode
	"set the target node for a new edge"

	targetNode isNil
		ifTrue: [ targetNode := self addNode: aNode ]
		ifFalse: [ ^ Error signal: 'target node is already set: ' , targetNode asString ]