accessing
depthVisitPreNode: preNodeBlock postNode: postNodeBlock
	(ESTDepthFirstVisitor withPreNode: preNodeBlock postNode: postNodeBlock) visit: root