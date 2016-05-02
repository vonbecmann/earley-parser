accessing
indegreeOf: aNode
	^ (self backwardStarOf: aNode) size