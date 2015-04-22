private
edgesFor: aNode
	^ edges select: [ :edge | edge includes: aNode ]