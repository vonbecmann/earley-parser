initialization
initializeNodes: aNodeCollection edges: anEdgeCollection
	self initialize.
	nodes := aNodeCollection asArray.
	edges := anEdgeCollection asArray.
	edges do: [ :each | backwardStar at: each targetNode put: each ]