parsing
addEdgeWithSources: nodeCollection
	node
		addBackwardEdge: (JEDirectedHyperedge 
									labeled: self rule 
									sourceNodes: nodeCollection 
									targetNode: node)