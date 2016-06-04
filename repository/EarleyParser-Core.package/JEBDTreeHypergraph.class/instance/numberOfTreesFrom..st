private
numberOfTreesFrom: aNode
	"depth visit from a node. return the number of trees from a given node"

	| numberOfTrees postNodeBlock postEdgeBlock |
	numberOfTrees := IdentityDictionary new: nodes size + edges size.
	postNodeBlock := [ :node | 
	(self backwardStarOf: node) isEmpty
		ifTrue: [ numberOfTrees at: node put: 1 ]
		ifFalse: [ 
			numberOfTrees
				at: node
				ifAbsentPut: [ (self backwardStarOf: node) inject: 0 into: [ :sum :edge | sum + (numberOfTrees at: edge) ] ] ] ].
	postEdgeBlock := [ :edge | 
		numberOfTrees 
			at: edge 
			ifAbsentPut: [ edge sourceNodes inject: 1 into: [ :product :node | product * (numberOfTrees at: node) ] ] ].
	self
		depthVisitFrom: aNode
		preNode: nil
		postNode: postNodeBlock
		preEdge: nil
		postEdge: postEdgeBlock.
	^ numberOfTrees at: aNode