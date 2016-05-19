accessing
rightmostDerivation
	| derivation |
	derivation := JELinkedList new.
	syntaxTree
		depthVisitPreNode: nil
		postNode: nil
		preEdge: nil
		postEdge: [ :edge | 
			edge label class = JERule
				ifTrue: [ (edge targetNode value value class = JENonterminal
						and: [ edge targetNode value value ~= grammar startSymbol ])
						ifTrue: [ derivation addFirst: edge label asDefined ] ] ].
	^ derivation asArray