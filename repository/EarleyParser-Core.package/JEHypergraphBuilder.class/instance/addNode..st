adding nodes
addNode: anObject
	| newNode |
	newNode := JEHypernode value: anObject.
	^ nodes jeAdd: newNode ifPresentDo: [ :elem | elem ]