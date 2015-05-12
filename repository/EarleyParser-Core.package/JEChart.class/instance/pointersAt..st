accessing
pointersAt: anItem
	^ pointers at: anItem ifAbsent: [ JELinkedList new ]