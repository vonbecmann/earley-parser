accessing
leftmostDerivation
	| derivation |
	derivation := SinglyLinkedList new.
	tree
		depthVisitPreNode: [ :node | 
			node model class = JEDottedItem
				ifTrue: [ derivation addLast: node model rule asDefined ] ]
		postNode: nil.
	^ derivation asArray