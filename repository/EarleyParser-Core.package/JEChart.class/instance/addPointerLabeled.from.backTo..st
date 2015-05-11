adding
addPointerLabeled: aJESymbol from: anItem backTo: aPreviousItem
	(edges at: anItem ifAbsentPut: [ JELinkedList new ])
		add: (JEPointer labeled: aJESymbol from: anItem backTo: aPreviousItem)