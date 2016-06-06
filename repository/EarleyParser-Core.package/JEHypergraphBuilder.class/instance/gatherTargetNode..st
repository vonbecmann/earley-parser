adding edges
gatherTargetNode: anObject
	"set the target node for a new edge"

	targetNode
		ifNil: [ targetNode := self addNode: anObject ]
		ifNotNil: [ ^ Error signal: 'target node is already set: ' , targetNode asString ]