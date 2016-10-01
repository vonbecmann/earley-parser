accessing
leftmostDerivation
	| derivation |
	derivation := SinglyLinkedList new.
	tree
		depthVisitPreNode: [ :node | 
			node model class = ESNonterminalNode 
				ifTrue: [ derivation addLast: node model rule ] ]
		postNode: nil.
	^ derivation asArray