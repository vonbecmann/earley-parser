public
treeRootedAt: anObject
	| rootNode visitedNodes visitedEdges queue |
	rootNode := nodes
		detect: [ :each | each value = anObject ]
		ifNone: [ self error: anObject asString , ' is not a node of the hypergraph' ].
	visitedNodes := Set with: rootNode.
	visitedEdges := Set new.
	queue := JELinkedList with: rootNode.
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
	^ JEBTreeHypergraph root: anObject nodes: visitedNodes asArray hyperedges: visitedEdges asArray