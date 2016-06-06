adding edges
addEdgeSourceNodes: aCollection targetNode: anObject
	"adds a new hyperedge"

	edges
		add: (JEBDirectedHyperedge 
						sourceNodes: (aCollection collect: [ :each | (self addNode: each) ]) 
						targetNode: (self addNode: anObject))