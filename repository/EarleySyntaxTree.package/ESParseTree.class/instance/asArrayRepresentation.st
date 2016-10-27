converting
asArrayRepresentation
	"an array representation of myself."

	| stack |
	stack := SinglyLinkedStack new.
	tree
		depthVisitWithPostAction: 
			[ :node | 
			node model isTerminal
				ifTrue: [ stack push: node model reason ]
				ifFalse: 
					[ node children isEmpty
						ifTrue: [ stack push: #() ]
						ifFalse: 
							[ | newChildren |
								newChildren := SinglyLinkedStack new.
								node children size timesRepeat: [ newChildren push: stack pop ].
								stack push: newChildren asArray ] ] ].
	^ stack pop