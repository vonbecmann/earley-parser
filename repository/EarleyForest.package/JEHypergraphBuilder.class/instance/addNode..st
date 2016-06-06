adding nodes
addNode: anObject
	^ nodes jeAt: anObject ifAbsentPut: (JEHypernode model: anObject)