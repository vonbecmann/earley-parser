private
treeRootedAtNode: aNode
	| visitedEdges visitedNodes queue |
	visitedEdges := JELinkedList new.
	visitedNodes := Set with: aNode.
	queue := JELinkedList with: aNode.
	[ queue isEmpty ]
		whileFalse: [ 
			queue removeFirst backwardStar
				do: [ :edge | 
					visitedEdges addLast: edge.
					edge sourceNodes
						reject: [ :node | visitedNodes includes: node ]
						thenDo: [ :node | 
							visitedNodes add: node.
							queue addLast: node ] ] ].
	^ JEBTreeHypergraph root: aNode nodes: visitedNodes asArray hyperedges: visitedEdges asArray