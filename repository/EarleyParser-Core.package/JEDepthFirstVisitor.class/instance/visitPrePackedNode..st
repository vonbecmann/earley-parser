visiting
visitPrePackedNode: aPackedNode
	preNodeBlock ifNotNil: [ preNodeBlock value: aPackedNode ]