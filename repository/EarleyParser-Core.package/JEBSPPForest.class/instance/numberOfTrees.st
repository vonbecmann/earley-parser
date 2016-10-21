testing
numberOfTrees
	"depth visit from the root node. return the number of trees from the root node"

	| numberOfTrees |
	numberOfTrees := IdentityDictionary new.
	self
		depthVisitPreNode: nil
		postNode: [ :packed | 
			packed children isEmpty
				ifTrue: [ numberOfTrees at: packed put: 1 ]
				ifFalse: [ 
					numberOfTrees
						at: packed
						ifAbsentPut:	[ packed children inject: 0 into: [ :sum :family | sum + (numberOfTrees at: family) ] ] ] ]
		preFamily: nil
		postFamily: [ :family | 
			numberOfTrees
				at: family
				ifAbsentPut: [ family children inject: 1 into: [ :product :node | product * (numberOfTrees at: node) ] ] ].
	^ numberOfTrees at: root