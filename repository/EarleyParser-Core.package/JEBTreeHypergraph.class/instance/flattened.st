public
flattened
	"a backward directed tree with all backward path from the root node but 
	it is no longer a binary shared packed parse forest. it doesn't have the
	intermediate nodes, it has only single attributes nodes and edges with single nodes"

	^ self class
		root: root
		nodes: (nodes select: [ :each | each isSingle ])
		hyperedges:
			(edges
				select: [ :each | each targetNode isSingle ]
				thenCollect: [ :edge | 
					(edge sourceNodes allSatisfy: [ :each | each isSingle ])
						ifTrue: [ edge ]
						ifFalse: [ self makeFlatEdgeWith: edge ] ])