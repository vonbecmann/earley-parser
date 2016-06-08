instance creation
with: aPackedNode with: anotherPackedNode
	^ self basicNew initializeMembers: (JEPair first: aPackedNode second: anotherPackedNode)