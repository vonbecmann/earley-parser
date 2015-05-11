adding
addPointerLabeled: aJESymbol from: anItem backTo: aPreviousItem
	self pointersAt: anItem put: (JEPointer labeled: aJESymbol from: anItem backTo: aPreviousItem)