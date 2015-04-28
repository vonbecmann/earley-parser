private
edgesForTarget: node
	^ edges select: [ :edge | edge targetNode = node ]