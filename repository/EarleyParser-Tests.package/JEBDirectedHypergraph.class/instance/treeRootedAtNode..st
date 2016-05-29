private
treeRootedAtNode: aNode
	| visited visitedEdges visitedNodes queue |
	visited := IdentityDictionary new: nodes size.
	nodes do: [ :each | visited at: each put: false ].
	visitedEdges := JELinkedList new.
	visited at: aNode put: true.
	visitedNodes := JELinkedList with: aNode.
	queue := JELinkedList with: aNode.
	[ queue isEmpty ]
		whileFalse: [ 
			(self backwardStarOf: queue removeFirst)
				do: [ :edge | 
					visitedEdges addLast: edge.
					edge sourceNodes
						reject: [ :node | visited at: node ]
						thenDo: [ :node | 
							visited at: node put: true.
							visitedNodes add: node.
							queue addLast: node ] ] ].
	^ JEBTreeHypergraph root: aNode nodes: visitedNodes hyperedges: visitedEdges