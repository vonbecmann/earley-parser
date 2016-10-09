accessing
leftmostDerivation
	| derivation |
	derivation := SinglyLinkedList new.
	tree
		depthVisitPreNode: 
			[ :node | 
				node model isNonterminal
					ifTrue: [ derivation addLast: node model reason ] ]
		postNode: nil.
	^ derivation asArray