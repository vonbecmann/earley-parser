accessing
pointersFrom: anItem
	^ pointers at: anItem ifAbsent: [ JELinkedList new ]