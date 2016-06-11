testing
numberOfTrees
	"depth visit from the root node. return the number of trees from the root node"

	| numberOfTrees postNodeBlock postFamilyBlock |
	numberOfTrees := IdentityDictionary new.
	postNodeBlock := [ :packed | 
	packed families isEmpty
		ifTrue: [ numberOfTrees at: packed put: 1 ]
		ifFalse: [ numberOfTrees at: packed ifAbsentPut: [ packed families inject: 0 into: [ :sum :family | sum + (numberOfTrees at: family) ] ] ] ].
	postFamilyBlock := [ :family | numberOfTrees at: family ifAbsentPut: [ family members inject: 1 into: [ :product :node | product * (numberOfTrees at: node) ] ] ].
	self
		depthVisitPreNode: nil
		postNode: postNodeBlock
		preFamily: nil
		postFamily: postFamilyBlock.
	^ numberOfTrees at: root