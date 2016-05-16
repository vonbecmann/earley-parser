initialization
initializeLabel: anObject sourceNodes: aNodeCollection targetNode: aNode
	self initialize.
	label := anObject.
	sourceNodes := aNodeCollection asArray.
	targetNode := aNode