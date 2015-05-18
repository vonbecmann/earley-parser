initialization
initializeRoot: aNode nodes: aNodeCollection edges: anEdgeCollection
	self initialize.
	root := aNode.
	nodes := aNodeCollection.
	edges := anEdgeCollection.
	edges
		do: [ :each | 
			self sourceNodesAt: each targetNode put: each sourceNodes.
			self backwardStarAt: each targetNode put: each ]