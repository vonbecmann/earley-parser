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
			element class == JEHypernode
				ifTrue: [ (visited at: element)
						ifTrue: [ postNodeBlock ifNotNil: [ postNodeBlock value: element ].
							visitStack pop ]
						ifFalse: [ visited at: element put: true.
							preNodeBlock ifNotNil: [ preNodeBlock value: element ].
							element backwardStar do: [ :edge | visitStack push: edge ] ] ].
			element class == JEDirectedHyperedge
				ifTrue: [ (visited at: element)
						ifTrue: [ postEdgeBlock ifNotNil: [ postEdgeBlock value: element ].
							visitStack pop ]
						ifFalse: [ visited at: element put: true.
							preEdgeBlock ifNotNil: [ preEdgeBlock value: element ].
							element sourceNodes
								reverseDo: [ :node | 
									(visited at: node)
										ifFalse: [ visitStack push: node ] ] ] ] ]