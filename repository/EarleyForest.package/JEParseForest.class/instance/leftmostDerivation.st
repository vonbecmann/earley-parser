accessing
leftmostDerivation
	| derivation |
	derivation := JELinkedList new.
	syntaxTree
		depthVisitPreNode: nil
		postNode: nil
		preEdge: [ :edge | 
			(edge targetNode model class = JEDottedItem
				and: [ edge targetNode model isFinal 
					and: [ edge targetNode model head ~= grammar startSymbol ] ])
						ifTrue: [ derivation addLast: edge targetNode model rule asDefined ] ]
		postEdge: nil.
	^ derivation asArray