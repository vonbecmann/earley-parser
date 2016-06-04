private operations
buildTreeRootedAtNode: aNode
	"
	a backward directed tree with all backward path from aNode. 
	it's a binary shared packed parse forest. it's rank is 3.
	breadth-first search.
	"

	| visited visitedEdges visitedNodes queue |
	visited := IdentityDictionary new.
	visitedEdges := JELinkedList new.
	visitedNodes := JELinkedList new.
	queue := JELinkedList with: aNode.
	visited at: aNode put: true.
	[ queue isEmpty ]
		whileFalse: [ | packed |
			packed := queue removeFirst.
			visitedNodes add: packed model.
			visitedEdges
				addAll:
					(packed families
						collect:
							[ :family | JEDirectedHyperedge 
												sourceNodes: (family members collect: [ :each | each model ]) 
												targetNode: packed model ]).
			packed families
				do: [ :family | 
					family members
						reject: [ :node | visited at: node ifAbsent: [ false ] ]
						thenDo: [ :node | 
							visited at: node put: true.
							queue addLast: node ] ] ].
	^ JEBTreeHypergraph root: aNode model nodes: visitedNodes hyperedges: visitedEdges