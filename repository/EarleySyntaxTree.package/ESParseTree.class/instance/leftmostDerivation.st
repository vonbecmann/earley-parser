accessing
leftmostDerivation
	| derivation |
	derivation := SinglyLinkedList new.
	ESTDepthFirstVisitor new
		preOrderBlock: [ :node | 
			node model isNonterminal
				ifTrue: [ derivation addLast: node model reason ] ];
		visit: tree.
	^ derivation asArray