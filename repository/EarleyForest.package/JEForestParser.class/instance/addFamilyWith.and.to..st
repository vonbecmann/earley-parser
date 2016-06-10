private operations
addFamilyWith: previousItem and: completeItem to: nextItem
	completeItem isEpsilon
		ifTrue: [ completeItem node addFamily: JEFamily empty ].
	nextItem
		addFamily:
			(previousItem isPredicted
				ifTrue: [ JEFamily with: completeItem node ]
				ifFalse: [ JEFamily with: previousItem node with: completeItem node ])