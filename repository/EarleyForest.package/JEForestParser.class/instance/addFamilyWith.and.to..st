private operations
addFamilyWith: previousItem and: completeItem to: nextItem

	nextItem
		addFamily:
			(previousItem isPredicted
				ifTrue: [ JEFamily with: completeItem node ]
				ifFalse: [ JEFamily with: previousItem node with: completeItem node ])