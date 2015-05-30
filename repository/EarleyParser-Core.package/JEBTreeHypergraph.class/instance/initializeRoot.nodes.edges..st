initialization
initializeRoot: aNode nodes: aNodeCollection edges: anEdgeCollection
	self initializeNodes: aNodeCollection edges: anEdgeCollection.
	root := aNode.
	edges do: [ :each | sourceNodesByTarget at: each targetNode put: each sourceNodes ]