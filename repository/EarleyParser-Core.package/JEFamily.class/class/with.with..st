instance creation
with: aPackedNode with: anotherPackedNode
	^ self basicNew initializeMembers: (OrderedPair first: aPackedNode second: anotherPackedNode)