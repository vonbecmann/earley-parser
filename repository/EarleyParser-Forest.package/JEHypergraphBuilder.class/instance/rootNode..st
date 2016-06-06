adding nodes
rootNode: anObject
	"set the root node for the building tree"

	root
		ifNil: [ root := self addNode: anObject ]
		ifNotNil: [ ^ Error signal: 'root node is already set: ' , root asString ]