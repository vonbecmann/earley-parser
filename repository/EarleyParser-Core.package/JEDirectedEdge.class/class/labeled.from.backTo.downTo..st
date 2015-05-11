instance creation
labeled: aJESymbol from: anItem backTo: aPreviousItem downTo: aChildItem
	^ self basicNew
		initializeLabel: aJESymbol
		from: anItem
		backTo: aPreviousItem
		downTo: aChildItem