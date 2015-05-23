public
minimal
	| newEdges |
	newEdges := Set new.
	newEdges
		addAll:
			(edges
				select: [ :each | each targetNode isSingle ]
				thenCollect: [ :edge | 
					(edge sourceNodes allSatisfy: [ :each | each isSingle ])
						ifTrue: [ edge ]
						ifFalse: [ self makeSingleNodesEdgeWith: edge ] ]).
	^ self class 
				root: root 
				nodes: (nodes select: [ :each | each isSingle ]) 
				hyperedges: newEdges asArray