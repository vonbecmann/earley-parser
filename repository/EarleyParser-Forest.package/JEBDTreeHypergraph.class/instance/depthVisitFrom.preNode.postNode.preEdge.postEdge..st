private
depthVisitFrom: aNode preNode: preNodeBlock postNode: postNodeBlock preEdge: preEdgeBlock postEdge: postEdgeBlock
	| visitStack visited |
	visited := IdentityDictionary new: nodes size + edges size.
	nodes do: [ :each | visited at: each put: false ].
	edges do: [ :each | visited at: each put: false ].
	visitStack := JEStack with: aNode.
	[ visitStack isEmpty ]
		whileFalse: [ | element |
			element := visitStack top.
			(visited at: element)
				ifTrue: [ 
					visitStack pop.
					(postNodeBlock isNotNil and: [ element class == JEHypernode ]) ifTrue: [ postNodeBlock value: element ].
					(postEdgeBlock isNotNil and: [ element class == JEBDirectedHyperedge ]) ifTrue: [ postEdgeBlock value: element ] ]
				ifFalse: [ 
					visited at: element put: true.
					element class == JEHypernode
						ifTrue: [ 
							preNodeBlock ifNotNil: [ preNodeBlock value: element ].
							(self backwardStarOf: element) do: [ :edge | visitStack push: edge ] ].
					element class == JEBDirectedHyperedge
						ifTrue: [ 
							preEdgeBlock ifNotNil: [ preEdgeBlock value: element ].
							element sourceNodes
								reverseDo: [ :node | 
									(visited at: node)
										ifFalse: [ visitStack push: node ] ] ] ] ]