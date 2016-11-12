accessing
rightmostDerivation
	| derivation |
	derivation := SinglyLinkedList new.
	ESTDepthFirstVisitor new
		postOrderBlock: [ :node | 
			node model isNonterminal
				ifTrue: [ derivation addFirst: node model reason ] ];
		visit: tree.
	^ derivation asArray