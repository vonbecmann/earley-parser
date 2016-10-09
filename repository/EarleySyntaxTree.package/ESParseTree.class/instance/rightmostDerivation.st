accessing
rightmostDerivation
	| derivation |
	derivation := SinglyLinkedList new.
	tree
		depthVisitPreNode: nil
		postNode: 
			[ :node | 
				node model isNonterminal
					ifTrue: [ derivation addFirst: node model reason ] ].
	^ derivation asArray