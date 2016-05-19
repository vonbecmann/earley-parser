accessing
depthVisitPreNode: preNodeBlock postNode: postNodeBlock preEdge: preEdgeBlock postEdge: postEdgeBlock
	self
		depthVisitFrom: self root
		preNode: preNodeBlock
		postNode: postNodeBlock
		preEdge: preEdgeBlock
		postEdge: postEdgeBlock