private
numberOfTreesFrom: aNode
	"depth visit from a node. return the number of trees from a given node"

	| numberOfTrees visited visitStack |
	numberOfTrees := IdentityDictionary new: nodes size + edges size.
	visited := IdentityDictionary new: nodes size + edges size.
	nodes do: [ :each | visited at: each put: false ].
	edges do: [ :each | visited at: each put: false ].
	visitStack := JEStack with: aNode.
	[ visitStack isEmpty ]
		whileFalse: [ 
			| elem |
			elem := visitStack top.
			elem class == JEHypernode
				ifTrue: [ 
					(visited at: elem)
						ifTrue: [ 
							numberOfTrees
								at: elem
								ifAbsentPut: [ elem backwardStar inject: 0 into: [ :sum :edge | sum + (numberOfTrees at: edge) ] ].
							visitStack pop ]
						ifFalse: [ 
							visited at: elem put: true.
							elem backwardStar isEmpty
								ifTrue: [ 
									numberOfTrees at: elem put: 1.
									visitStack pop ]
								ifFalse: [ elem backwardStar do: [ :edge | visitStack push: edge ] ] ] ].
			elem class == JEDirectedHyperedge
				ifTrue: [ 
					(visited at: elem)
						ifTrue: [ 
							numberOfTrees
								at: elem
								ifAbsentPut: [ elem sourceNodes inject: 1 into: [ :product :node | product * (numberOfTrees at: node) ] ].
							visitStack pop ]
						ifFalse: [ 
							visited at: elem put: true.
							elem sourceNodes isEmpty
								ifTrue: [ 
									numberOfTrees at: elem put: 1.
									visitStack pop ]
								ifFalse: [ elem sourceNodes reverseDo: [ :node | visitStack push: node ] ] ] ] ].
	^ numberOfTrees at: aNode