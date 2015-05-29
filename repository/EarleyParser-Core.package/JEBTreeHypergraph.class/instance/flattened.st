public
flattened
	"a backward directed tree with all backward path from the root node but 
	it is no longer a binary shared packed parse forest. it doesn't have the
	intermediates nodes, it has only single attributes nodes and edges with single nodes"

	| newEdges |
	newEdges := Set new.
	newEdges
		addAll:
			(edges
				select: [ :each | each targetNode isSingle ]
				thenCollect: [ :edge | 
					(edge sourceNodes allSatisfy: [ :each | each isSingle ])
						ifTrue: [ edge ]
						ifFalse: [ self makeFlatEdgeWith: edge ] ]).
	^ self class 
			root: root 
			nodes: (nodes select: [ :each | each isSingle ]) 
			hyperedges: newEdges asArray