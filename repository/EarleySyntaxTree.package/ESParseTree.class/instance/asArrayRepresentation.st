converting
asArrayRepresentation
	"an array representation of myself."

	| stack |
	stack := SinglyLinkedStack new.
	tree
		depthVisitPreNode: nil
		postNode: [ :node | 
			node model isNonterminal
				ifTrue: 
					[ node children isEmpty
						ifTrue: [ stack push: #() ]
						ifFalse: 
							[ | newChildren |
								newChildren := SinglyLinkedStack new.
								node children size timesRepeat: [ newChildren push: stack pop ].
								stack push: newChildren asArray ] ].
			node model isTerminal
				ifTrue: [ stack push: node model reason ] ].
	^ stack pop