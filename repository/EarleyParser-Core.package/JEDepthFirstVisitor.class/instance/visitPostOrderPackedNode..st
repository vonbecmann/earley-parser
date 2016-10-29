visiting
visitPostOrderPackedNode: aPackedNode
	"visit in post-order a node"

	postNodeBlock ifNotNil: [ postNodeBlock value: aPackedNode ]