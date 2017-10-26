visiting
visitPreOrderPackedNode: aPackedNode
	"visit in pre-order a node"

	preOrderNodeBlock ifNotNil: [ preOrderNodeBlock cull: aPackedNode ]