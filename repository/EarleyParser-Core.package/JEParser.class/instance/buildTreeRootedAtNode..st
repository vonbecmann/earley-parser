private operations
buildTreeRootedAtNode: aNode
	" breadth-first search "
	| visited visitedEdges visitedNodes queue |
	visited := IdentityDictionary new.
	visitedEdges := JELinkedList new.
	visitedNodes := JELinkedList new.
	queue := JELinkedList with: aNode.
	visited at: aNode put: true.
	[ queue isEmpty ]
		whileFalse: [ 
			| actual |
			actual := queue removeFirst.
			visitedNodes add: actual.
			actual backwardStar
				do: [ :edge | 
					visitedEdges addLast: edge.
					edge sourceNodes 
								reject: [ :node | visited at: node ifAbsent: [ false ] ] 
								thenDo: [ :node | visited at: node put: true. queue addLast: node ] ] ].
	^ JEBTreeHypergraph root: aNode nodes: visitedNodes hyperedges: visitedEdges