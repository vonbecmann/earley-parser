converting
asArrayRepresentation
	"an array representation of myself. { node model. node children asArray }"

	| stack |
	stack := SinglyLinkedStack new.
	self
		depthVisitPreNode: nil
		postNode: [ :node | 
			node children isEmpty
				ifTrue: [ stack push:	{node model. #()} ]
				ifFalse: [ | newChildren |
					newChildren := SinglyLinkedStack new.
					node children size timesRepeat: [ newChildren push: stack pop ].
					stack push: {node model.	newChildren asArray} ] ].
	^ stack pop