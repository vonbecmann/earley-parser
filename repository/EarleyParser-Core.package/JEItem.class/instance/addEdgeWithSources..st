parsing
addEdgeWithSources: nodeCollection
	self node
		addBackwardEdge:
			(JEDirectedHyperedge 
				labeled: self rule 
				sourceNodes: nodeCollection 
				targetNode: self node)