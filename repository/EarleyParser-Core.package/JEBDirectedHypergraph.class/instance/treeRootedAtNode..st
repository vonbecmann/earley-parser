private
treeRootedAtNode: aNode
	| visitedEdges visitedNodes queue |
	visitedEdges := Set new.
	visitedNodes := Set with: aNode.
	queue := JELinkedList with: aNode.
	[ queue isEmpty ]
		whileFalse: [ 
			(self backwardStarOf: queue removeFirst)
				reject: [ :edge | visitedEdges includes: edge ]
				thenDo: [ :edge | 
					visitedEdges add: edge.
					edge sourceNodes
						reject: [ :node | visitedNodes includes: node ]
						thenDo: [ :node | 
							visitedNodes add: node.
							queue addLast: node ] ] ].
	^ JEBTreeHypergraph root: aNode nodes: visitedNodes asArray hyperedges: visitedEdges asArray