private operations
addEdgeSourceNodes: firstItem and: secondItem toTargetNode: targetItem

	secondItem isEpsilon
		ifTrue: [ secondItem addFamily: JELinkedList new ].

	targetItem
		addFamily:
			(firstItem isPredicted
				ifTrue: [ JELinkedList with: secondItem node ]
				ifFalse: [ JELinkedList with: firstItem node with: secondItem node ])