visiting
visitPostOrderPackedNode: aPackedNode
	"visit in post-order a node"

	postOrderNodeBlock ifNotNil: [ postOrderNodeBlock value: aPackedNode ]