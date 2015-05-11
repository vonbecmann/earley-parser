adding
addPointerLabeled: aJESymbol from: anItem backTo: aPreviousItem downTo: aChildItem
	self
		pointersAt: anItem
		put:
			(JEPointer
				labeled: aJESymbol
				from: anItem
				backTo: aPreviousItem
				downTo: aChildItem)