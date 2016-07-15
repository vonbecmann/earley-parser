accessing
rightmostDerivation
	| derivation |
	derivation := JELinkedList new.
	tree
		depthVisitPreNode: nil
		postNode: [ :node | 
			(node model class = JEDottedItem and: 
				[ node model isFinal and: [ node model head ~= grammar startSymbol ] ])
				ifTrue: [ derivation addFirst: node model rule asDefined ] ].
	^ derivation asArray