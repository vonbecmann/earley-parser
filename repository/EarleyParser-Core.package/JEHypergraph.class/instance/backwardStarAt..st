private
backwardStarAt: node
	^ backwardStar at: node ifAbsent: [ JELinkedList new ]