accessing
leftmostDerivation
	| derivation |
	derivation := SinglyLinkedList new.
	tree
		depthVisitWithPreAction:  
			[ :node | 
				node model isNonterminal
					ifTrue: [ derivation addLast: node model reason ] ].
	^ derivation asArray