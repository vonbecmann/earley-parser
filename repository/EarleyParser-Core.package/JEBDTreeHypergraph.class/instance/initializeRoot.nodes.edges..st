initialization
initializeRoot: aNode nodes: aNodeCollection edges: anEdgeCollection
	self initialize.
	root := aNode.
	nodes := aNodeCollection asArray.
	edges := anEdgeCollection asArray.
	edges do: [ :each | backwardStar at: each targetNode put: each ]