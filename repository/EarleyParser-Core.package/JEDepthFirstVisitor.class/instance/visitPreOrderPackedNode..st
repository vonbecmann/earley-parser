visiting
visitPreOrderPackedNode: aPackedNode
	"visit in pre-order a node"

	preOrderNodeBlock ifNotNil: [ preOrderNodeBlock value: aPackedNode ]