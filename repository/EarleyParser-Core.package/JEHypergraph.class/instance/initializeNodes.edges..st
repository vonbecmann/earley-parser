initialization
initializeNodes: aNodeCollection edges: anEdgeCollection
	self initialize.
	nodes := aNodeCollection.
	edges := anEdgeCollection.
	edges do: [ :each | self backwardStarAt: each targetNode put: each ]