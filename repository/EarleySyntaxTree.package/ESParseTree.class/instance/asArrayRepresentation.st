converting
asArrayRepresentation
	"an array representation of myself."

	| stack |
	stack := SinglyLinkedStack new.
	tree
		depthVisitPreNode: nil
		postNode: [ :node | 
			node model class == JEDottedItem
				ifTrue: [ 
					node children isEmpty
						ifTrue: [ stack push: #() ]
						ifFalse: [ | newChildren |
							newChildren := SinglyLinkedStack new.
							node children size timesRepeat: [ newChildren push: stack pop ].
							stack push: newChildren asArray ] ]
				ifFalse: [ 
					node model class == JETerminalItem
						ifTrue: [ stack push: node model word ] ] ].
	^ stack pop first