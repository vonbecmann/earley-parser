accessing
rightmostDerivation
	| derivation |
	derivation := JELinkedList new.
	syntaxTree
		depthVisitPreNode: nil
		postNode: nil
		preEdge: nil
		postEdge: [ :edge | 
			(edge targetNode model class = JEItem
				and: [ edge targetNode model isFinal
						and: [ edge targetNode model head ~= grammar startSymbol ] ])
				ifTrue: [ derivation addFirst: edge label asDefined ] ].
	^ derivation asArray