accessing
rightmostDerivation
	| derivation |
	derivation := SinglyLinkedList new.
	tree
		depthVisitWithPostAction: 
			[ :node | 
				node model isNonterminal
					ifTrue: [ derivation addFirst: node model reason ] ].
	^ derivation asArray