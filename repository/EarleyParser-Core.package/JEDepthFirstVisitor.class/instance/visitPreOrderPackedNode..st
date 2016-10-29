visiting
visitPreOrderPackedNode: aPackedNode
	"visit in pre-order a node"

	preNodeBlock ifNotNil: [ preNodeBlock value: aPackedNode ]