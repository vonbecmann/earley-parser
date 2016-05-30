private operations
addFamilyWith: previousItem and: completeItem to: nextItem

	nextItem
		addFamily:
			(previousItem isPredicted
				ifTrue: [ JELinkedList with: completeItem node ]
				ifFalse: [ JELinkedList with: previousItem node with: completeItem node ])