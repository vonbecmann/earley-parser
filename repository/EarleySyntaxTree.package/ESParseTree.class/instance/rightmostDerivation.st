accessing
rightmostDerivation
	| derivation |
	derivation := SinglyLinkedList new.
	ESTRightToLeftDepthFirstVisitor new
		preOrderBlock: [ :node | 
			node model isNonterminal
				ifTrue: [ derivation addLast: node model reason ] ];
		visit: tree.
	^ derivation asArray