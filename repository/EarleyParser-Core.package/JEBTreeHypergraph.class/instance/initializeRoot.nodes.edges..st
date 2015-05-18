initialization
initializeRoot: aNode nodes: aNodeCollection edges: anEdgeCollection
	super initializeNodes: aNodeCollection edges: anEdgeCollection.
	root := aNode.
	edges do: [ :each | self sourceNodesAt: each targetNode put: each sourceNodes ]