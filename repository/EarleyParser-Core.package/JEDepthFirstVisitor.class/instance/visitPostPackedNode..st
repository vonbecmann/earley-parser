visiting
visitPostPackedNode: aPackedNode
	postNodeBlock ifNotNil: [ postNodeBlock value: aPackedNode ]