private operations
buildTreeRootedAtNode: aNode
	" breadth-first search "

	| visited visitedEdges visitedNodes queue |
	visited := IdentityDictionary new.
	visitedEdges := JELinkedList new.
	visitedNodes := IdentityDictionary new.
	queue := JELinkedList with: aNode.
	visited at: aNode put: true.
	[ queue isEmpty ]
		whileFalse: [ | actual |
			actual := queue removeFirst.
			actual model class == JEItem
				ifTrue: [ visitedNodes at: actual model put: (JEHypernode model: actual model) ].
			actual model class == JEPair
				ifTrue: [ visitedNodes at: actual model first put: (JEHypernode model: actual model first) ].
			actual families
				do: [ :family | 
					family
						reject: [ :node | visited at: node ifAbsent: [ false ] ]
						thenDo: [ :node | 
							visited at: node put: true.
							queue addLast: node ] ] ].
	visited := IdentityDictionary new: visited size.
	queue := JELinkedList with: aNode.
	visited at: aNode put: true.
	[ queue isEmpty ]
		whileFalse: [ | actual |
			actual := queue removeFirst.
			actual model class == JEItem
				ifTrue: [ actual families
						do: [ :family | 
							| sourceNodes |
							sourceNodes := family
								collect: [ :each | 
									visitedNodes
										at:
											(each model class == JEItem
												ifTrue: [ each model ]
												ifFalse: [ each model first ]) ].
							visitedEdges
								add:
									(JEDirectedHyperedge
										labeled: actual model rule asDefined
										sourceNodes: sourceNodes
										targetNode: (visitedNodes at: actual model)) ] ].
			actual model class == JEPair
				ifTrue: [ visitedEdges
						add:
							(JEDirectedHyperedge 
								labeled: actual model second 
								sourceNodes: #() 
								targetNode: (visitedNodes at: actual model first)) ].
			actual families
				do: [ :family | 
					family
						reject: [ :node | visited at: node ifAbsent: [ false ] ]
						thenDo: [ :node | 
							visited at: node put: true.
							queue addLast: node ] ] ].
	^ JEBTreeHypergraph root: (visitedNodes at: aNode model) nodes: visitedNodes hyperedges: visitedEdges