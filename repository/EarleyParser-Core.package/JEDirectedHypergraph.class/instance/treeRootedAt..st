public
treeRootedAt: aNode
	| visitedNodes visitedEdges queue |
	visitedNodes := Set with: aNode.
	visitedEdges := Set new.
	queue := JELinkedList with: aNode.
	[ queue isEmpty ]
		whileFalse: [ 
			| current |
			current := queue removeFirst.
			(self backwardStarAt: current)
				do: [ :edge | 
					(visitedEdges includes: edge)
						ifFalse: [ 
							visitedEdges add: edge.
							edge sourceNodes
								do: [ :sourceNode | 
									(visitedNodes includes: sourceNode)
										ifFalse: [ 
											visitedNodes add: sourceNode.
											queue addLast: sourceNode ] ] ] ] ].
	^ JEBTreeHypergraph root: aNode nodes: visitedNodes asArray hyperedges: visitedEdges asArray