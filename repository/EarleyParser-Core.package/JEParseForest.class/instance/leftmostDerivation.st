accessing
leftmostDerivation
	| derivation |
	derivation := JELinkedList new.
	syntaxTree
		depthVisitPreNode: nil
		postNode: nil
		preEdge: [ :edge | 
			(edge targetNode model class = JEItem
				and: [ edge targetNode model isFinal 
					and: [ edge targetNode model head ~= grammar startSymbol ] ])
						ifTrue: [ derivation addLast: edge label asDefined ] ]
		postEdge: nil.
	^ derivation asArray