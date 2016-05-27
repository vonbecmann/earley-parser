private operations
buildTreeRootedAtNode: aNode
	" breadth-first search "

	| visited visitedEdges visitedNodes hypernodes queue |
	visited := IdentityDictionary new.
	visitedEdges := JELinkedList new.
	visitedNodes := JELinkedList new.
	hypernodes := IdentityDictionary new.
	queue := JELinkedList with: aNode.
	visited at: aNode put: true.
	[ queue isEmpty ]
		whileFalse: [ | actual |
			actual := queue removeFirst.
			visitedNodes add: actual.
			actual model class == JEItem
				ifTrue: [ hypernodes at: actual model put: (JEHypernode model: actual model) ].
			actual model class == JEPair
				ifTrue: [ hypernodes at: actual model first put: (JEHypernode model: actual model first) ].
			actual families
				do: [ :family | 
					family
						reject: [ :node | visited at: node ifAbsent: [ false ] ]
						thenDo: [ :node | 
							visited at: node put: true.
							queue addLast: node ] ] ].
	visitedNodes
		do: [ :packed | 
			packed model class == JEItem
				ifTrue: [ packed families
						do: [ :family | 
							| sourceNodes |
							sourceNodes := family
								collect: [ :each | 
									hypernodes
										at:
											(each model class == JEItem
												ifTrue: [ each model ]
												ifFalse: [ each model first ]) ].
							visitedEdges
								add:
									(JEDirectedHyperedge 
										labeled: packed model rule asDefined 
										sourceNodes: sourceNodes 
										targetNode: (hypernodes at: packed model)) ] ].
			packed model class == JEPair
				ifTrue: [ visitedEdges add:
						(JEDirectedHyperedge 
							labeled: packed model second 
							sourceNodes: #() 
							targetNode: (hypernodes at: packed model first)) ] ].
	^ JEBTreeHypergraph root: (hypernodes at: aNode model) nodes: hypernodes hyperedges: visitedEdges