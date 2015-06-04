adding nodes
addNode: aNode
	^ nodes jeAdd: (JEHypernode value: aNode) ifPresentDo: [ :elem | elem ]