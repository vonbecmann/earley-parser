initialization
initializeNodes: aNodeCollection edges: anEdgeCollection
	self initialize.
	nodes := aNodeCollection.
	edges := anEdgeCollection.
	edges do: [ :each | self sourceNodesAt: each targetNode put: each sourceNodes ]