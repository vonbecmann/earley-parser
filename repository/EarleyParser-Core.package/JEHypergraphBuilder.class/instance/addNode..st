adding nodes
addNode: aNode
	^ nodes jeAdd: aNode ifPresentDo: [ :elem | elem ]