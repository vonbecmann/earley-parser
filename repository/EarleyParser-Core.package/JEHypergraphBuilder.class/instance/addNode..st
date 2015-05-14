adding nodes
addNode: anObject
	| newNode |
	newNode := JEHypernode value: anObject.
	^ nodes
		like: newNode
		ifAbsent: [ 
			nodes add: newNode.
			newNode ]