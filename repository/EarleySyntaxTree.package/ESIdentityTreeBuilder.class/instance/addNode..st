private
addNode: anObject
	^ nodes at: anObject ifAbsentPut: [ ESTreeNode model: anObject ]