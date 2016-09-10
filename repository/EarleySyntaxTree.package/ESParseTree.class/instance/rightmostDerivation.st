accessing
rightmostDerivation
	| derivation |
	derivation := SinglyLinkedList new.
	tree
		depthVisitPreNode: nil
		postNode: [ :node | 
			node model class = JEDottedItem
				ifTrue: [ derivation addFirst: node model rule asDefined ] ].
	^ derivation asArray