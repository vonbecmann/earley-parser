accessing
rightmostDerivation
	| derivation |
	derivation := SinglyLinkedList new.
	tree
		depthVisitPreNode: nil
		postNode: [ :node | 
			node model class = ESNonterminalNode 
				ifTrue: [ derivation addFirst: node model rule ] ].
	^ derivation asArray