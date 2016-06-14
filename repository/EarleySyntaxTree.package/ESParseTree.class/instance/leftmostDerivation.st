accessing
leftmostDerivation
	| derivation |
	derivation := JELinkedList new.
	tree
		depthVisitPreNode: [ :node | 
			(node model class = JEDottedItem 
				and: [ node model isFinal and: [ node model head ~= grammar startSymbol ] ])
					ifTrue: [ derivation addLast: node model rule asDefined ] ]
		postNode: nil.
	^ derivation asArray