accessing
edgesFor: anItem
	^ edges at: anItem ifAbsent: [ JELinkedList new ]