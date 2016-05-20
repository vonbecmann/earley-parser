private operations
buildTreeRootedAtNode: aNode
	| visited visitedEdges visitedNodes queue |
	visited := IdentityDictionary new.
	visited at: aNode put: true.
	visitedEdges := JELinkedList new.
	visitedNodes := JELinkedList with: aNode.
	queue := JELinkedList with: aNode.
	[ queue isEmpty ]
		whileFalse: [ queue removeFirst backwardStar
				do: [ :edge | 
					visitedEdges addLast: edge.
					edge sourceNodes
						reject: [ :node | visited at: node ifAbsent: [ false ] ]
						thenDo: [ :node | 
							visited at: node put: true.
							visitedNodes add: node.
							queue addLast: node ] ] ].
	^ JEBTreeHypergraph root: aNode nodes: visitedNodes hyperedges: visitedEdges