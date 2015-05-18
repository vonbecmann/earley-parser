private
backwardStarAt: node put: edge
	(backwardStar at: node ifAbsentPut: [ JELinkedList new ]) add: edge