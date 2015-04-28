private
edgesFor: node
	^ edges select: [ :edge | edge targetNode = node ]