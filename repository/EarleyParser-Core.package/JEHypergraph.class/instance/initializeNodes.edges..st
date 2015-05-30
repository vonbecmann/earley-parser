initialization
initializeNodes: aNodeCollection edges: anEdgeCollection
	self initialize.
	nodes := aNodeCollection.
	edges := anEdgeCollection.
	edges do: [ :each | backwardStar at: each targetNode put: each ]